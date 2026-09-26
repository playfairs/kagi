module CLI.Parser (parseArgs) where

import CLI.Options (Options, parseOptions)

parseArgs :: [String] -> Either String Options
parseArgs = parseOptions
