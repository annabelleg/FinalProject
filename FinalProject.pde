import javax.swing.JFrame;
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


void setup() {
  size(600, 578);
  setLocation(400, 300);
  step = 0.1;
}

void draw() {
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

