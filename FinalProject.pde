import javax.swing.JFrame;
PFrame f;
NewFrame yo;
secondApplet s, t;
boolean toShowMatrix = false;
boolean toShowREF = false;
int ENTER_MATRIX = 42;
int mode;
Matrix m;
int rows, cols;
char[] = {'1','2','3','4','5','6','7','8','9','0'};


void setup() {
  size(600, 578);
  setLocation(400, 300);
  mode = ENTER_MATRIX;
}

void draw() {
  background(255);
  if (mode == ENTER_MATRIX) {
    MatrixStuff();
  }
}
void MatrixStuff() {
  text("Enter dimensions of your matrix:", width/4, height/8);
  text("Rows:", width/8 + 5, height/8 + 25);
  text("Columns:", width/4 + 65, height/8 + 25);
  fill(225, 225, 225);
  rect(width/8 + 30, height/8 + 10, 50, 17);
  rect(width/4 + 100, height/8 + 10, 50, 17);
  fill(225);
  stroke(0);
  m = new Matrix(rows, cols);
  if (!toShowMatrix) {
    m.displayMatrix();
    toShowMatrix = true;
  }
  fill(225);
  rect(width/3, height - height/4, width/3, height/8);
  fill(0);
  textAlign(CENTER);
  textSize(15);
  text("Compute \nReduced Echelon Form", width/3+100, height - height/4 + 30);
}
void keyPressed() {
  print(keyCode); 
  //keyCode for TAB == 9
  if (mode == ENTER_MATRIX){
     int 
  }
}

void showREF() {
  m.REF();
  m.displayREF();
  toShowREF = true;
}
void mouseClicked() {
  if (!toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)) {
    showREF();
  }
  if (mouseX > width/8 + 30 && mouseX < width/8 + 80 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterRows();
  }
  if (mouseX > width/4 + 100 && mouseX < width/4 + 150 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterColumns();
  }
}
void enterRows(){
  
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

