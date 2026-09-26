module Main where

import Scanner.Engine (scanText)

main :: IO ()
main = do
    if null (scanText "no secrets here")
        then putStrLn "Scanner checks passed"
        else error "Scanner checks failed"
