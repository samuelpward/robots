Robots
======

Creation of a ruby class that simulates a robot in a 5x5 grid. It doesn't currently support any errors or feedback unless the REPORT command is issued. It supports stdin and comes with tests.

Robot Commands
--------------
It supports the following commands:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* Where F is one of NORTH, SOUTH, EAST, WEST

How To
------

``` ruby ./robots.rb ```
Starts the script and waits for input. You must place the robot first, it does not default to any position

``` ruby ./test.rb ```
This will run the test script with has some test cases as well as reading from the test.stdin file and checking the output
