module CLI.Command.Rules (runRules) where

runRules :: FilePath -> IO ()
runRules path = putStrLn ("Rules for " ++ path ++ ": aws, github, slack, stripe, private-key")
