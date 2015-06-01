import javax.swing.JFrame;

boolean toShowMatrix = false;
boolean toShowREF = false;
int ENTER_MATRIX = 42;
boolean enterRows = false;
boolean enterColumns = false;
int mode;
Matrix m;
int rows, cols;


void setup() {
  size(600, 578);
  setLocation(400, 300);
  mode = ENTER_MATRIX;
}

void draw() {
  //background(255);
  if (mode == ENTER_MATRIX ) {
    MatrixStuff();
  }
}

void keyPressed() {
  print(keyCode); 
  //keyCode for TAB == 9
  if (mode == ENTER_MATRIX) {
    if (enterRows == true) {
      String r = key+"";
      rows = Integer.parseInt(r);
      enterRows = false;
      fill(0);
      
    }
    if (enterColumns == true) {
      String c = ""+key;
      cols = Integer.parseInt(c);
      enterColumns = false;
      
    }
  }
}


void mouseClicked() {
  if (!toShowREF && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height-height/4) && mouseY < (height - height/8)) {
    showREF();
  }
  if (mouseX > width/8 + 30 && mouseX < width/8 + 80 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterRows = true;
  }
  if (mouseX > width/4 + 100 && mouseX < width/4 + 150 && mouseY > height/8 + 10 && mouseY < height/8 + 27) {
    enterColumns = true;
  }
}


