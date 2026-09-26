module Output.Terminal (renderTerminal) where

import Core.Finding (Finding(..))

renderTerminal :: [Finding] -> String
renderTerminal [] = "No secrets found.\n"
renderTerminal findings = unlines (map format findings)
  where
    format finding = findingFile finding ++ ":" ++ show (findingLine finding) ++ " " ++ findingTitle finding
