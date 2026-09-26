module Config.Ignore (IgnoreRule(..), shouldIgnorePath) where

import Data.List (isInfixOf)

data IgnoreRule = IgnoreRule { ignorePattern :: String } deriving (Eq, Show)

shouldIgnorePath :: [IgnoreRule] -> FilePath -> Bool
shouldIgnorePath rules path = any (\rule -> ignorePattern rule `isInfixOf` path) rules
