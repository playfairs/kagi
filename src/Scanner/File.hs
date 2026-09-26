module Scanner.File (scanFile) where

import Core.Finding (Finding)
import qualified Scanner.Engine as Engine

scanFile :: FilePath -> IO [Finding]
scanFile = Engine.scanFile
