module Scanner.Worker (scanWorker) where

import Core.Finding (Finding)
import Scanner.Engine (scanText)

scanWorker :: [String] -> [Finding]
scanWorker = concatMap scanText
