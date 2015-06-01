import javax.swing.JFrame;
import java.util.*;
import java.io.*;

int mode = -1;
int GRAPH = 0;
int MATRIX = 1;

boolean toShowMatrix = false;
boolean toShowREF = false;
boolean enterRows = false;
boolean enterColumns = false;
Matrix m;
int rows, cols;


PFrame f;
NewFrame yo;
settingsApplet s;
EquationApplet t;
int gridRatio = 10;
boolean toRun = false;
int xCenter, yCenter;
boolean drawEquation = false;
boolean typeMode = false;
TextBox current;
PFont p;
boolean settingsWindowOpen = false;
boolean inputWindowOpen = false;
boolean done = false;
boolean equationIn = false;
LinearEquation testEq;
//QuadraticEquation testEqu;
String theEquation;
float step;
boolean destroySettings = false;
boolean destroyInput = false;


void setup() {
  size(600, 578);
  setLocation(400, 300);
  mode = (int)Math.random()*2; //sets mode randomly
}

void draw() {
  //background(255);
  if (mode == MATRIX ) {
    MatrixStuff();
  } else if (mode == GRAPH) {
    GraphStuff();
  }
}


void mouseClicked() {
  if (mode == MATRIX && !toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)) {
    showREF();
  }
  if (mode == MATRIX && mouseX > width/8 + 30 && mouseX < width/8 + 80 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterRows = true;
  }
  if (mode == MATRIX && mouseX > width/4 + 100 && mouseX < width/4 + 150 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterColumns = true;
  }
  if (mode == MATRIX && mouseX > width/8 + 30 && mouseX < width/8 + 80 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterRows = true;
  }
  if (mode == MATRIX && mouseX > width/4 + 100 && mouseX < width/4 + 150 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterColumns = true;
  }
  
}


void GraphStuff() {
  background(255);
  fill(255);
  graphGrid(gridRatio);
  if (drawEquation) {
    fill(255, 0, 0);
    noStroke();
    testEq = new LinearEquation(theEquation);
    testEq.testEquation(#F03AB3);
  }
  /* if (!done) {
   testEqu = new QuadraticEquation("y=1/2x^2+6x");
   print(testEqu.equation);
   print("\n"+testEqu.getXsquared());
   print("\n"+testEqu.findX());
   print("\n"+testEqu.getA());
   print("\n"+testEqu.getB());
   print("\n"+testEqu.getC());
   done = true;
   }*/
  settingsWindow();
  inputWindow();
  // theEquation = t.typing.input;
}

public class PFrame extends JFrame {
  public PFrame() {
    setBounds(100, 75, 400, 300);
    s = new settingsApplet();
    add(s);
    s.init();
    show();
  }
}

public class NewFrame extends JFrame {
  public NewFrame() {
    setBounds(100, 375, 400, 300);
    t = new EquationApplet();
    add(t);
    t.init();
    show();
  }
}

