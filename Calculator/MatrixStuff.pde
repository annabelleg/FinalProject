public class BlueSquare extends AppBase
{
boolean matrixexists = false;
  boolean toShowREF = false;
  boolean enterRows = false;
  boolean enterColumns = false;
  Matrix m;
  int rows, cols;
  char[] numbers = {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'
  };
  ArrayList<TextBox> valInputs;

  PFrame f;
  MatrixApplet s;
  REFApplet t;
  NewFrame yo;

  boolean matrixWindowOpen = false;
  boolean REFWindowOpen = false;

  boolean enterData = false;
  boolean entered = false;

  boolean typeMode = false;
  boolean done = false;
  int currentBox = 0;
  TextBox current = new TextBox(0, 0);
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
      text("Enter dimensions of your matrix:", 15, 15);
      text("Rows:", 50, 40 );
      text("Columns:", 200, 40);
      fill(225, 225, 225);
      rect(100, 25, 50, 20);
      rect(275, 25, 50, 20);
      fill(0);
      stroke(0);
      if (mousePressed) {
        if (mouseX > 95 && mouseX < 155 && mouseY > 20 && mouseY < 50) {
          typeMode = true;
          enterRows = true;
        }
        if (mouseX > 270 && mouseX < 340 && mouseY > 20 && mouseY < 50) {
          typeMode = true;
          enterColumns = true;
        }
      }
      text(rows, 125, 40);
      text(cols, 300, 40);
      
     if (!matrixexists && rows!= 0 && cols!= 0){
       //buildMatrix();
       m = new Matrix(rows, cols);
       matrixexists = true;
     }
     
     
      if (rows != 0 && cols != 0) {
        valInputs = new ArrayList<TextBox>(rows*cols);
      }

      enterMatrixData();
  
      for (TextBox t : valInputs) {
        text(""+m.data[t.mR][t.mC], t.xCor-5, t.yCor+6);
        text(""+valInputs.get(t.mR*cols+t.mC).input, t.xCor-5, t.yCor-2);
        println(m.data[t.mR][t.mC]);
      }
    }
     void buildMatrix(){
       m = new Matrix(rows, cols);
       matrixexists = true;
    }

    void enterMatrixData() {
      fill(200);
      //makes rectangle and textbox at each entry of the matrix
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          if (r <= rows/2 && c <= cols/2) {
            rect(width/2 - r*50, height/2 - c*50, 35, 15);
            valInputs.add(new TextBox(width/2 - r*50 + 15, height/2 - c*50 + 7, r, c, ""));
          } 
          if (r > rows/2 && c <= cols/2) {
            rect(width/2 + (rows-r)*50, height/2 - c*50, 35, 15);
            valInputs.add(new TextBox(width/2 + (rows-r)*50 + 15, height/2 - c*50 + 7, r, c, ""));
          }
          if (r <= rows/2 && c > cols/2) {
            rect(width/2 - r*50, height/2 + (cols-c)*50, 35, 15);
            valInputs.add(new TextBox(width/2 - r*50+15, height/2 + (cols-c)*50 + 7, r, c, ""));
          } 
          if (r > rows/2 && c > cols/2) {
            rect(width/2 + (rows-r)*50, height/2 + (cols-c)*50, 35, 15);
            valInputs.add(new TextBox(width/2 + (rows-r)*50 + 15, height/2 + (cols-c)*50 + 7, r, c, ""));
          }
        }
      }

      fill(0);     
      for (TextBox t : valInputs) { //enter input into each entry
        if (mousePressed) {
          if (mouseX > t.xCor-25 && mouseX < t.xCor+25 && mouseY > t.yCor - 10 && mouseY < t.yCor + 10) {
            currentBox = t.mR*cols+t.mC;
            current = valInputs.get(currentBox);
            typeMode = true;
            enterData = true;
            t = current;
          }
        }
      }
      
    }
    void keyPressed() {
      if (typeMode) {
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {  
            if (enterRows) {
              String r = ""+key;
              if (r != "0") {
                rows = Integer.parseInt(r);
                enterRows = false;
              }
            }
            if (enterColumns) {
              String c = "" + key;
              if (c != "0") {
                cols = Integer.parseInt(c);
                enterColumns = false;
              }
            }
            if (enterData ) {
              current.typeIn(String.valueOf(numbers[i]));

              m.data[current.mR][current.mC] = Double.parseDouble(current.input);
              text(""+m.data[current.mR][current.mC], current.xCor-5, current.yCor+6);
              println(m.data[current.mR][current.mC]);
              enterData = false;
              typeMode = false;
              current.hasStuff = true;
            }
          }
        }
      }
      if (key == ENTER) {
        done = true;
        typeMode = false;
        enterData = false;
      }
      if (key == BACKSPACE) {
        current.erase();
      }
    }
  } 

  public class REFApplet extends PApplet {
    void setup() {
      size(500, 500);
    }
    void draw() {
      background(225);
      m.REF();
      fill(200);
      stroke(0);
      //makes rectangle and textbox at each entry of the matrix
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          if (r <= rows/2 && c <= cols/2) {
            rect(width/2 - r*50, height/2 - c*50, 35, 15);
            fill(0);
            text(""+m.data[r][c], (width/2 - r*50)+12, (height/2 - c*50)+11);
            fill(200);
          } 
          if (r > rows/2 && c <= cols/2) {
            rect(width/2 + (rows-r)*50, height/2 - c*50, 35, 15);
            fill(0);
            text(""+m.data[r][c], width/2 + (rows-r)*50+12, height/2 - c*50+11);
            fill(200);
          }
          if (r <= rows/2 && c > cols/2) {
            rect(width/2 - r*50, height/2 + (cols-c)*50, 35, 15);
            fill(0);
            text(""+m.data[r][c], width/2 - r*50+12, height/2 + (cols-c)*50+11);
            fill(200);
          } 
          if (r > rows/2 && c > cols/2) {
            rect(width/2 + (rows-r)*50, height/2 + (cols-c)*50, 35, 15);
            fill(0);
            text(""+m.data[r][c], width/2 + (rows-r)*50+12, height/2 + (cols-c)*50+11);
            fill(200);
          }
        }
      }
    }
  }


  void matrixWindow() {
    stroke(0);
    rectMode(CENTER);
    fill(200);
    rect(width/2, height/2-height/8, width/3, height/8);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);                
    fill(0); 
    if (!matrixWindowOpen) {    
      text("Enter a matrix!", width/3+100, height/2-height/8);
    } else {
      text("Close", width/3+100, height/2-height/8);
    }
    if (mousePressed) {
      if (mouseX > width/2-width/3 &&  mouseX < width/2+width/3 && mouseY > height/2 - height/6 && mouseY < height/2 ) {
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
    fill(200);
    rect(width/2, height/2 + height/8, width/3, height/8);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);   
    fill(0); 
    if (!REFWindowOpen) {    
      text("Compute \nReduced Echelon Form", width/3+100, height/2 + height/8);
    } else {
      text("Close", width/3+100, height/2 + height/8);
    }
    if (mousePressed) {
      if (mouseX > width/2-width/6 &&  mouseX < width/2 + width/6 && mouseY > height/2 + height/8 && mouseY < 3*height/4) {
        if (!REFWindowOpen && matrixWindowOpen) {
          NewFrame yo = new NewFrame();
          REFWindowOpen = true;
        }
      }
    }
  }

  public class Matrix {
    double[][] data;
    int rows, cols;

    Matrix(int r, int c) {
      rows = r; 
      cols = c;
      data = new double[r][c];
    }
    void enterData() {
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
          data[r][c] = (int) (Math.random()*10) * 1.0;
        }
      }
    }
    
    /*double get(int r, int c){
      return data[r][c];
    }*/

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



  public BlueSquare(PApplet parentApplet) {
    super(parentApplet);
  }

  @Override
    public void init() {
    size(600, 578);
    setLocation(400, 300);
    valInputs = new ArrayList<TextBox>();
  }

  @Override
    public void display() {
    background(225);
    matrixWindow();
    //current = new TextBox(50, 50);
    REFWindow();
  }

  /* ========================= TEXTBOX CLASS ===================================================
   ===========================================================================================*/
  public class TextBox {

    String input = "";
    int xCor, yCor; //center points
    int mR, mC; //entry in matrix
    boolean hasStuff;

    TextBox(int x, int y) {
      input = "";
      xCor = x;
      yCor = y;
      hasStuff = false;
    }
    TextBox(int x, int y, int r, int c, String i) {
      input = i;
      xCor = x;
      yCor = y;
      mR = r;
      mC = c;
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
