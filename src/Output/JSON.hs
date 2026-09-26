module Output.JSON (renderJson) where

import Core.Finding (Finding(..))

renderJson :: [Finding] -> String
renderJson findings = "[" ++ foldr joiner "" findings ++ "]"
  where
    joiner finding acc = renderSingle finding ++ if null acc then "" else "," ++ acc
    renderSingle finding = "{\"id\":\"" ++ findingId finding ++ "\",\"file\":\"" ++ findingFile finding ++ "\"}"
