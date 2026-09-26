module File.Ignore (shouldIgnore) where

import Data.List (isInfixOf)

shouldIgnore :: FilePath -> Bool
shouldIgnore path =
    any (`isInfixOf` path)
        [ ".git"
        , "/.git/"
        , "/node_modules/"
        , "/target/"
        , "/dist/"
        , "/.venv/"
        , "/venv/"
        , "/__pycache__/"
        , "/.pytest_cache/"
        , "/.mypy_cache/"
        , "/.tox/"
        , "/build/"
        , ".DS_Store"
        ]
