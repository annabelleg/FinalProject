public class BlueSquare extends AppBase
{
  boolean toShowMatrix = false;
  boolean toShowREF = false;
  boolean enterRows = false;
  boolean enterColumns = false;
  Matrix m;
  int rows, cols;
  char[] numbers = {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'
  };

  PFrame f;
  MatrixApplet s;
  REFApplet t;
  NewFrame yo;

  boolean matrixWindowOpen = false;
  boolean REFWindowOpen = false;

  boolean typeMode = false;
  int currentBox = 0;
  TextBox current;
  PFont p;
  public class PFrame extends JFrame {
    public PFrame() {
      setBounds(100, 75, 500, 500);
      s = new MatrixApplet();
      add(s);
      s.init();
      show();
    }
  }

  public class NewFrame extends JFrame {
    public NewFrame() {
      setBounds(100, 375, 500, 500);
      t = new REFApplet();
      add(t);
      t.init();
      show();
    }
  }  

  public class MatrixApplet extends PApplet {
    void setup() {
      size(500, 500);
    }
    void draw() {
      background(225);
      p = createFont("Georgia", 24);
      textFont(p, 15);                
      fill(255);                  

      fill(0);
      text("Enter dimensions of your matrix:", width/8, height/8);
      text("Rows:", width/8, height/6 );
      TextBox box1 = new TextBox(width/8 +55, height/8 + 25);
      text("Columns:", width/2, height/6);
      TextBox box2 = new TextBox(width/4 + 65, height/8 + 25);
      fill(225, 225, 225);
      rect(width/8 + 55, height/8 + 20, 50, 17);
      rect(width/4 + 125, height/8 + 20, 50, 17);
      fill(0);


      stroke(0);
      if (mousePressed) {
        if (mouseX > width/8 + 55 && mouseX < width/8 + 105 && mouseY > height/8 + 20 && mouseY < height/8 + 37) {
          typeMode = true;
          current = box1;
          enterRows = true;
        }
        if (mouseX > width/4 + 125 && mouseX < width/4 + 175 && mouseY > height/8 + 20 && mouseY < height/8 + 37) {
          typeMode = true;
          current = box2;
          enterColumns = true;
        }
      }
    text(rows, width/8 + 65, height/8 + 30);
    text(cols, width/4 + 135, height/8 + 30);
    m = new Matrix(rows,cols);
    m.displayMatrix();
    }
    void keyPressed() {
      if (typeMode) {
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {  
            if (enterRows) {
              String r = ""+key;
              rows = Integer.parseInt(r);
              enterRows = false;//current.typeIn(String.valueOf(numbers[i]));
            }
            if (enterColumns) {
              String c = "" + key;
              cols = Integer.parseInt(c);
              enterColumns = false;
            }
          }
        }
        if (key == ENTER) {
          toShowMatrix = true;
          //       done = false;
          typeMode = false;
        }
        if (key == BACKSPACE) {
          current.erase();
        }
      }
    }
 
  } 
  
  public class REFApplet extends PApplet {
    void setup() {
      size(500, 500);
    }
    void draw() {
      showREF();
    }
  }
  void matrixWindow() {
    stroke(0);
    rectMode(CENTER);
    fill(225);
    rect(width/2, height/2, width/3, height/8);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);                
    fill(0); 
    if (!matrixWindowOpen) {    
      text("Enter a matrix!", width/3+100, height/2);
    } else {
      text("Close", width/3+100, height/2);
    }
    if (mousePressed) {
      if (mouseX > width/3 && mouseY > height/2 && mouseX < 2*width/3 && mouseY < height/2 + height/8) {
        if (!matrixWindowOpen) {
          PFrame f = new PFrame();
          matrixWindowOpen = true;
        }
      }
    }
  }

  void REFWindow() {
    stroke(0);
    rectMode(CENTER);
    fill(225);
    rect(width/2, height/2 + height/3, width/3, height/8);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);   
    fill(0); 
    if (!REFWindowOpen) {    
      text("Compute \nReduced Echelon Form", width/3+100, height - height/4 + 30);
    } else {
      text("Close", width/3+100, height - height/4 + 30);
    }
    if (mousePressed) {
      if (mouseX > width/3 && mouseY > height/2 + height/3 && mouseX < 2*width/3 && mouseY < height/2 + height/3 + height/8) {
        if (!REFWindowOpen && matrixWindowOpen) {
          NewFrame yo = new NewFrame();
          REFWindowOpen = true;
        }
      }
    }
  }

  public class Matrix {
    double[][] data;
    int[][][] coords;
    int rows, cols;

    Matrix(int r, int c) {
      rows = r; 
      cols = c;
      data = new double[r][c];
      coords = new int[r][c][2];
      enterData();
    }
    void enterData() {
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          data[r][c] = (int) (Math.random()*10) * 1.0;
        }
      }
    }
    void displayMatrix() {
      textSize(15);
      fill(0, 0, 0, 100);
      int rectW = cols*20;
      int rectH = rows*50;
      rect(rectW, rectH, cols*50, rows*50);
      fill(225);
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          text(String.valueOf(data[r][c]).substring(0, 3), rectW+ c*50 +15, rectH + r*50 + 25);
          coords[r][c][0] = rectW+ c*50 +15;
          coords[r][c][1] = rectH + r*50 + 25;
        }
      }
    }
    void displayREF() {
      textSize(15);
      fill(0, 0, 0, 100);
      int rectW = cols*80 ;
      int rectH = rows*50;
      rect(rectW, rectH, cols*50, rows*50);
      fill(225);
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          text(String.valueOf(data[r][c]).substring(0, 3), rectW+ c*50 + 25, rectH + r*50 + 25);
        }
      }
    }

    void REF() {
      exchange();
      dilateAndShear();
      checkMatrix();
    }
    void exchange() {
      for (int r = 0; r < rows; r++) {
        int k = 1;
        while (k < rows-r) {
          if (findLeadingEntry(r) > findLeadingEntry(r+k)) {
            switchRows(r, r+k);
          }
          k++;
        }
      }
    }
    int findLeadingEntry(int row) {
      for (int c = 0; c < cols; c++) {
        if (data[row][c] != 0.0)
          return c;
      }
      return -1;
    }
    void switchRows(int a, int b) {
      for (int c = 0; c < cols; c++) {
        double temp = data[a][c];
        data[a][c] = data[b][c];
        data[b][c] = temp;
      }
    }

    void dilateAndShear() {
      int r=0;
      while (r < rows) {
        int c = findLeadingEntry(r);
        if (c >= 0) {
          dilate(r, c);
          shear(r, c);
        }
        r++;
      }
    }
    void dilate(int r, int c) {
      if (data[r][c] != 1.0) {
        double val = 1/data[r][c];
        for (int i = c; i < cols; i++) {
          data[r][i] = data[r][i]*val;
        }
      }
    }

    void shear(int r, int c) {
      int tempr = 0;
      while (tempr < rows) {
        if (tempr != r) {
          double shearval = data[tempr][c];
          int startval = findLeadingEntry(tempr);
          for (int i = startval; i < cols; i++) {
            data[tempr][i] = data[tempr][i] + (-1)*shearval*(data[r][i]);
          }
        }
        tempr++;
      }
    }
    void checkMatrix() {
      for (int r = 1; r < rows; r++) {
        if (findLeadingEntry(r) <= findLeadingEntry(r-1)) {
          switchRows(r, r-1);
        }
      }
    }
  }

  void MatrixStuff() {
    //  background(225);
    /* fill(0);
     text("Enter dimensions of your matrix:", width/4, height/8);
     text("Rows:", width/8 + 5, height/8 + 25);
     TextBox box1 = new TextBox(width/8 + 5, height/8 + 25);
     text("Columns:", width/4 + 65, height/8 + 25);
     TextBox box2 = new TextBox(width/4 + 65, height/8 + 25);
     fill(225, 225, 225);
     rect(width/8 + 55, height/8 + 20, 50, 17);
     rect(width/4 + 125, height/8 + 20, 50, 17);
     fill(0);
     text(rows, width/8 + 40, height/8 + 25);
     text(cols, width/4 + 110, height/8 + 25);
     stroke(0);
     if (rows != 0 && cols != 0) {
     m = new Matrix(rows, cols);  
     if (!toShowMatrix) {
     m.displayMatrix();
     toShowMatrix = true;
     }
     }*/
    fill(225);
    rect(width/2, height/2, width/3, height/8);
    fill(0);
    textAlign(CENTER);
    textSize(15);
    text("Enter a matrix!", width/3+100, height/2);
    fill(225);
    rect(width/2, height - height/5+10, width/3, height/8);
    fill(0);
    text("Compute \nReduced Echelon Form", width/3+100, height - height/4 + 30);
  }
  void matrixPress() {
    if (mousePressed) {
      if (!toShowMatrix && mouseX > (width/3) && mouseX < (2*width/3) && mouseY > (height/2) && mouseY < (height/2 + height/8)) {
        toShowMatrix = true;
      }
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
    if (keyPressed) {

      if (enterRows == true) {
        String r = key+"";
        rows = Integer.parseInt(r);
        enterRows = false;
      }
      if (enterColumns == true) {
        String c = ""+key;
        cols = Integer.parseInt(c);
        enterColumns = false;
      }
    }
  }
  void showREF() {
    m.REF();
    m.displayREF();
    toShowREF = true;
  }

  public BlueSquare(PApplet parentApplet) {
    super(parentApplet);
  }

  @Override
    public void init() {
    //  p = new PVector(parent.width / 2, parent.height / 2, 0);
    size(600, 578);
  }

  @Override
    public void display() {
    background(225);
    matrixWindow();
    REFWindow();
  }
  public class TextBox {

    String input = "";
    int xCor, yCor; //center points

    TextBox(int x, int y) {
      input = "";
      xCor = x;
      yCor = y;
    }

    void typeIn(String letter) {
      input += letter;
    }
    void erase() {
      if (input.length() >= 1)
        input = input.substring(0, input.length()-1);
    }
  }

  void keyPressed() {
    if (typeMode) {
      for (int i = 0; i < 10; i++) {
        if (key == numbers[i]) {  
          current.typeIn(String.valueOf(numbers[i]));
        }
      }
    }
  }
}

