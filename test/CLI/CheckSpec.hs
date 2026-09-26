module Main where

import CLI.Command.Check (runCheck)
import System.Directory (createDirectoryIfMissing, doesDirectoryExist, removeDirectoryRecursive)

main :: IO ()
main = do
    let target = "/tmp/kagi-check-spec"
    createDirectoryIfMissing True target
    writeFile (target ++ "/sample.txt") "AKIA1234567890EXAMPLE\n"
    runCheck target
    exists <- doesDirectoryExist target
    if exists
        then do
            removeDirectoryRecursive target
            putStrLn "Check directory handling passed"
        else error "Check directory handling failed"
