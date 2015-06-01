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


/*void setup() {
 size(600, 578);
 setLocation(400, 300);
 mode = (int)Math.random()*3; //sets mode randomly
 }*/

int b1x, b1y;
int b2x, b2y;
int b3x, b3y;
int buttonHeight;
int buttonLength;

void setup() {
  size(600, 578);
  buttonLength= width/3;
  buttonHeight = height/8;
  b1x=b2x=b3x=width/3;
  b1y = height/6;
  b2y = b1y + buttonHeight + 10;
  b3y = b2y + buttonHeight + 10;
}

void draw() {
  background(225);
  fill(0); 
  textSize(15); 
  textAlign(CENTER); 
  text("Hello! Welcome to Mariya and Annabelle's \ncalculator extraordinaire.\nWhat would you like to do?", width/2, 40);
  stroke(0);
  rect(b1x, b1y, buttonLength, buttonHeight);
  stroke(0);
  rect(b2x, b2y, buttonLength, buttonHeight);
  stroke(0);
  rect(b3x, b3y, buttonLength, buttonHeight);
  fill(255);
  textAlign(CENTER);
  text("Graph Equations!", b1x + buttonLength/2, b1y + buttonHeight/2);
  text("Matrix stuff!", b2x+ buttonLength/2, b2y+ buttonHeight/2);
  text("Evaluate expressions!", b3x+ buttonLength/2, b3y+ buttonHeight/2);
  //background(255);
  if (mode == MATRIX ) {
    //background(255);
    MatrixStuff();
  }
  if (mode == GRAPH) {
    size(600, 578);
    background(255);
    GraphStuff();
  }
}


void mouseClicked() {
  if (mouseX > b1x+65 && mouseX < b1x+65+buttonLength && mouseY > b1y+20 && mouseY < b1y+20+buttonHeight) {
    mode = GRAPH;
  } else if (mouseX > b2x+65 && mouseX < b2x+65+buttonLength && mouseY > b2y+20 && mouseY < b2y+20+buttonHeight) {
    mode = MATRIX;
  }
  if (mode == MATRIX && !toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)) {
    showREF();
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

