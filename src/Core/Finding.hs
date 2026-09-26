module Core.Finding (Finding(..), makeFinding, emptyFinding) where

import Core.Confidence (Confidence(..))
import Core.Severity (Severity(..))

data Finding = Finding
    { findingId :: String
    , findingTitle :: String
    , findingSeverity :: Severity
    , findingConfidence :: Confidence
    , findingFile :: FilePath
    , findingLine :: Int
    , findingMessage :: String
    } deriving (Eq, Show)

makeFinding :: String -> String -> Severity -> Confidence -> FilePath -> Int -> String -> Finding
makeFinding = Finding

emptyFinding :: Finding
emptyFinding = Finding "" "" Low LowConfidence "" 0 ""
