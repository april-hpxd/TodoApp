{-# LANGUAGE DeriveGeneric #-}

module Task
  ( Task(..)
  , addTask
  , completeTask
  , deleteTask
  , listTasks
  , saveTasks
  , loadTasks
  ) where

import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON, encode, decode)
import qualified Data.ByteString.Lazy as B
import System.Directory (doesFileExist)

data Task = Task
  { taskId :: Int
  , description :: String
  , done :: Bool
  } deriving (Show, Generic)

instance ToJSON Task
instance FromJSON Task

addTask :: [Task] -> String -> [Task]
addTask tasks desc =
  let newId = if null tasks then 1 else taskId (last tasks) + 1
  in tasks ++ [Task newId desc False]

completeTask :: [Task] -> Int -> [Task]
completeTask tasks tid =
  [ if taskId t == tid then t { done = True } else t | t <- tasks ]

deleteTask :: [Task] -> Int -> [Task]
deleteTask tasks tid = filter (\t -> taskId t /= tid) tasks

listTasks :: [Task] -> IO ()
listTasks [] = putStrLn "No tasks yet!"
listTasks tasks = mapM_ printTask tasks
  where
    printTask (Task i d True)  = putStrLn $ show i ++ ". [x] " ++ d
    printTask (Task i d False) = putStrLn $ show i ++ ". [ ] " ++ d

saveTasks :: FilePath -> [Task] -> IO ()
saveTasks file tasks = B.writeFile file (encode tasks)

loadTasks :: FilePath -> IO [Task]
loadTasks file = do
  exists <- doesFileExist file
  if not exists
    then return []
    else do
      content <- B.readFile file
      case decode content of
        Just tasks -> return tasks
        Nothing -> return []
