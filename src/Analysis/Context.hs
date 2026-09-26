module Analysis.Context (ScanContext(..), withContext) where

data ScanContext = ScanContext
    { contextPath :: FilePath
    , contextEntries :: [String]
    } deriving (Eq, Show)

withContext :: FilePath -> [String] -> ScanContext
withContext path entries = ScanContext path entries
