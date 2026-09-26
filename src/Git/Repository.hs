module Git.Repository (GitRepository(..), isRepository) where

data GitRepository = GitRepository { repositoryRoot :: FilePath } deriving (Eq, Show)

isRepository :: FilePath -> Bool
isRepository path = not (null path)
