module Detector.Provider.Stripe (detectStripe) where

import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))
import Data.List (isInfixOf)

detectStripe :: String -> [Finding]
detectStripe content
    | "sk_live_" `isInfixOf` content =
        [makeFinding "stripe-key" "Stripe secret key" High HighConfidence "unknown" 1 "A Stripe secret key pattern was detected."]
    | otherwise = []
