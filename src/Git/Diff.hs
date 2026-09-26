module Git.Diff (diffSummary) where

diffSummary :: String -> String
diffSummary diff = "diff: " ++ diff
