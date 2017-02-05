// Game class: Handles all the nitty gritty parts of the game, stages, resetting, score keeping etc..
public class Game {

  // Couple of variables.
  private int gridSize            = 450; // in pixels not squares, both length and width.
  private int squareSize          = 15; // square size in pixels.
  private int score               = 0, // default score of 0.
              highScore           = 0; // default high score of 0.
 
  private String gameStage        = "mainMenuScreen"; // default game stage.
  private String difficulty       = "Easy"; // default difficulty.
  private String playerName       = "Stranger";

  private boolean gameRunning     = false; // default game state is not running as defauly stage is the main menu (don't want it running in the background).

  private PImage mainMenu, // variable to be assigned to the image used for the main menu.
                 gameOver; // variable to be assigned to the image used for the game over screen. 
 
  // Constructor: called when the class is initialized.
  public Game() {

    mainMenu = loadImage("mainMenu.png"); // load the image in for the main menu.
    gameOver = loadImage("gameOver.png"); // load the image in for the game over screen.

  }

  // draw the actual grid.
  public void drawGameScreen() {

    for(int i = 0; i <= gridSize; i += 15) { // across the screen.

      for(int j = 30; j <= gridSize; j += 15) { // then down the screen.
 
        fill(255); // fill the squares as white.
        stroke(250); // with a slight gray stroke.
        rect(i, j, this.squareSize, this.squareSize); // draw the actual square.

      }

    }

  }
 
  // The main menu at the top of the screen that displays the score, high score and difficulty.
  public void drawGameMenu() {

    noStroke(); // no stroke.
    fill(#DC7A7B); // background.
    rect(0, 0, 450, 30); // actual shape.

    textSize(12); // set the size of the font.
    textAlign(CENTER); // center align the font.
    fill(255); // set the color of the font.

    // High Score.
    text("High Score: " + this.highScore, 60, 18);

    // Score.
    text("Score: " + this.score, width / 2, 18);
 
    // Difficulty.
    text("Difficulty: " + this.difficulty, width - 70, 18);

  }
  
  // Show the main menu screen.
  public void showMainMenuScreen() {

    // Just an image.
    image(this.mainMenu, 0, 0);
    
    // Get player's name.
    if (this.playerName == "Stranger") {
      String playerName = JOptionPane.showInputDialog(null, "Hello There, Stranger!\n\n Please enter your name: ", "Snake!", JOptionPane.INFORMATION_MESSAGE);
      this.setPlayerName(playerName);
    }
    
    

  }

  // Show the game over screen.
  public void showGameOverScreen() {

    // Display the image.
    image(this.gameOver, 0, 0);

    // But dont forget the score and high score.
    textSize(22);
    textAlign(CENTER);
    fill(#4c4c4c);

    // Score.
    text("Hey, " + this.playerName + "! You scored " + score + " points", width / 2, 290);

    // High Score.
    text("Your current High Score is " + highScore + " points", width / 2, 350);

  }

  // Keep tabs on the difficulty the player selects.
  public void trackDifficulty() {

    if (this.difficulty == "Easy") { // if easy then change the frame rate to 15.
      
      frameRate(15);
      
    } else if (this.difficulty == "Medium") { // if medium then change the frame rate to 20.

      frameRate(20); 

    } else if (this.difficulty == "Hard") { // if hard then change the frame rate to 30.
      
      frameRate(30);
    }

  }

  // This is called when a key is pressed. Handles the checking of which key is pressed and does the correct action.
  public void detectKeyPress() {

    if (key == ' ' && this.grabStage() == "mainMenuScreen") { // If space key and on main menu, then start the game.

      this.setStage("gameScreen"); // set the stage to the game screen.
      this.gameRunning = true; // run the game.

    } else if (key == 'p') { // if the key is p, pause the game.

      this.pause(); // call the pause method.

    } else if (key == 'r') { // if the key is r, reset the game.

      this.reset(); // call the reset method.
      this.setStage("mainMenuScreen"); // set the stage to the main menu.

    } else if (keyCode == UP) { // if the up arrow key is pressed.
      
      snake.move("up"); // call the move method in the snake class and pass in the param: up.
    
    } else if (keyCode == DOWN) { // if the down arrow key is pressed.

      snake.move("down"); // call the move method in the snake class and pass in the param: down.

    } else if (keyCode == LEFT) { // if the left arrow key is pressed.

      snake.move("left"); // call the move method in the snake class and pass in the param: left.

    } else if (keyCode == RIGHT) { // if the right arrow key is pressed.
       
      snake.move("right"); // call the move method in the snake class and pass in the param: right.
    
    } else if (key == '+') { // Increase difficulty if the + key is pressed.

      // Determine what difficulty the game is currently set at.
      switch (this.difficulty) {

        // If easy then change to medium.
        case "Easy":
          this.difficulty = "Medium";
          break;
 
        // If medium then change to hard.
        case "Medium":
          this.difficulty = "Hard";
          break;

        // Otherwise change to easy.
        default:
          this.difficulty = "Easy";
          break;

      }

    } else if (key == '-') { // Decrease difficulty if the - key is pressed.

      // Determine what difficulty the game is currently set at.
      switch (this.difficulty) {

        // If hard then change to medium.
        case "Hard":
          this.difficulty = "Medium";
          break;
 
        // If medium then change to easy.
        case "Medium":
          this.difficulty = "Easy";
          break;

        // Otherwise change to hard.
        default:
          this.difficulty = "Hard";
          break;
 
      }
      
    }

  }
  
  // Updates the users score.
  public void updateScore(int score) {

    // Change the score (this.score = this.score + score).
    this.score += score;
 
  }

  // Updates the users high score with validation.
  public void updateHighscore(int score) {
 
    // Only update if score is equal to or greater than high score.
    if (this.highScore < this.score) {
      this.highScore += score;
    }
    
  }

  // Resets the game state.
  public void reset() {

    // Stop the game running.
    this.gameRunning = false;

    // Reset score.
    this.score = 0;

    // Reset food. (setPosition() is method from Food class, extended in this class.)
    food.setPosition(90, 90);

    // Reset the snake.
    snake.reset();

  }

  // Pauses the game.
  public void pause() {
  
    // Check if the game is running, if it is then stop it, otherwise start it again.
    gameRunning = (gameRunning) ? false : true;

    // If game isnt running.
    if (!gameRunning) {
 
      textSize(48);
      textAlign(CENTER);
      fill(#DC7A7B);
 
      text("Game Paused", width / 2, height / 2);
    }
    
  }

  // Returns true if the game is running, otherwise false.
  public boolean running() {
    return this.gameRunning;
  }

  // Returns the current game stage.
  public String grabStage() {
    return this.gameStage;
  }

  // Set's the game stage.
  public void setStage(String stage) {
    this.gameStage = stage; 
  }
  
  // Set's the players name.
  public void setPlayerName(String playerName) {
    this.playerName = playerName;
  }

  // If a mouse click is detected then this method is called.
  public void detectMousePress() {

    // If the left mouse button is clicked and the player is on the game over screen.
    if (mouseButton == LEFT && this.grabStage() == "gameOverScreen") {

      this.reset(); // Reset the game.
      this.setStage("mainMenuScreen"); // change the stage back to the main menu.

    }

  }

}