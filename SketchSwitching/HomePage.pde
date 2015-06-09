import controlP5.*;
public class HomePage extends AppBase
{
  int b1x, b1y;
  int b2x, b2y;
  int b3x, b3y;
  int buttonLength = 150;
  int buttonHeight = 40;
  ControlP5 cp5;
  PApplet p;
  public HomePage(PApplet parentApplet) {
    super(parentApplet);
    p = parentApplet;
  }

  @Override
    public void init() {
    // setup method
    size(600, 578);
    cp5 = new ControlP5(p);
    b1x=b2x=b3x=width/3;
    b1y = height/3;
    b2y = b1y + buttonHeight + 10;
    b3y = b2y + buttonHeight + 10;

    cp5.addButton("Graph")
      .setValue(1)
        .setPosition(b1x, b1y)
          .setSize(buttonLength, buttonHeight)
            ;
    cp5.addButton("Matrix")
      .setValue(2)
        .setPosition(b2x, b2y)
          .setSize(buttonLength, buttonHeight);
  }

  public void Graph(int val) {
    println("you pressed the Graph button! " + val);
    selected = 1;
    apps.get(1).display();
  }
  public void Matrix(int val) {
    //if (Matrix.isPressed()) {
    println("you pressed the Matrix button! " + val);
    selected = 2;
    apps.get(2).display();
    //  }
  }
  void controlEvent(ControlEvent event) {
    println("controlEvent : "+event.getController().getName());
    // selected = (int)event.getController.getValue();
  }
  /*void mousePressed() {
   if (mousePressed) {
   if (Graph.isPressed()) {
   selected = 1;
   }
   if (Matrix.isPressed()) {
   selected = 2;
   }
   }
   }*/
  @Override
    public void display() {
    // draw method
    background(225);
    /* fill(0); 
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
     text("To get back to the home page,\n press 2", b3x, b3y-5);*/
  }
}

