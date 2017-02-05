// Snake class: Draws the snake on the game's grid and handles the movement of it.
public class Snake {

  // Primitive Array's
  private int[] snakeArrayX = new int[1]; // Will be used for the snakes body along the x axis.
  private int[] snakeArrayY = new int[1]; // Will be used for the snakes body along the y axis.
  private int[] prevSnakeArrayX = new int[1]; // Will be used for the snakes body along the y axis.
  private int[] prevSnakeArrayY = new int[1]; // Will be used for the snakes body along the y axis.

  // Snake's body. (Also known as it's tail).
  private int snakeTailX, 
              snakeTailY;
  
  // default direction for snake.
  private String direction;

  // Constructor: called when the class is initialized.
  public Snake() {
    
    snakeArrayX[0]  = 60;
    snakeArrayY[0]  = 60;
    
    direction       = "down";
    
  }


  // Move the snake on the screen.
  public void move() {
   
    // Store position of last segment in case a new one is added.
    snakeTailX = snakeArrayX[snakeArrayX.length - 1];
    snakeTailY = snakeArrayY[snakeArrayY.length - 1];
    
    // Store the current configuration and them move snakeArray along this.
    for (int i = 0; i < snakeArrayX.length; i++) {
      prevSnakeArrayX[i] = snakeArrayX[i];
      prevSnakeArrayY[i] = snakeArrayY[i];
    }
    
    for (int i = 1; i < snakeArrayX.length; i++) {
      snakeArrayX[i] = prevSnakeArrayX[i - 1];
      snakeArrayY[i] = prevSnakeArrayY[i - 1];
    }
    
    switch (direction) {
      // If the direction is up, change the Y array by -15.
      case "up":
        snakeArrayY[0] -= 15;
        break;
      
      // If the direction is down, change the Y array by +15.
      case "down":
        snakeArrayY[0] += 15;
        break;
        
      // If the direction is right, change the X array by +15.
      case "right":
        snakeArrayX[0] += 15;
        break;
       
      // If the direction is left, change the X array by -15.
      case "left":
        snakeArrayX[0] -= 15;
        break;
      
    }
    
    // Mirror the snake.
    if (snakeArrayY[0] < 30) {
      snakeArrayY[0] = height;
    } else if (snakeArrayY[0] > height - 15) {
      snakeArrayY[0] = 30;
    }
    
    if (snakeArrayX[0] < 0) {
      snakeArrayX[0] = width;
    } else if (snakeArrayX[0] > width - 15) {
      snakeArrayX[0] = 0;
    }
    
  }
  
  // Display snake's head.
  public void displayHead() {
    
    fill(190);
    ellipse(snakeArrayX[0], snakeArrayY[0], 15, 15);
    
  }
  
  // Display snake's body.
  public void displayBody() {
    
    fill(190);
    for (int i = 1; i < snakeArrayX.length; i++) {
      ellipse(snakeArrayX[i], snakeArrayY[i], 15, 15);
    }
    
  }
  
  // Add a body part to the snake.
  public void addBodyPart() {
    
    // Add new body part.
    snakeArrayX = append(snakeArrayX, snakeTailX);
    snakeArrayY = append(snakeArrayY, snakeTailY);
    
    prevSnakeArrayX = append(prevSnakeArrayX, 0);
    prevSnakeArrayY = append(prevSnakeArrayY, 0);
    // Remove trailing body part
    
    
  }
  
  // Get the snake's x co-ordinate.
  public int getX() {
    return snakeArrayX[0];
  }
  
  // Get the snake's y co-ordinate.
  public int getY() {
    return snakeArrayY[0];  
  }
  
  // Get the length of the snake.
  public int getLength() {
    return snakeArrayX.length;
  }

  // Method to change the snake's direction.
  public void move(String direction) {
    this.direction = direction; // update direction.
  }

  // Method to check if snake hits itself.
  public void checkCollision() {

    if (this.searchArrayForDuplicates(snakeArrayX[0], snakeArrayY[0])) {
      // Game over.
      game.setStage("gameOverScreen");
    }

  }

  // Reset the snake.
  public void reset() {
    
    // Reset all values to initial values.
    snakeArrayX = new int[1];
    snakeArrayY = new int[1];
    snakeArrayX[0] = 60;
    snakeArrayY[0] = 60;

    direction = "down";
    
    prevSnakeArrayX = new int[1];
    prevSnakeArrayY = new int[1];
    
  }
  
  // This method constantly checks the snake x and y arrays for duplicate indexes.
  private boolean searchArrayForDuplicates(int x, int y) {
    
    for (int i = 1; i < snakeArrayX.length; i++) {
      if (x == snakeArrayX[i] && y == snakeArrayY[i]) {
         return true; 
      }
    }
    return false;
  }

}