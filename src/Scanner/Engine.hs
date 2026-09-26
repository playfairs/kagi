module Scanner.Engine (scanText, scanFile, scanPaths) where

import Core.Finding (Finding)
import Detector.Generic.Credential (detectCredential)
import Detector.Generic.Entropy (detectEntropy)
import Detector.Key.Private (detectPrivateKey)
import Detector.Provider.GitHub (detectGitHub)
import System.IO.Error (catchIOError)

scanText :: String -> [Finding]
scanText content = detectCredential content ++ detectEntropy content ++ detectPrivateKey content ++ detectGitHub content

scanFile :: FilePath -> IO [Finding]
scanFile path = do
    contents <- readFile path `catchIOError` const (pure "")
    pure (scanText contents)

scanPaths :: [FilePath] -> IO [Finding]
scanPaths paths = concat <$> mapM scanFile paths
