module Main where

import Git.Repository (GitRepository(..), isRepository)

main :: IO ()
main = do
    if isRepository "." && repositoryRoot (GitRepository ".") == "."
        then putStrLn "Git repository checks passed"
        else error "Git repository checks failed"
