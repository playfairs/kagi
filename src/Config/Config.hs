module Config.Config (Config(..), defaultConfig) where

data Config = Config
    { configRoot :: FilePath
    , configIgnorePatterns :: [String]
    , configRules :: [String]
    } deriving (Eq, Show)

defaultConfig :: FilePath -> Config
defaultConfig root = Config root [".git", "node_modules", "dist", "target"] []
