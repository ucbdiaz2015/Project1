# Goals
The goals of this assignment are the following:

1. Learn the basics of Swift
1. Learn how to write and use unit tests
1. Become familiar with Xcode

## Getting Started
1. Fork the following repository: https://github.com/talentsparkio/Project1
2. Open the project in Xcode and take a look at **Project1/Project1.swift** and **Project1Test/Project1Test.swift** files. The implementation code will be in **Project1/Project1.swift** and all the accompanying tests will be in **Project1Test/Project1Test.swift**.
3. To run all the tests make sure the *Scheme* is on **Project1Tests** then navigate to **Product->Test** or press **⌘+u** shortcut. All the tests will fail but as you start implementing the project, you'll notice that the tests will start passing. All tests should pass for the assignment to be complete.

## Problem 1 - Game of Life
The first problem is implementing the Game of Life. You can find out more information about Game of Life [here](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). The basic rules are:

> 1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
> 1. Any live cell with two or three live neighbours lives on to the next generation.
> 1. Any live cell with more than three live neighbours dies, as if by overcrowding.
> 1. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Your job is to implement ```nextCellStates(currentStates: [[Bool]]) -> [[Bool]]``` function which takes a **m** by **n** matrix of booleans which specify which cell is alive or dead (alive cells are true, dead are false). Your job is to return a **m** by **n** matrix of booleans that represents the next cell states according to the above rules. There is already one test case written for Game of life. Once your algorithm is written, make sure that test passes. You can also add your own test cases for different scenarios and make sure that your algorithm is behaving correctly.


## Problem 2 - LRU Cache
The objective for this problem is to create a working implementation of LRU Cache. The skeleton is already created for you in *Project1/Project1.swift*. Your job is to implement the ```get``` and ```set``` methods. As with the first problem, make sure all the tests pass and add more to test different edge cases.
