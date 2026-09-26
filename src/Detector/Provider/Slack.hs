module Detector.Provider.Slack (detectSlack) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isInfixOf)

detectSlack :: String -> [Finding]
detectSlack content
    | "xoxb-" `isInfixOf` content =
        [makeFinding "slack-token" "Slack token" High HighConfidence "unknown" 1 "A Slack token pattern was detected."]
    | otherwise = []
