module File.Text (readTextFile) where

import Control.Exception (IOException, try)

readTextFile :: FilePath -> IO (Maybe String)
readTextFile path = do
    result <- try (readFile path) :: IO (Either IOException String)
    pure (either (const Nothing) Just result)
