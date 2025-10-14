module Main where

import Task
import System.IO (hFlush, stdout)

file :: FilePath
file = "tasks.json"

main :: IO ()
main = do
  putStrLn "Welcome to Haskell To-Do List!"
  tasks <- loadTasks file
  loop tasks

loop :: [Task] -> IO ()
loop tasks = do
  putStrLn "\nChoose an option:"
  putStrLn "1. View tasks"
  putStrLn "2. Add task"
  putStrLn "3. Complete task"
  putStrLn "4. Delete task"
  putStrLn "5. Exit"
  putStr "Enter choice: "
  hFlush stdout
  choice <- getLine
  case choice of
    "1" -> do
      listTasks tasks
      loop tasks
    "2" -> do
      putStr "Enter task description: "
      hFlush stdout
      desc <- getLine
      let newTasks = addTask tasks desc
      saveTasks file newTasks
      loop newTasks
    "3" -> do
      putStr "Enter task ID to complete: "
      hFlush stdout
      tid <- readLn
      let updated = completeTask tasks tid
      saveTasks file updated
      loop updated
    "4" -> do
      putStr "Enter task ID to delete: "
      hFlush stdout
      tid <- readLn
      let updated = deleteTask tasks tid
      saveTasks file updated
      loop updated
    "5" -> putStrLn "Goodbye!"
    _   -> do
      putStrLn "Invalid option!"
      loop tasks
