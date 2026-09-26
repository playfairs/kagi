module Detector.Registry (Detector(..), DetectorId(..), makeDetector) where

import Core.Finding (Finding)

data DetectorId = DetectorId String deriving (Eq, Show)

data Detector = Detector
    { detectorId :: DetectorId
    , detectorName :: String
    , detectorRun :: String -> [Finding]
    }

instance Show Detector where
    show detector = "Detector {detectorId = " ++ show (detectorId detector) ++ ", detectorName = " ++ show (detectorName detector) ++ "}"

makeDetector :: String -> String -> (String -> [Finding]) -> Detector
makeDetector id_ name run = Detector (DetectorId id_) name run
