module Detector.Key.Private (detectPrivateKey) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isInfixOf)

detectPrivateKey :: String -> [Finding]
detectPrivateKey content
    | "BEGIN PRIVATE KEY" `isInfixOf` content =
        [makeFinding "private-key" "Private key material" Critical HighConfidence "unknown" 1 "Private key content was detected."]
    | otherwise = []
