import javax.swing.JFrame;
PFrame f;
NewFrame yo;
secondApplet s, t;
boolean toShowMatrix = false;
boolean toShowREF = false;
Matrix m;


void setup() {
  size(600, 578);
  setLocation(400, 300);
}

void draw() {
  m = new Matrix(3, 4);
  //background(255, 60, 0);
  stroke(225);
  fill(255);
  if (!toShowMatrix) {
    m.displayMatrix();
    toShowMatrix = true;
  }
  fill(225);
  rect(width/3, height - height/4, width/3, height/8);
  fill(0);
  textAlign(CENTER);
  text("Compute\nReduced Echelon Form", width/3 + 100, height - height/4 + 30);
}


void showREF(){
  m.REF();
  m.displayREF();
  toShowREF = true;
}
void mouseClicked(){
  if (!toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)){
    showREF();
  }
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
    t = new secondApplet();
    add(t);
    t.init();
    show();
  }
}
public class secondApplet extends PApplet {
  public void setup() {
    background(255);
  }
  public void draw() {
  }
}
