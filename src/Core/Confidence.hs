module Core.Confidence (Confidence(..), confidenceLabel) where

data Confidence = LowConfidence | MediumConfidence | HighConfidence deriving (Eq, Ord, Enum, Show)

confidenceLabel :: Confidence -> String
confidenceLabel LowConfidence = "low"
confidenceLabel MediumConfidence = "medium"
confidenceLabel HighConfidence = "high"
