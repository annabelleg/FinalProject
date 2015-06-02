public class RedCircle extends AppBase
{

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

  void GraphStuff() {
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

  public class secondApplet extends PApplet {
    public void setup() {
      background(0);
    }
    // Using t. ensures it only applies to window t
    public void draw() {
      /* rectMode(CENTER);
       fill(255, 0, 0);
       rect(width/2, height/2, 50, 50);
       // Changes Scale
       if (mousePressed) {
       if (mouseX > (width/2)-25 && mouseX < (width/2)+25 && mouseY > (height/2)-25 && mouseY < (height/2)+25) {
       gridRatio+= 2;
       }
       }*/
    }
  }
  public class thirdApplet extends PApplet {
    public void setup() {
      background(0);
    }

    public void draw() {
    }
  }

  void settingsWindow() {
    int count = 0;
    rectMode(CENTER);
    fill(0);
    rect(30, 10, 60, 20);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);                
    fill(255); 
    if (!settingsWindowOpen) {    
      text("Settings", 0, 15);
    } else {
      text("Close", 0, 15);
    }
    if (mousePressed) {
      if (mouseX > 0 && mouseY > 0 && mouseX < 60 && mouseY < 20) {
        if (!settingsWindowOpen) {
          PFrame f = new PFrame();
          settingsWindowOpen = true;
        } else {
          destroySettings = true;
        }
      }
    }
  }

  void inputWindow() {
    rectMode(CENTER);
    fill(0);
    rect(100, 10, 60, 20);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);   
    fill(255); 
    if (!inputWindowOpen) {    
      text("Input", 75, 15);
    } else {
      text("Close", 75, 15);
    }
    if (mousePressed) {
      if (mouseX > 70 && mouseY > 0 && mouseX < 130 && mouseY < 20) {
        if (!inputWindowOpen) {
          NewFrame yo = new NewFrame();
          inputWindowOpen = true;
        } else {
          destroyInput = true;
        }
      }
    }
  }

  public abstract class Equation {

    ArrayList<Coordinate> data;
    String equation;
    String[] equation_;
    boolean linear = false;
    boolean parabola = false;
    int indexBar;
    boolean hasFraction = false;
    boolean noX = false;

    public Equation(String eq) {
      equation = eq;
      equation_ = new String[equation.length()];
      fillEq();
      data = new ArrayList<Coordinate>();
    }

    void fillEq() {
      for (int i = 0; i < equation_.length; i++) {
        equation_[i] = equation.substring(i, i+1);
      }
    }

    public abstract void makeData();

    String giveEquation() {
      String result = "[ ";
      for (int i =0; i<equation_.length; i++) {
        result += equation_[i] + ",";
      }
      return result + "]";
    }

    int findX() {
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals("x")) {
          return i;
        }
      }
      noX = true;
      return 0;
    }

    public abstract float findY();


    void findBar(String str) {
      for (int i = 0; i < str.length (); i++) {
        if (str.substring(i, i+1).equals("/")) {
          indexBar = i + 2;
          hasFraction = true;
        }
      }
    }

    public class Coordinate {

      float x, y; 

      public Coordinate(float x, float y) {
        this.x = x; 
        this.y = y;
      }
    }
  }
  public class EquationApplet extends PApplet {
    TextBox typing = new TextBox(30, 55, 20);
    boolean linear = false;
    boolean a = false;
    boolean b = false;
    boolean c = false;

    // TextBox a = newTextBox(25, 100, 4);
    //  TextBox b = newTextBox(25, 100, 4);
    // TextBox c = newTextBox(25, 100, 4);

    public void setup() {
      background(#6FF598);
    }

    public void draw() {

      if (destroyInput) {
        //   frame.setVisible(false);
      }

      p = createFont("Georgia", 24);
      textFont(p, 24);                
      fill(255);                  
      text("Input Your Lineaer Equation", 0, 25);
      p = createFont("Georgia", 15);
      textFont(p, 15);                
      fill(0);                  
      text("In the form y=mx+b and\npress enter to graph", 200, 45);

      rectMode(CENTER);
      fill(255);
      rect(100, 50, 150, 25);

      p = createFont("Georgia", 24);
      textFont(p, 24);                
      fill(255);                  
      text("Quadratic Equation", 0, 100);

      rectMode(CENTER);
      fill(255);
      rect(29, 120, 30, 25);
      p = createFont("Georgia", 24);
      textFont(p, 24);                
      fill(0);                  
      text("x", 48, 125);

      // Changes Scale
      if (mousePressed) {
        if (mouseX > 25 && mouseX < 175 && mouseY > 38 && mouseY < 62) {
          typeMode = true;
          linear = true;
          a = false;
          typing.input = "";
          typing.maxChar = 20;
        }
        if (mouseX > 14 && mouseX < 44 && mouseY > 107 && mouseY < 132) {
          typeMode = true;
          linear = false;
          a = true;
          typing.input = "";
          typing.maxChar = 3;
        }
      }
      if (linear) {
        textFont(p, 15);                
        fill(0);                    
        text(typing.input, 30, 55);
      }

      if (a) {
        textFont(p, 18);                
        fill(0);                    
        text(typing.input, 15, 125);
      }
    }

    void keyPressed() {
      //  print(typeMode);
      //  print(a);
      print(typing.input + " ");
      if (typeMode) {
        if (typing.nowChar < typing.maxChar) {
          for (int i = 0; i < 26; i++) {
            if (key == alphabetLower[i]) {
              typing.typeIn(String.valueOf(alphabetLower[i]));
            }
            if (key == alphabetUpper[i]) {
              typing.typeIn(String.valueOf(alphabetUpper[i]));
            }
          }
          for (int i = 0; i < 10; i++) {
            if (key == numbers[i]) {  
              typing.typeIn(String.valueOf(numbers[i]));
            }
          }
          for (int i = 0; i < 9; i++) {
            if (key == operations[i]) {  
              typing.typeIn(String.valueOf(operations[i]));
            }
          }
          if (key == ' ') {
            typing.typeIn(" ");
          }
          if (key == ENTER) {
            theEquation = typing.input;
            drawEquation = true;
            typeMode = false;
          }
        }
        if (key == BACKSPACE) {
          typing.erase();
        }
      }
    }
  }
  void graphGrid(int scale) {
    stroke(0);
    for (int i = 1; i <= height/scale; i++) {
      if (i==(height/scale)/2) {
        strokeWeight(2);
        yCenter = i*scale;
      } else {
        strokeWeight(1);
      }
      line(0, i*scale, width, i*scale);
    }
    for (int i = 1; i <= width/scale; i++) {
      if (i==(width/scale)/2) {
        strokeWeight(2);
        xCenter = i*scale;
      } else {
        strokeWeight(1);
      }
      line(i*scale, 0, i*scale, height);
    }
  }  

  void testEquation(int m, int b) {
    // y = mx + b form
    // gridScale = 25
    for (int x = (-1)*(xCenter); x <= xCenter; x++) {
      ellipse(x+xCenter, m*x+(b*25)+yCenter, 2, 2);
    }
  }

  public class LinearEquation extends Equation {
    // y = mx+b
    float m, b;

    LinearEquation(String eq) {
      super(eq);
      findM();
      findB();
    }

    void findM() {
      if (equation_[1].equals("=") && equation_[2].equals("x")) {
        m = 1;
      } else if (findX() == 0) {
        m = 0;
      } else {
        findBar(equation.substring(2, findX()));
        int ex = 0;
        if (equation_[0].equals("y") && equation_[1].equals("=")) {
          ex = findX();
          if (!hasFraction) {
            m = parseFloat(equation.substring(2, ex));
          } else {
            float numerator = parseFloat(equation.substring(2, indexBar));
            float denominator = parseFloat(equation.substring(indexBar+1, ex));
            m = numerator/denominator;
          }
        }
      }
    }

    void findB() {
      if (equation.length() > 3 && !(equation_[equation.length()-1].equals("x"))) {
        hasFraction = false;
        findBar(equation.substring(findX()+2, equation.length()));
        boolean positive = true;
        if (equation_[findX()+1].equals("-")) {
          b = parseFloat(equation.substring(findX()+2, equation.length())) * (-1.0);
        } else {
          b = parseFloat(equation.substring(findX()+2, equation.length()));
        }
      }
    }

    float findY() {
      return m;
    }

    float getM() {
      return m;
    }
    float getB() {
      return b;
    }

    void makeData() {
    }

    void testEquation(int colorNum) {
      // y = mx + b form
      for (float x = (-1)*(xCenter); x <= xCenter+100; x+= step) {
        fill(colorNum);
        ellipse(x+xCenter, yCenter-(m*x+(b*gridRatio)), 2, 2);
        Coordinate c = new Coordinate(x, (m*x)+b);
        data.add(c);
      }
    }
  }

  public class settingsApplet extends PApplet {

    public void setup() {
      background(#E8B4FF);
    }
    public void draw() {

      if (destroySettings) {
        this.setVisible(false);
      }

      // Heading
      p = createFont("Georgia", 24);
      textFont(p, 24);                
      fill(255);                  
      text("Graph Settings", 0, 25);

      // ZOOM IN
      rectMode(CENTER);
      fill(0);
      rect(50, 50, 75, 25);
      p = createFont("Georgia", 18);
      textFont(p, 18);                
      fill(255);  
      text("Zoom In", 15, 60);   
      // Changes Scale
      if (mousePressed) {
        if (mouseX > 13 && mouseX < 87 && mouseY > 38 && mouseY < 62) {
          gridRatio+= 2;
        }
      } 
      // ZOOM OUT
      rectMode(CENTER);
      fill(0);
      rect(50, 100, 75, 25);
      p = createFont("Georgia", 16);
      textFont(p, 16);                
      fill(255);  
      text("Zoom Out", 15, 110);   
      // Changes Scale
      if (mousePressed) {
        if (mouseX > 13 && mouseX < 87 && mouseY > 58 && mouseY < 112) {
          if (gridRatio > 2) {
            gridRatio-= 2;
          }
        }
      }

      // SHOW EQUATION
      /*rectMode(CENTER);
       fill(0);
       rect(50, 150, 75, 25);
       p = createFont("Georgia", 18);
       textFont(p, 18);                
       fill(255);  
       text("Draw It", 15, 160);   
       // Changes Scale
       if (mousePressed) {
       if (mouseX > 13 && mouseX < 87 && mouseY > 108 && mouseY < 162) {
       drawEquation = true;
       }
       }
       }*/
    }
  }

  char[] alphabetLower = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  };
  char[] alphabetUpper = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  };
  char[] numbers = {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
  };
  char[] operations = {
    '+', '-', '*', '/', '^', '!', '=', '(', ')', '.', ','
  };

  // FIGURE OUT HOW TO DO OPERATIONS

  public class TextBox {

    TextBox(int x, int y) {
      input = "";
      xCor = x;
      yCor = y;
    }
    String input = "";
    int xCor, yCor; //center points
    int maxChar;
    int nowChar;

    TextBox(int x, int y, int maxC) {
      input = "";
      xCor = x;
      yCor = y;
      maxChar = maxC;
      nowChar = 0;
    }  

    void typeIn(String letter) {
      input += letter;
    }
    /*void erase() {
     input = input.substring(0, input.length()-1);
     nowChar++;
     }*/
    void erase() {
      if (nowChar>0) {
        input = input.substring(0, input.length()-1);
        nowChar--;
      }
    }
  }


  public RedCircle(PApplet parentApplet) {
    super(parentApplet);
  }

  // @Override
  public void init() {
    size(600, 578);
  }

  //  @Override
  public void display() {
    size(600, 578);
    background(255);
    GraphStuff();
  }
}

