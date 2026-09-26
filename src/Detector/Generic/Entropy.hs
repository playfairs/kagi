module Detector.Generic.Entropy (detectEntropy) where

import Analysis.Entropy (entropyScore)
import Core.Confidence (Confidence(..))
import Core.Finding (Finding, makeFinding)
import Core.Severity (Severity(..))

detectEntropy :: String -> [Finding]
detectEntropy content
    | entropyScore content > 4.5 =
        [makeFinding "high-entropy" "High entropy token" Medium HighConfidence "unknown" 1 "A high entropy string may be a secret."]
    | otherwise = []
