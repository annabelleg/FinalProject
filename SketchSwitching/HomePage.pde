public class HomePage extends AppBase
{

  int b1x, b1y;
  int b2x, b2y;
  int b3x, b3y;
  int buttonLength = 250;
  int buttonHeight = 50;

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
    text("Graph Equations! \n(press 1)", b1x, b1y -5);
    text("Matrix stuff!\n (press 2)", b2x, b2y-5 );
    text("To get back to the home page,\n press 0", b3x, b3y-5);
  }
  void mousePressed() {
    if (mousePressed) {
      if (mouseX > b1x && mouseX < b1x + buttonLength && mouseY > b1y && mouseY < b1y + buttonHeight) {
        selected = 1;
        apps.get(1).display();
      }
      if (mouseX > b2x && mouseX < b2x + buttonLength && mouseY > b2y && mouseY < b2y + buttonHeight) {
        selected = 2;
        apps.get(2).display();
      }
    }
  }
}

