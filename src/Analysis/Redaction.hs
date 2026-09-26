module Analysis.Redaction (redactValue) where

redactValue :: String -> String
redactValue value =
    if null value
        then ""
        else take 4 value ++ "[redacted]"
