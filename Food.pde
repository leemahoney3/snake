// Food class: Draws the apple on the game's grid and update's its position where necessary.
public class Food {
 
  // The x and y coordinates of the Apple.
  private int x, y;

  // Initialize the apple image.
  private PImage apple;

  // Constructor: called when the class is initialized.
  public Food(int x, int y) {

    // First run, set the position of the apple on the grid.
    this.x = x; // Value set in the main file.
    this.y = y; // Value set in the main file.

    // Load in the apple image.
    apple = loadImage("apple.png");
    
    // Then resize it to fit into the grid nicely.
    apple.resize(15, 15);

  }

  // display the apple on the grid.
  public void display() {
    
    // Check first if the apple has unfortunately spawned off the screen.
    this.x = (this.x > 450) ? 90 : this.x;
    this.y = (this.y > 450) ? 90 : this.y;

    // Show the image on the screen.
    image(apple, this.x, this.y);

  }
  
  // Returns the x co-ordinate of the apple.
  public int getX() {
    return x;
  }
  
  // Returns the y co-ordinate of the apple.
  public int getY() {
    return y;
  }
  
  // Set the x and y co-ordinate 
  public void setPosition(int x, int y) {
    this.x = x;
    this.y = y;
  }

}