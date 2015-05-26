import javax.swing.JFrame;
PFrame f;
NewFrame yo;
secondApplet s;
thirdApplet t;
int gridRatio = 10;
boolean toRun = false;
int xCenter, yCenter;


void setup() {
  size(600, 578);
  setLocation(400, 300);
}

void draw() {
  background(255);
  fill(255);
  // Creates a new window when mouse clicked.
  if (mousePressed && !toRun) {
    PFrame f = new PFrame();
    NewFrame yo = new NewFrame();
    toRun = true;
  }
  graphGrid(gridRatio);
  fill(255, 0, 0);
  noStroke();
  testEquation(1, 0);
}

public class PFrame extends JFrame {
  public PFrame() {
    setBounds(100, 75, 400, 300);
    s = new secondApplet();
    add(s);
    s.init();
    show();
  }
}

public class NewFrame extends JFrame {
  public NewFrame() {
    setBounds(100, 375, 400, 300);
    t = new thirdApplet();
    add(t);
    t.init();
    show();
  }
}

public class secondApplet extends PApplet {
  public void setup() {
    background(0);
  }
  // Using t. ensures it only applies to window t
  public void draw() {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(width/2, height/2, 50, 50);
    // Changes Scale
    if (mousePressed) {
      if (mouseX > (width/2)-25 && mouseX < (width/2)+25 && mouseY > (height/2)-25 && mouseY < (height/2)+25) {
        gridRatio+= 2;
      }
    }
  }
}
public class thirdApplet extends PApplet {
  public void setup() {
    background(0);
  }

  public void draw() {
  }
}

