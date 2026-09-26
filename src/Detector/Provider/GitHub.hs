module Detector.Provider.GitHub (detectGitHub) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isInfixOf)

detectGitHub :: String -> [Finding]
detectGitHub content
    | "ghp_" `isInfixOf` content || "gho_" `isInfixOf` content =
        [makeFinding "github-token" "GitHub token" High HighConfidence "unknown" 1 "A GitHub token pattern was detected."]
    | otherwise = []
