public class RedCircle extends AppBase {
  PFrame f;
  NewFrame yo;
  settingsApplet s;
  EquationApplet t;
  int gridRatio = 10;
  boolean toRun = false;
  int xCenter, yCenter;
  boolean drawEquation = false;
  boolean typeMode = false;
  int currentBox = 0;
  TextBox current;
  ArrayList<TextBox> eqInputs;
  PFont p;
  boolean settingsWindowOpen = false;
  boolean inputWindowOpen = false;
  boolean done = true;
  String theEquation;
  boolean equationIn = false;
  boolean first, second, third, fourth = false;
  Equation testEq1, testEq2, testEq3, testEq4;
  float step = 0.1;
  boolean ther = false;
  int time;
  int wait = 2000;

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

  // <<<<<<<<<<<<<<<<<<<<<<<<<< EQUATION APPLET >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  public class EquationApplet extends PApplet {

    public void setup() {
      background(#6FF598);
    }

    public void draw() {
      p = createFont("Georgia", 24);
      textFont(p, 24);                
      fill(255);                  
      text("Input Your Equation", 0, 25);

      rectMode(CENTER);
      fill(255);
      rect(100, 50, 150, 25);
      rect(100, 100, 150, 25);
      rect(100, 150, 150, 25);
      rect(100, 200, 150, 25);
      if (mousePressed) {
        if (mouseX > 25 && mouseX < 175 && mouseY > 38 && mouseY < 62) {
          typeMode = true;
          currentBox = 0;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 88 && mouseY < 112) {
          typeMode = true;
          currentBox = 1;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 138 && mouseY < 162) {
          typeMode = true;
          currentBox = 2;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 188 && mouseY < 212) {
          typeMode = true;
          currentBox = 3;
        }
      }
      textFont(p, 15);                
      fill(0);                    
      text(eqInputs.get(0).input, 30, 55);
      text(eqInputs.get(1).input, 30, 105);
      text(eqInputs.get(2).input, 30, 155);
      text(eqInputs.get(3).input, 30, 205);
      text("Quadratic", 180, 55);
      text("Linear", 180, 205);
      text("Quadratic", 180, 105);
      text("Linear", 180, 155);
    }

    void keyPressed() {
      if (typeMode) {
        for (int i = 0; i < 26; i++) {
          if (key == alphabetLower[i]) {
            current.typeIn(String.valueOf(alphabetLower[i]));
          }
          if (key == alphabetUpper[i]) {
            current.typeIn(String.valueOf(alphabetUpper[i]));
          }
        }
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {  
            current.typeIn(String.valueOf(numbers[i]));
          }
        }
        for (int i = 0; i < 11; i++) {
          if (key == operations[i]) {  
            current.typeIn(String.valueOf(operations[i]));
          }
        }
        if (key == ' ') {
          current.typeIn(" ");
        }
        if (key == ENTER) {
          drawEquation = true;
          done = false;
          typeMode = false;
        }
        if (key == BACKSPACE) {
          current.erase();
        }
      }
    }
  }

  // <<<<<<<<<<<<<<<<<<<<<<<< PARENT EQUATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  public abstract class Equation {

    ArrayList<Coordinate> data;
    String equation;
    String[] equation_;
    boolean linear = false;
    boolean parabola = false;
    int indexBar;
    boolean hasFraction = false;

    public Equation(String eq) {
      equation = eq;
      equation_ = new String[equation.length()];
      fillEq();
      data = new ArrayList<Coordinate>();
    }

    void fillEq() {
      for (int i = 0; i < equation.length (); i++) {
        equation_[i] = equation.substring(i, i+1);
      }
    }

    public abstract void makeData();
    public abstract void testEquation(int colorNum);

    String giveEquation() {
      String result = "[ ";
      for (int i =0; i<equation_.length; i++) {
        result += equation_[i] + ",";
      }
      return result + "]";
    }

    int findX() {
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals ("x")) {
          return i;
        }
      }
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
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< GRAPH GRID >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
  void graphPolar(int scale) {
    stroke(0);
    for (int i = height/2; i < 0; i+= scale) {
      strokeWeight(1);
      fill(255);
      ellipse(0, 0, i, i);
    }
  }

  // <<<<<<<<<<<<<<<<<<<<<<<< LINEAR EQUATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  public class LinearEquation extends Equation {
    // y = mx+b
    float m, b;

    LinearEquation(String eq) {
      super(eq);
      try {
        findM();
        findB();
      } 
      catch (IndexOutOfBoundsException e) {
      }
    }

    void findM() {
      if (equation_[1].equals("=") && equation_[2].equals("x")) {
        m = 1;
        return;
      } else if (findX() == 0) {
        m = 0;
        return;
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
      if (findX() == 0) {
        b = parseFloat(equation.substring(2, equation.length()));
        return;
      }
      if (equation.length() > 3 && !(equation_[equation.length()-1].equals("x"))) {
        hasFraction = false;
        findBar(equation.substring(findX()+1, equation.length()));
        //float num;
        if (hasFraction) {
          //  NEEDS IMPROVEMENT
          /* float numerator = parseFloat(equation.substring(findX(), indexBar));
           float denominator = parseFloat(equation.substring(indexBar+1, equation.length()));
           b = numerator/denominator;
           print("\n"+findX() + " " + indexBar);*/
        } else {
          b = parseFloat(equation.substring(findX()+1, equation.length()));
        }
      } else {
        b = 0;
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
      for (float x = (-1)*(xCenter); x <= xCenter+100; x+=step) {
        fill(colorNum);
        ellipse(x+xCenter, yCenter-(m*x+(b*gridRatio)), 2, 2);
        Coordinate c = new Coordinate(x, (m*x)+b);
        data.add(c);
      }
    }
  }
  // <<<<<<<<<<<<<<<<<<<<<<<< QUADRATIC EQUATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public class QuadraticEquation extends Equation {
    // y = ax^2 + bx + c
    float a, b, c;

    QuadraticEquation(String eq) {
      super(eq);
      try {
        findA();
        findB();
        findC();
      }
      catch (IndexOutOfBoundsException e) {
      }
    }

    int getXsquared() {
      for (int i  = 0; i < equation_.length-1; i++) {
        if (equation_[i].equals("x") && equation_[i+1].equals("^") &&equation_[i+2].equals("2")) {
          return i;
        }
      }
      return 0;
    }

    int findX() {
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals("x") && !(equation_[i+1].equals("^"))) {
          return i;
        }
      }
      return 0;
    }

    void findA() {
      hasFraction = false;
      if (equation_[1].equals("=") && getXsquared() == 2) {
        a = 1;
        return;
      } else {
        findBar(equation.substring(2, getXsquared()));
        if (equation_[0].equals("y") && equation_[1].equals("=")) {
          if (!hasFraction) {
            a = parseFloat(equation.substring(2, getXsquared()));
            return;
          } else {
            float numerator = parseFloat(equation.substring(2, indexBar));
            float denominator = parseFloat(equation.substring(indexBar+1, getXsquared()));
            a = numerator/denominator;
            return;
          }
        }
      }
    }

    void findB() {
      hasFraction = false;
      if (findX() == 0) {
        b = 0;
        return;
      } else {
        int ex = getXsquared();
        if (findX()-ex == 4) {
          if (equation.substring(ex-1, ex).equals("-")) {
            b=-1;
            return;
          } else {
            b = 1;
            return;
          }
        }
        findBar(equation.substring(ex+3, findX()));
        if (!hasFraction) {
          b = parseFloat(equation.substring(ex+3, findX()));
          return;
        } else {
          float numerator = parseFloat(equation.substring(ex, indexBar));
          float denominator = parseFloat(equation.substring(indexBar+1, findX()));
          b = numerator/denominator;
          return;
        }
      }
    }

    void findC() {
      hasFraction = false;
      int endX = findX()+1;
      if (b==0) {
        endX = getXsquared() + 3;
      }
      if (endX >= equation_.length) {
        c = 0;
        return;
      } else {
        findBar(equation.substring(endX, equation.length()));
        if (hasFraction) {
          float numerator = parseFloat(equation.substring(endX, indexBar));
          float denominator = parseFloat(equation.substring(indexBar+1, equation.length()));
          c = numerator/denominator;
          return;
        } else {
          c = parseFloat(equation.substring(endX, equation_.length));
          return;
        }
      }
    }

    float findY() {
      return a;
    }

    float getA() {
      return a;
    }
    float getB() {
      return b;
    }
    float getC() {
      return c;
    }
    void makeData() {
    }

    void testEquation(int colorNum) {
      // y = ax^2+bx+c
      for (float x = (-1)*(xCenter); x <= xCenter+100; x+=step) {
        fill(colorNum);
        ellipse(x+xCenter, yCenter-(((a*x*x)/gridRatio)+(b*x)+(c*gridRatio)), 2, 2);
        // Coordinate c = new Coordinate(x,((a*x*x)+(b*x)+c));
        //  data.add(c);
      }
    }
  }

  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SETTINGS APPLET >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  public class settingsApplet extends PApplet {

    public void setup() {
      background(#E8B4FF);
    }
    public void draw() {

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
          gridRatio+= 1;
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
            gridRatio-= 1;
          }
        }
      }

      // SHOW EQUATION
      rectMode(CENTER); 
      fill(0); 
      rect(50, 150, 75, 25); 
      p = createFont("Georgia", 15); 
      textFont(p, 15); 
      fill(255); 
      text("Scale Up", 15, 160); 
      // Changes Scale
      if (mousePressed) {
        if (mouseX > 13 && mouseX < 87 && mouseY > 108 && mouseY < 162) {
          step /= 1.1;
        }
      }
      rectMode(CENTER); 
      fill(0); 
      rect(50, 200, 75, 25); 
      p = createFont("Georgia", 14); 
      textFont(p, 14); 
      fill(255); 
      text("Scale Down", 13, 210); 
      // Changes Scale
      if (mousePressed) {
        if (mouseX > 13 && mouseX < 87 && mouseY > 158 && mouseY < 212) {
          step *= 1.1;
        }
      }
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
    '+', '-', '*', '/', '^', '!', '=', '(', ')', ',', '.'
  };

  // FIGURE OUT HOW TO DO OPERATIONS

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
      for (int i = 0; i < 26; i++) {
        if (key == alphabetLower[i]) {
          current.typeIn(String.valueOf(alphabetLower[i]));
        }
        if (key == alphabetUpper[i]) {
          current.typeIn(String.valueOf(alphabetUpper[i]));
        }
      }
      for (int i = 0; i < 10; i++) {
        if (key == numbers[i]) {  
          current.typeIn(String.valueOf(numbers[i]));
        }
      }
      for (int i = 0; i < 9; i++) {
        if (key == operations[i]) {  
          current.typeIn(String.valueOf(operations[i]));
        }
      }
      // FIGURE OUT BACKSPACE
    }
  }
  // <<<<<<<<<<<<<<<<<<<<<<<<<<< WINDOWS N INPUTS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  void settingsWindow() {
    rectMode(CENTER); 
    fill(0); 
    rect(30, 10, 60, 20); 
    p = createFont("Georgia", 15, true); 
    textFont(p, 15); 
    fill(255); 
    if (!settingsWindowOpen) {    
      text("Settings", 30, 15);
    } else {
      text("Close", 30, 15);
    }
    if (mousePressed) {
      if (mouseX > 0 && mouseY > 0 && mouseX < 60 && mouseY < 20) {
        if (!settingsWindowOpen) {
          PFrame f = new PFrame(); 
          settingsWindowOpen = true;
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
      text("Input", 100, 15);
    } else {
      text("Close", 100, 15);
    }
    if (mousePressed) {
      if (mouseX > 70 && mouseY > 0 && mouseX < 130 && mouseY < 20) {
        if (!inputWindowOpen) {
          NewFrame yo = new NewFrame(); 
          inputWindowOpen = true;
        }
      }
    }
  }

  boolean isQuadratic(String eq) {
    for (int i = 0; i < eq.length ()-2; i++) {
      if (eq.substring(i, i+3).equals("X^2")) {
        return true;
      }
    }
    return false;
  }

  void getInputs() {
    testEq1 = new QuadraticEquation(eqInputs.get(0).input); 
    testEq2 = new QuadraticEquation(eqInputs.get(1).input); 
    testEq3 = new LinearEquation(eqInputs.get(2).input); 
    testEq4 = new LinearEquation(eqInputs.get(3).input);
  }

  void testInputs(boolean a, boolean b, boolean c, boolean d) {
    if (a)
      testEq1.testEquation(#F03AB3); 
    if (b)
      testEq2.testEquation(#4BBCF7); 
    if (c)
      testEq3.testEquation(#22DE4F); 
    if (d)
      testEq4.testEquation(#FAD414);
  }
  void hasInput() {
    if (!testEq1.equation.equals(""))
      first = true; 
    if (!testEq2.equation.equals(""))
      second = true; 
    if (!testEq3.equation.equals(""))
      third = true; 
    if (!testEq4.equation.equals(""))
      fourth = true;
  }
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MAIN METHODS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public RedCircle(PApplet parentApplet) {
    super(parentApplet);
  }

  // @Override
  public void init() {
    time = millis();//store the current time
    size(600, 578); 
    setLocation(400, 300); 
    eqInputs = new ArrayList<TextBox>(); 
    TextBox box1 = new TextBox(30, 55); 
    TextBox box2 = new TextBox(30, 55); 
    TextBox box3 = new TextBox(30, 55); 
    TextBox box4 = new TextBox(30, 55); 
    eqInputs.add(box1); // index 0
    eqInputs.add(box2); // index 1
    eqInputs.add(box3); // index 2
    eqInputs.add(box4); // index 3
    current = new TextBox(50, 50);
  }

  //  @Override
  public void display() {
    background(255); 
    fill(255); 
    graphGrid(gridRatio); 
    current = eqInputs.get(currentBox); 
    if (!done) {
      getInputs(); 
      done = true;
    }
    if (drawEquation) {
      fill(255, 0, 0); 
      noStroke(); 
      hasInput(); 
      testInputs(first, second, third, fourth); 
      //testEq5.testEquation(#EA1837);
    }
    settingsWindow(); 
    inputWindow();
  }
}

