module Analysis.Classification (FileClassification(..), classifyPath, classifyContent) where

import Data.List (isInfixOf, isSuffixOf)

data FileClassification = TextFile | BinaryFile | IgnoredFile | UnknownFile deriving (Eq, Show)

classifyPath :: FilePath -> FileClassification
classifyPath path
    | any (`isInfixOf` path) [".git", "/node_modules/", "/target/"] = IgnoredFile
    | any (`isSuffixOf` path) [".png", ".jpg", ".jpeg", ".gif", ".pdf", ".exe", ".dll", ".so", ".bin"] = BinaryFile
    | otherwise = TextFile

classifyContent :: String -> FileClassification
classifyContent content
    | any (== '\0') content = BinaryFile
    | otherwise = TextFile
