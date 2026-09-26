module CLI.Command.Hook (runHook) where

runHook :: FilePath -> IO ()
runHook path = putStrLn ("Hook is ready for " ++ path ++ ".")
