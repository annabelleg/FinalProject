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
Equation testEq;


void setup() {
  size(600, 578);
  setLocation(400, 300);
  current = new TextBox(50, 50);
}

void draw() {
  background(255);
  fill(255);
  graphGrid(gridRatio);
  if (drawEquation) {
    fill(255, 0, 0);
    noStroke();
    testEquation(1, 0);
  }
  settingsWindow();
  inputWindow();
  if (!done) {
    testEq = new Equation("y=2x+1");
    print(testEq.giveEquation());
    done = true;
  }
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

