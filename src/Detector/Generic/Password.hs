module Detector.Generic.Password (detectPassword) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.Char (toLower)
import Data.List (isInfixOf)

detectPassword :: String -> [Finding]
detectPassword content
    | "password" `isInfixOf` map toLower content =
        [makeFinding "password" "Password-like assignment" Medium MediumConfidence "unknown" 1 "A password-like value appears in plaintext."]
    | otherwise = []
