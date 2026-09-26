module Output.SARIF (renderSarif) where

import Core.Finding (Finding(..))

renderSarif :: [Finding] -> String
renderSarif findings = "{\"runs\":[{\"results\": [" ++ foldr joiner "" findings ++ "]}]}"
  where
    joiner finding acc = renderSingle finding ++ if null acc then "" else "," ++ acc
    renderSingle finding = "{\"ruleId\":\"" ++ findingId finding ++ "\"}"
