module CLI.Options (Command(..), Options(..), parseOptions) where

data Command = ScanCmd FilePath | CheckCmd FilePath | HookCmd FilePath | RulesCmd FilePath deriving (Eq, Show)

data Options = Options
    { command :: Command
    , verbose :: Bool
    } deriving (Eq, Show)

parseOptions :: [String] -> Either String Options
parseOptions [] = Left "usage: kagi <scan|check|hook|rules> <path>"
parseOptions (cmd:rest) =
    case cmd of
        "scan" -> case rest of
            [] -> Left "missing scan path"
            (path:_) -> Right (Options (ScanCmd path) False)
        "check" -> case rest of
            [] -> Left "missing check path"
            (path:_) -> Right (Options (CheckCmd path) False)
        "hook" -> case rest of
            [] -> Left "missing hook path"
            (path:_) -> Right (Options (HookCmd path) False)
        "rules" -> case rest of
            [] -> Left "missing rules path"
            (path:_) -> Right (Options (RulesCmd path) False)
        _ -> Left ("unknown command: " ++ cmd)
