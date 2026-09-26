module File.Binary (isBinary) where

isBinary :: String -> Bool
isBinary = any (== '\0')
