module Main where

import Analysis.Classification (FileClassification(..), classifyPath)

main :: IO ()
main = do
    if classifyPath "/tmp/secret.txt" == TextFile && classifyPath "/tmp/image.png" == BinaryFile
        then putStrLn "Classification checks passed"
        else error "Classification checks failed"
