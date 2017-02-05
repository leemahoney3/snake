import javax.swing.*;

// Define classes.
Food food;
Game game;
Snake snake;

void setup() {

  // Generic setup.
  size(450, 450);
  background(255);

  smooth();
  ellipseMode(CORNER);

  // Load classes.
  food    = new Food(90, 90);
  snake   = new Snake();
  game    = new Game();

}

void draw() {

  // 3 different game stages, main menu, the actual game, and the game over screen.
  switch (game.grabStage()) {

    case "mainMenuScreen": 
      game.showMainMenuScreen(); // Show the main menu.
      break;

    case "gameScreen":

      
      if (game.running()) { // check if the game is running.

        game.drawGameScreen(); // draw the game screen (the grid in which the snake relys on).
        game.trackDifficulty(); // Constantly check if the player changes the difficulty, if they do then change frameRate.

        snake.move(); // Move the snake.
        snake.displayHead(); // Display the snake's head.
        snake.displayBody(); // Display the snake's body.
        snake.checkCollision(); // Check for collisions with the snake.

        // Check if the snake has ate the food.
        if (snake.getX() == food.getX() && snake.getY() == food.getY()) {

          // Update player's score and high score.
          game.updateScore(1);
          game.updateHighscore(1);
          
          // Add a piece of body on to the snake.
          snake.addBodyPart();
          
          // Generate random co-ordinates for the food to be respawned.
          int randX = int(random(0, 30)) * 15;
          int randY = int(random(1, 30)) * 15;
           
          // place the food on the map
          food.setPosition(randX, randY);

        }
        
        // And display it
        food.display();

        game.drawGameMenu(); // draw the game menu (with the score, high score and difficulty shown on it).

      }

    break;

    case "gameOverScreen":
      game.showGameOverScreen(); // Show the game over screen.
      break;

  }

}


void keyPressed() {
  game.detectKeyPress(); // There are a couple of keystrokes used in this game, an easier way to handle them.
}

void mousePressed() {
  game.detectMousePress(); // Detect if a mouse has been pressed.
}