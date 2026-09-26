module Main where

import Core.Severity (Severity(..), severityLabel, severityRank)

main :: IO ()
main = do
    if severityLabel High == "high" && severityRank Critical == 3
        then putStrLn "Severity checks passed"
        else error "Severity checks failed"
