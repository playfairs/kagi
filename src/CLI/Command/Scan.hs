module CLI.Command.Scan (runScan) where

import Core.Finding (Finding(..))
import Detector.Generic.Credential (detectCredential)
import Detector.Generic.Entropy (detectEntropy)
import Detector.Key.Private (detectPrivateKey)
import Detector.Provider.GitHub (detectGitHub)
import Detector.Provider.Slack (detectSlack)
import Detector.Provider.Stripe (detectStripe)
import Output.Terminal (renderTerminal)
import System.Directory (doesDirectoryExist, doesFileExist, listDirectory)
import System.FilePath ((</>))
import System.IO.Error (catchIOError)

scanFileContent :: FilePath -> IO [Finding]
scanFileContent path = do
    content <- readFile path `catchIOError` const (pure "")
    pure (detectCredential content ++ detectEntropy content ++ detectPrivateKey content ++ detectGitHub content ++ detectSlack content ++ detectStripe content)

scanEntry :: FilePath -> IO [Finding]
scanEntry path = do
    isFile <- doesFileExist path
    isDir <- doesDirectoryExist path
    if isFile
        then scanFileContent path
        else if isDir
            then do
                entries <- listDirectory path
                let childPaths = map (path </>) entries
                concat <$> mapM scanEntry childPaths
            else pure []

runScan :: FilePath -> IO ()
runScan path = do
    fileExists <- doesFileExist path
    dirExists <- doesDirectoryExist path
    if fileExists
        then do
            findings <- scanFileContent path
            putStr (renderTerminal findings)
            if null findings
                then putStrLn "No secrets found in the selected path."
                else putStrLn ("Found " ++ show (length findings) ++ " potential secret(s).")
        else if dirExists
            then do
                findings <- scanEntry path
                putStr (renderTerminal findings)
                if null findings
                    then putStrLn "No secrets found in the selected directory."
                    else putStrLn ("Found " ++ show (length findings) ++ " potential secret(s) in the selected directory.")
            else putStrLn ("Path not found: " ++ path)
