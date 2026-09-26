module Core.Result (ScanResult(..), emptyScanResult, addFinding) where

import Core.Finding (Finding(..))

data ScanResult = ScanResult
    { scanFindings :: [Finding]
    , scannedFiles :: Int
    , scannedBytes :: Int
    } deriving (Eq, Show)

emptyScanResult :: ScanResult
emptyScanResult = ScanResult [] 0 0

addFinding :: Finding -> ScanResult -> ScanResult
addFinding finding result = result { scanFindings = finding : scanFindings result }
