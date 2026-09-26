module Scanner.Repository (scanRepository) where

import Core.Finding (Finding)
import Scanner.Engine (scanText)
import System.IO.Error (catchIOError)

scanRepository :: FilePath -> IO [Finding]
scanRepository path = do
    contents <- readFile path `catchIOError` const (pure "")
    pure (scanText contents)
