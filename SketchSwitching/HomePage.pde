public class HomePage extends AppBase
{

  int b1x, b1y;
  int b2x, b2y;
  int b3x, b3y;
  int buttonLength = 150;
  int buttonHeight = 40;

  public HomePage(PApplet parentApplet) {
    super(parentApplet);
  }

  @Override
    public void init() {
    // setup method
    size(600, 578);
    b1x=b2x=b3x=width/2;
    b1y = 135;
    b2y = b1y + buttonHeight + 10;
    b3y = b2y + buttonHeight + 10;
  }

  @Override
    public void display() {
    // draw method
    background(225);
    fill(0); 
    textSize(15); 
    textAlign(CENTER); 
    text("Hello! Welcome to Mariya and Annabelle's \ncalculator extraordinaire.\nWhat would you like to do?", width/2, 25);
    stroke(0);
    rect(b1x, b1y, buttonLength, buttonHeight);
    stroke(0);
    rect(b2x, b2y, buttonLength, buttonHeight);
    stroke(0);
    rect(b3x, b3y, buttonLength, buttonHeight);
    //textSize();
    fill(255);
    textAlign(CENTER);
    text("Graph Equations! \n(press 0)", b1x, b1y -5);
    text("Matrix stuff!\n (press 1)", b2x, b2y-5 );
    text("Evaluate expressions!", b3x, b3y-5);
  }
}

