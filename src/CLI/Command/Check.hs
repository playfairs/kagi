module CLI.Command.Check (runCheck) where

import Analysis.Entropy (entropyScore)
import Core.Confidence (Confidence(..))
import Core.Finding (Finding(..), makeFinding)
import Core.Severity (Severity(..))
import Data.Char (toLower)
import Data.List (isInfixOf, isPrefixOf)
import File.Ignore (shouldIgnore)
import System.Directory (doesDirectoryExist, doesFileExist, listDirectory)
import System.FilePath ((</>))
import System.IO.Error (catchIOError)

lineFinding :: FilePath -> Int -> String -> [Finding]
lineFinding filePath lineNo line
    | "discord.com/api/webhooks" `isInfixOf` line || "/api/webhooks/" `isInfixOf` line || "webhook" `isInfixOf` map toLower line =
        [makeFinding "discord-webhook" "Discord webhook URL" Critical HighConfidence filePath lineNo "Discord webhook URL detected."]
    | "AKIA" `isInfixOf` line || "ASIA" `isInfixOf` line =
        [makeFinding "aws-access-key" "Possible AWS access key" High HighConfidence filePath lineNo "A suspicious AWS access key pattern was found."]
    | "ghp_" `isInfixOf` line || "gho_" `isInfixOf` line =
        [makeFinding "github-token" "GitHub token" High HighConfidence filePath lineNo "A GitHub token pattern was detected."]
    | "xoxb-" `isInfixOf` line =
        [makeFinding "slack-token" "Slack token" High HighConfidence filePath lineNo "A Slack token pattern was detected."]
    | "sk_live_" `isInfixOf` line =
        [makeFinding "stripe-key" "Stripe secret key" High HighConfidence filePath lineNo "A Stripe secret key pattern was detected."]
    | "BEGIN PRIVATE KEY" `isInfixOf` line =
        [makeFinding "private-key" "Private key material" Critical HighConfidence filePath lineNo "Private key content was detected."]
    | "eyJ" `isPrefixOf` line =
        [makeFinding "jwt" "JWT-like token" Medium MediumConfidence filePath lineNo "A JWT-like token was found."]
    | any (\needle -> needle `isInfixOf` map toLower line) ["password", "secret", "token"] && entropyScore line > 4.5 =
        [makeFinding "high-entropy" "High entropy token" Medium HighConfidence filePath lineNo "A high entropy string may be a secret."]
    | otherwise = []

scanTextWithLines :: FilePath -> String -> [Finding]
scanTextWithLines filePath content =
    concatMap (\(lineNo, line) -> lineFinding filePath lineNo line) (zip [1 ..] (lines content))

checkEntry :: FilePath -> IO [Finding]
checkEntry path = do
    isFile <- doesFileExist path
    isDir <- doesDirectoryExist path
    if shouldIgnore path
        then pure []
        else if isFile
            then do
                contents <- readFile path `catchIOError` const (pure "")
                pure (scanTextWithLines path contents)
            else if isDir
                then do
                    entries <- listDirectory path
                    let childPaths = map (path </>) entries
                    concat <$> mapM checkEntry childPaths
                else pure []

printFinding :: Finding -> IO ()
printFinding finding =
    putStrLn (findingFile finding ++ ":" ++ show (findingLine finding) ++ " " ++ findingTitle finding)

runCheck :: FilePath -> IO ()
runCheck path = do
    fileExists <- doesFileExist path
    dirExists <- doesDirectoryExist path
    if fileExists
        then do
            findings <- checkEntry path
            if null findings
                then putStrLn "Check passed: no obvious secrets found."
                else do
                    putStrLn ("Check found " ++ show (length findings) ++ " pattern(s).")
                    mapM_ printFinding findings
        else if dirExists
            then do
                findings <- checkEntry path
                if null findings
                    then putStrLn "Check passed: no obvious secrets found."
                    else do
                        putStrLn ("Check found " ++ show (length findings) ++ " pattern(s).")
                        mapM_ printFinding findings
            else putStrLn ("Path not found: " ++ path)
