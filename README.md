# snake
Programming Fundamentals Assignment 2 - WIT

**Description of the animation achieved:**

Meet Sammy, the main character of Snake! This classical game has been around for centuries, now it's made its way to WIT.

The aim of the game is to eat the apple, when you eat the apple, you grow and get a point! The more apples you eat then longer you get which can become tricky because
the main objective is not to collide with yourself, can you do it?

This game has 3 main classes:
* Food Class - used to generate the apple at a random location and take care of moving it.
* Game Class - the heart of the game, looks after things like the menu bar, the grid and the scores.
* Snake Class - Sammy himself, this class makes sammy into a snake and is responsible to making him grow and move.

All classes include fields (variables) and a constructor and between the 3 classes there are many examples of getters and setters.

The snake class itself has a couple of primitive arrays to store the snakes body in which makes it much easier to tell where each piece of the body is on the grid later on.

The usual processing setup() and draw() functions are also used as well as nested if else statements and for loops.

I have also used a couple of Conditional (ternary) Operators in this game.

**Known bugs/problems:**

Thankfully there are only 2 apparent bugs. There are 2 small problems though:

_Problems:_

1. The game difficulties are based on frame rates, slower computers may not show this game to its true potential due to graphical performance.
2. The snake gets rather large rather quick, therefore it can be a problem with the mirror effect some times as it can collide with itself if it goes over 25 ( as there are only 25 squares in the grid).

_Bugs:_

1. Theres a one in a thousand chance the apple spawns off the screen. Even though I have a check in place to prevent this.
2. The snake collision detection isn't allowing the snake to go backwards quickly. This is proving tricky for hair pin turns when playing.
