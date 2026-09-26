module Core.Severity (Severity(..), severityLabel, severityRank) where

data Severity = Low | Medium | High | Critical deriving (Eq, Ord, Enum, Show)

severityLabel :: Severity -> String
severityLabel Low = "low"
severityLabel Medium = "medium"
severityLabel High = "high"
severityLabel Critical = "critical"

severityRank :: Severity -> Int
severityRank = fromEnum
