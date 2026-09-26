module Detector.Generic.Credential (detectCredential) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isInfixOf)

detectCredential :: String -> [Finding]
detectCredential content
    | "AKIA" `isInfixOf` content || "ASIA" `isInfixOf` content =
        [makeFinding "aws-access-key" "Possible AWS access key" High HighConfidence "unknown" 1 "A suspicious AWS access key pattern was found."]
    | otherwise = []
