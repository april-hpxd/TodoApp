# TodoApp

A simple **command-line To-Do List app** written in Haskell.  
This project allows you to manage tasks with a persistent JSON file.  

## Features
A simple command-line To-Do List app in Haskell.  
- Add tasks
- View all tasks
- Mark tasks as completed
- Delete tasks
- Tasks are saved to a `tasks.json` file, so they persist between runs

---

## How to Run

1. Make sure [Haskell Stack](https://docs.haskellstack.org/en/stable/README/) is installed.

2. Clone the repo or save the files in a folder. (Do not rename the files)

3. Open the project folder in terminal:
cd ./YourDirectory/TodoApp

stack setup
stack build
stack run

4. Follow the menu to manage your tasks.

## Example Usage
Choose an option: 2
Enter task description: Finish Haskell project

Choose an option: 1
1. [ ] Finish Haskell project

Choose an option: 3
Enter task ID to complete: 1

Choose an option: 1
1. [x] Finish Haskell project

## Tasks are saved in tasks.json automatically.

