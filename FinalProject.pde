import javax.swing.JFrame;

int mode;
int GRAPH = 0;
int ENTER_MATRIX = 1;

boolean toShowMatrix = false;
boolean toShowREF = false;
boolean enterRows = false;
boolean enterColumns = false;

Matrix m;
int rows, cols;

import java.util.*;
import java.io.*;
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
double step = 0.1;

int b1x, b1y;
int b2x, b2y;
int b3x, b3y;
int buttonLength = 130;
int buttonHeight = 40;

void setup() {
  size(600, 578);
  b1x=b2x=b3x=150;
  b1y = 135;
  b2y = b1y + buttonHeight + 10;
  b3y = b2y + buttonHeight + 10;
}

void draw() {
  background(225);
  fill(0); 
  textSize(15); 
  textAlign(CENTER); 
  text("Hello! Welcome to Mariya and Annabelle's \ncalculator extraordinaire.\nWhat would you like to do?", 200, 25);
  stroke(0);
  rect(b1x, b1y, buttonLength, buttonHeight);
  stroke(0);
  rect(b2x, b2y, buttonLength, buttonHeight);
  stroke(0);
  rect(b3x, b3y, buttonLength, buttonHeight);
  textSize(10);
  fill(255);
  textAlign(CENTER);
  text("Graph Equations!", b1x+65, b1y + 20);
  text("Matrix stuff!", b2x+65, b2y + 20);
  text("Evaluate expressions!", b3x+65, b3y+20);
  if (mode == ENTER_MATRIX) {
    background(225);
    MatrixStuff();
  } else if (mode == GRAPH) {
    background(225);
    GraphStuff();
  }
}




void mouseClicked() {
  if (mouseX > b1x+65 && mouseX < b1x+65+buttonLength && mouseY > b1y+20 && mouseY < b1y+20+buttonHeight) {
    mode = GRAPH;
  } else if (mouseX > b2x+65 && mouseX < b2x+65+buttonLength && mouseY > b2y+20 && mouseY < b2y+20+buttonHeight) {
    mode = ENTER_MATRIX;
  }
  if (mode == ENTER_MATRIX && !toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)) {
    showREF();
  }
  if (mode == ENTER_MATRIX && mouseX > width/8 + 30 && mouseX < width/8 + 80 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterRows = true;
  }
  if (mode == ENTER_MATRIX && mouseX > width/4 + 100 && mouseX < width/4 + 150 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
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

