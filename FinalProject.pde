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
boolean typeMode = true;
TextBox current;
PFont p;
boolean settingsWindowOpen = false;
boolean inputWindowOpen = false;
boolean done = false;
LinearEquation testEq;
float xMin, xMax, step;


void setup() {
  size(600, 578);
  setLocation(400, 300);
  current = new TextBox(50, 50);
  xMin = (-1)*xCenter;
  xMax = xCenter;
  step = 1;
}

void draw() {
  background(255);
  fill(255);
  graphGrid(gridRatio);
  if (!done) {
    testEq = new LinearEquation("y=x+2");
    print(testEq.giveEquation());
    print("\n" + testEq.findY());
    print("\n" + testEq.hasFraction);
    print("\n" + testEq.indexBar);
    print("\nM: " + testEq.getM());
    print("\nB: " + testEq.getB());
    done = true;
  }
  if (drawEquation) {
    fill(255, 0, 0);
    noStroke();
    testEq.testEquation();
  }
  settingsWindow();
  inputWindow();
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

