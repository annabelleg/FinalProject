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
LinearEquation testEq,testEqu;
//String theEquation = "";


void setup() {
  size(600, 578);
  setLocation(400, 300);
  current = new TextBox(50, 50);
}

void draw() {
  background(255);
  fill(255);
  graphGrid(gridRatio);
  if (!done) {
    testEq = new LinearEquation("y=1/2x");
    testEqu = new LinearEquation("y=2x+1");
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
    testEq.testEquation(#F03AB3);
    testEqu.testEquation(#4BBCF7);
  }
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

