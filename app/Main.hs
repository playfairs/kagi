module Main where

import CLI.Command.Check (runCheck)
import CLI.Command.Hook (runHook)
import CLI.Command.Rules (runRules)
import CLI.Command.Scan (runScan)
import CLI.Options (Command(..), Options(..), parseOptions)
import System.Environment (getArgs)
import System.Exit (exitFailure)

main :: IO ()
main = do
    args <- getArgs
    case parseOptions args of
        Left err -> do
            putStrLn err
            exitFailure
        Right options ->
            case options of
                Options cmd _ ->
                    case cmd of
                        ScanCmd path -> runScan path
                        CheckCmd path -> runCheck path
                        HookCmd path -> runHook path
                        RulesCmd path -> runRules path
