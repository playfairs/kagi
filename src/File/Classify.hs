module File.Classify (FileClassification(..), classifyFile) where

import Analysis.Classification (FileClassification(..), classifyPath)

classifyFile :: FilePath -> FileClassification
classifyFile = classifyPath
