module Detector.Key.JWT (detectJwt) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isPrefixOf)

detectJwt :: String -> [Finding]
detectJwt content
    | "eyJ" `isPrefixOf` content =
        [makeFinding "jwt" "JWT-like token" Medium MediumConfidence "unknown" 1 "A JWT-like token was found."]
    | otherwise = []
