# Tic Tac Toe

## Intro

This is the [first project](http://www.theodinproject.com/courses/ruby-programming/lessons/oop) in the Intermediate Ruby section of The Odin Project

Build a tic-tac-toe game on the command line where two human players can play
against each other and the board is displayed in between turns.

1. Think about how you would set up the different elements within the game...
   What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
2. Build your game, taking care to not share information between classes any more than you have to.

## Pseudocode

```
enter game loop
  If this is the first game set the score to 0-0 and ask player if they want to be x or o 
    If they choose x, they go first. otherwise the computer goes first
  If this is not the first game, increment the winner's score and ask if the player wants
  to keep playing
    If they say yes, swap x and o, x goes first. otherwise display the score and exit.
  
  clear the board
  
  enter play loop
    player one places a piece
      computer uses minmax/human uses gets
    check board for a winner or tie
    break if there is a winner or tie
    player two places a piece
      computer uses minmax/human uses gets
    check board for a winner or tie
    break if there is a winner or tie
  play loop
  
  display winner or tie
  
game loop
```
## Proposed Classes

* Player
* Piece
* Board
* Game
