module Main where

import Detector.Registry (Detector(..), DetectorId(..), makeDetector)
import Core.Finding (Finding)

main :: IO ()
main = do
    let detector = makeDetector "demo" "demo" (\_ -> [])
    if detectorId detector == DetectorId "demo"
        then putStrLn "Registry checks passed"
        else error "Registry checks failed"
