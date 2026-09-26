module Detector.Provider.AWS (detectAws) where

import Core.Finding (Finding)
import Detector.Generic.Credential (detectCredential)

detectAws :: String -> [Finding]
detectAws = detectCredential
