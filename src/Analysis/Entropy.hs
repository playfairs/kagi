module Analysis.Entropy (shannonEntropy, entropyScore) where

import Data.Char (isAlphaNum)
import Data.List (group, sort)

shannonEntropy :: String -> Double
shannonEntropy = entropyScore

entropyScore :: String -> Double
entropyScore input =
    let filtered = filter isAlphaNum input
        total = fromIntegral (length filtered)
    in if total == 0
        then 0
        else let counts = map length (group (sort filtered))
                 weights = map (/ total) (map fromIntegral counts)
             in -sum (map (\p -> p * logBase 2 p) weights)
