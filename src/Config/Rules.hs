module Config.Rules (Rule(..), defaultRules) where

data Rule = Rule
    { ruleName :: String
    , rulePattern :: String
    } deriving (Eq, Show)

defaultRules :: [Rule]
defaultRules =
    [ Rule "aws-access-key" "AKIA"
    , Rule "github-token" "ghp_"
    , Rule "private-key" "BEGIN PRIVATE KEY"
    ]
