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
  boolean mustBe = false;
  int wait = 2000;
  // 0 = funtion, 1 = polar
  int graphMode = 0;
  // PolarEquation pol;

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
      stroke(255);
      rect(100, 50, 150, 25);
      rect(100, 100, 150, 25);
      rect(100, 150, 150, 25);
      rect(100, 200, 150, 25);

      rect(250, 50, 80, 25);
      rect(250, 100, 80, 25);
      rect(250, 150, 80, 25);
      rect(250, 200, 80, 25);

      rect(350, 50, 80, 25);
      rect(350, 100, 80, 25);
      rect(350, 150, 80, 25);
      rect(350, 200, 80, 25);

      textSize(15);
      fill(0);
      text("xMin:", 212, 60);
      text("xMin:", 212, 110);
      text("xMin:", 212, 160);
      text("xMin:", 212, 210);
      text("xMax:", 312, 60);
      text("xMax:", 312, 110);
      text("xMax:", 312, 160);
      text("xMax:", 312, 210);

      if (mousePressed) {
        if (mouseX > 25 && mouseX < 175 && mouseY > 38 && mouseY < 62) {
          typeMode = true;
          mustBe = false;
          currentBox = 0;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 88 && mouseY < 112) {
          typeMode = true;
          mustBe = false;
          currentBox = 1;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 138 && mouseY < 162) {
          typeMode = true;
          mustBe = false;
          currentBox = 2;
        }
        if (mouseX > 25 && mouseX < 175 && mouseY > 188 && mouseY < 212) {
          typeMode = true;
          mustBe = false;
          currentBox = 3;
        }
        // <<<<<<<<<<<<<< XMIN & XMAX INPUTs
        if (mouseX > 210 && mouseX < 290 && mouseY > 38 && mouseY < 62) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(4).maxChar = 3;
          currentBox = 4;
        }
        if (mouseX > 310 && mouseX < 390 && mouseY > 38 && mouseY < 62) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(5).maxChar = 3;
          currentBox = 5;
        }
        if (mouseX > 210 && mouseX < 290 && mouseY > 88 && mouseY < 112) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(6).maxChar = 3;
          currentBox = 6;
        }
        if (mouseX > 310 && mouseX < 390 && mouseY > 88 && mouseY < 112) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(7).maxChar = 3;
          currentBox = 7;
        }
        if (mouseX > 210 && mouseX < 290 && mouseY > 138 && mouseY < 162) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(8).maxChar = 3;
          currentBox = 8;
        }
        if (mouseX > 310 && mouseX < 390 && mouseY > 138 && mouseY < 162) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(9).maxChar = 3;
          currentBox = 9;
        }
        if (mouseX > 210 && mouseX < 290 && mouseY > 188 && mouseY < 212) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(10).maxChar = 3;
          currentBox = 10;
        }
        if (mouseX > 310 && mouseX < 390 && mouseY > 188 && mouseY < 212) {
          typeMode = true;
          mustBe = true;
          eqInputs.get(11).maxChar = 3;
          currentBox = 11;
        }
      }
      textFont(p, 15);                
      fill(0);                    
      text(eqInputs.get(0).input, 30, 55);
      text(eqInputs.get(1).input, 30, 105);
      text(eqInputs.get(2).input, 30, 155);
      text(eqInputs.get(3).input, 30, 205);
      text(eqInputs.get(4).input, 260, 55);
      text(eqInputs.get(5).input, 360, 55);
      text(eqInputs.get(6).input, 260, 105);
      text(eqInputs.get(7).input, 360, 105);
      text(eqInputs.get(8).input, 260, 155);
      text(eqInputs.get(9).input, 360, 155);
      text(eqInputs.get(10).input, 260, 205);
      text(eqInputs.get(11).input, 360, 205);
    }

    void keyPressed() {
      if (typeMode) {
        for (int i = 0; i < 26; i++) {
          if (key == alphabetLower[i] && !mustBe) {
            current.typeIn(String.valueOf(alphabetLower[i]));
          }
          if (key == alphabetUpper[i] && !mustBe) {
            current.typeIn(String.valueOf(alphabetUpper[i]));
          }
        }
        for (int i = 0; i < 10; i++) {
          if (key == numbers[i]) {  
            current.typeIn(String.valueOf(numbers[i]));
          }
        }
        for (int i = 0; i < 11; i++) {
          if (key == operations[i] && !mustBe) {  
            current.typeIn(String.valueOf(operations[i]));
          }
        }
        if (mustBe) {
          if (key == '-') {
            current.typeIn("-");
          }
          if (key == '.') {
            current.typeIn(".");
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
    float defXmin, defXmax;
    float xMin, xMax;

    public Equation(String eq) {
      equation = eq;
      equation_ = new String[equation.length()];
      fillEq();
      data = new ArrayList<Coordinate>();
      xMin = (-1)*(xCenter);
      defXmin = (-1)*(xCenter);
      xMax = xCenter+100;
      defXmax = xCenter+100;
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
    strokeWeight(0.75);
    noFill();
    xCenter = width/2;
    yCenter = height/2;
    scale = 25;
    //  for (int i = height+250; i > 0; i-= scale) {
    //  ellipse(xCenter, yCenter, i, i);
    //}
    for (int i = 0; i < (height+250)/gridRatio; i++) {
      ellipse(xCenter, yCenter, i*gridRatio, i*gridRatio);
    }
    strokeWeight(2);
    line(xCenter, 0, xCenter, height);
    line(0, yCenter, width, yCenter);
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
        //

        makeData();
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
      for (float x = xMin; x <= xMax; x+=step) {
        float tX = x+xCenter;
        float tY = yCenter-(m*x+(b*gridRatio));
        Coordinate c = new Coordinate(tX, tY);
        data.add(c);
      }
    }

    void testEquation(int colorNum) {
      data.clear();
      makeData();
      // y = mx + b form
      for (Coordinate c : data) {
        fill(colorNum);
        ellipse(c.x, c.y, 2, 2);
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
        if (equation_[i].equals("x") && equation_[i+1].equals("^") && equation_[i+2].equals("2")) {
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
      if (equation_[equation_.length-1].equals("x")) {
        b = parseFloat(equation.substring(getXsquared()+3, equation_.length-1));
        c = 0;
        return;
      }
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
      if (endX == equation_.length) {
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
      for (float x = xMin; x <= xMax; x+=step) {
        float tX = x+xCenter;
        float tY = yCenter-(((a*x*x)/gridRatio)+(b*x)+(c*gridRatio));
        //  print("(" + tX + "," + tY+")");
        Coordinate c = new Coordinate(tX, tY);
        data.add(c);
      }
    }

    void testEquation(int colorNum) {
      // y = ax^2+bx+c
      data.clear();
      makeData();
      for (Coordinate cor : data) {
        fill(colorNum);
        ellipse(cor.x, cor.y, 2, 2);
      }
    }
  }
  // <<<<<<<<<<<<<<<<<<<<<<<< POLAR EQUATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  public class PolarEquation extends Equation {
    // y = a+bsin(x)
    float a, b;
    String angle;
    int pr1, pr2; // parenthesis for theta
    int endA;
    // 0 = sine , 1 = cosine, 2 = tangent, 3 = csc, 4 = sec, 5 = cot
    int trigOperation;
    ArrayList posTrig;
    ArrayList<Coordinate> PolarCoors;

    PolarEquation(String eq) {
      super(eq);
      xMin = 0;
      defXmin = 0;
      xMax = 2*PI;   
      defXmax = 2*PI;
      posTrig = new ArrayList();
      PolarCoors = new ArrayList<Coordinate>();
      try {
        findAngle();
        findA();
        findB();
        findTrig();
      }
      catch (IndexOutOfBoundsException e) {
      }
    }

    float convertPolar(float x, float y, boolean ar) { // ar true = return r & ar false = return theta
      float r = sqrt((x*x)+(y*y));
      float theta = atan(y/x);
      if (ar)
        return r;
      return theta;
    }
    float convertRect(float r, float theta, boolean ex) {
      float yR = (r*sin(theta));
      float xR = (r*cos(theta));
      if (ex)
        return xR;
      return yR;
    }

    void findTrig() {
      if (equation.substring(pr1-3, pr1).equals("sin") || equation.substring(pr1-4, pr1).equals("sine")) {
        trigOperation = 0;
      } else if (equation.substring(pr1-3, pr1).equals("cos") || equation.substring(pr1-6, pr1).equals("cosine")) {
        trigOperation = 1;
      } else if (equation.substring(pr1-3, pr1).equals("tan") || equation.substring(pr1-7, pr1).equals("tangent")) {
        trigOperation = 2;
      } else if (equation.substring(pr1-3, pr1).equals("csc")) {
        trigOperation = 3;
      } else if (equation.substring(pr1-3, pr1).equals("sec")) {
        trigOperation = 4;
      } else if (equation.substring(pr1-3, pr1).equals("cot")) {
        trigOperation = 5;
      }
    }

    float trigOperation(float angle) {
      if (trigOperation == 0) {
        return sin(angle);
      } else if (trigOperation == 1) {
        return cos(angle);
      } else if (trigOperation == 2) {
        return tan(angle);
      } else if (trigOperation == 3) {
        return 1/( sin(angle) );
      } else if (trigOperation == 4) {
        return 1/( cos(angle) );
      } else {
        return 1/( tan(angle) );
      }
    }

    void findAngle() {
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals("(")) {
          pr1 = i;
        }
      }
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals(")")) {
          pr2 = i;
        }
      }
      angle = equation.substring(pr1+1, pr2);
    }

    void findA() {
      for (int i = 0; i < equation_.length; i++) {
        if (equation_[i].equals("+") || equation_[i].equals("-") && i!=2) {
          endA = i;
          break;
        }
      }
      if (equation_[0].equals("y") && equation_[1].equals("=")) {
        a = parseFloat(equation.substring(2, endA));
      }
    }

    void findB() {
      b = parseFloat(equation.substring(endA, pr1-3));
    }

    void convertThem(ArrayList<Coordinate> lis) {
      for (Coordinate cor : lis) {
        float cX = cor.x;
        cor.x = convertRect(cX, cor.y, true);
        cor.y = convertPolar(cX, cor.y, false);
      }
    }

    float findY() {
      return 0.0;
    }

    float getA() {
      return a;
    }
    float getB() {
      return b;
    }
    void makeData() {
      for (float x = xMin; x <= xMax; x+=step) {
        float thisR = a + b*cos(x);
        Coordinate thisCor = new Coordinate(thisR, x);
        PolarCoors.add(thisCor);
      }
      convertThem(PolarCoors);
    }

    void testEquation(int colorNum) {
      // r = a + bcos(theta)
      data.clear();
      //makeData();
      for (float x = xMin; x <= xMax; x+=step) {
        fill(colorNum);
        float theX = (x*gridRatio)+xCenter;
        float theY = yCenter-(a*gridRatio+(b*trigOperation(x)*gridRatio));
        ellipse(theX, theY, 2, 2); // << Graphs well. But does so rectangularly. 
        Coordinate c = new Coordinate(theX, theY);
        data.add(c);
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
    int maxChar;

    TextBox(int x, int y) {
      input = ""; 
      xCor = x; 
      yCor = y;
      maxChar = 18;
    }

    void typeIn(String letter) {
      if (input.length() < maxChar) {
        input += letter;
      }
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
    text("Settings", 30, 15);

    if (mousePressed) {
      if (mouseX > 0 && mouseY > 0 && mouseX < 60 && mouseY < 20) {
        if (!settingsWindowOpen) {
          PFrame f = new PFrame(); 
          settingsWindowOpen = true;
        } else {
          // settingsWindowOpen = false;
        }
      }
    }
    rectMode(CENTER); 
    fill(0); 
    rect(width-50, 10, 60, 20);
    p = createFont("Georgia", 15, true); 
    textFont(p, 15); 
    fill(255); 
    text("Polar", width-58, 15);
    if (mousePressed) {
      if (mouseX > width-88 && mouseY > 0 && mouseX < width-28 && mouseY < 20) {
        graphMode = 1;
      }
    }
    rectMode(CENTER); 
    fill(0); 
    rect(width-120, 10, 60, 20);
    p = createFont("Georgia", 15, true); 
    textFont(p, 15); 
    fill(255); 
    text("Function", width-120, 15);
    if (mousePressed) {
      if (mouseX > width-150 && mouseY > 0 && mouseX < width-90 && mouseY < 20) {
        graphMode = 0;
      }
    }
  }

  void inputWindow() {
    boolean canOpen = false;
    rectMode(CENTER); 
    fill(0); 
    rect(100, 10, 60, 20); 
    p = createFont("Georgia", 15, true); 
    textFont(p, 15); 
    fill(255);    
    text("Input", 100, 15); 

    if (mousePressed) {
      if (mouseX > 70 && mouseY > 0 && mouseX < 130 && mouseY < 20) {
        if (!inputWindowOpen) {
          NewFrame yo = new NewFrame();
          inputWindowOpen = true;
          canOpen = true;
        } else {
          //1inputWindowOpen = false;
        }
      }
    }
  }

  boolean isQuadratic(String eq) {
    for (int i = 0; i < eq.length ()-2; i++) {
      if (eq.substring(i, i+3).equals("x^2")) {
        return true;
      }
    }
    return false;
  }
  boolean isTrig(String eq) {
    for (int i = 0; i < eq.length ()-2; i++) {
      if (eq.substring(i, i+3).equals("cos") || eq.substring(i, i+3).equals("sin") || eq.substring(i, i+3).equals("tan")
        || eq.substring(i, i+3).equals("csc") || eq.substring(i, i+3).equals("sec") || eq.substring(i, i+3).equals("cot")) {
        return true;
      }
    }
    return false;
  }

  void getInputs() {
    if (isQuadratic(eqInputs.get(0).input)) {
      testEq1 = new QuadraticEquation(eqInputs.get(0).input);
    } else if (isTrig(eqInputs.get(0).input)) {
      testEq1 = new PolarEquation(eqInputs.get(0).input);
    } else {
      testEq1 = new LinearEquation(eqInputs.get(0).input);
    }
    if (isQuadratic(eqInputs.get(1).input)) {
      testEq2 = new QuadraticEquation(eqInputs.get(1).input);
    } else if (isTrig(eqInputs.get(1).input)) {
      testEq2 = new PolarEquation(eqInputs.get(1).input);
    } else {
      testEq2 = new LinearEquation(eqInputs.get(1).input);
    }
    if (isQuadratic(eqInputs.get(2).input)) {
      testEq3 = new QuadraticEquation(eqInputs.get(2).input);
    } else if (isTrig(eqInputs.get(2).input)) {
      testEq3 = new PolarEquation(eqInputs.get(2).input);
    } else {
      testEq3 = new LinearEquation(eqInputs.get(2).input);
    }
    if (isQuadratic(eqInputs.get(3).input)) {
      testEq4 = new QuadraticEquation(eqInputs.get(3).input);
    } else if (isTrig(eqInputs.get(3).input)) {
      testEq4 = new PolarEquation(eqInputs.get(3).input);
    } else {
      testEq4 = new LinearEquation(eqInputs.get(3).input);
    }
    //<<<<<<<<<<<<<<<<<<<  XMIN & XMAX INPUT >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    if (!eqInputs.get(4).input.equals("") || !eqInputs.get(5).input.equals("")) {
      testEq1.xMin = parseFloat(eqInputs.get(4).input);
      if (testEq1.xMin <= parseFloat(eqInputs.get(5).input)) {
        testEq1.xMax = parseFloat(eqInputs.get(5).input);
      } else {
        testEq1.xMax = testEq1.defXmax;
      }
    }
    if (!eqInputs.get(6).input.equals("") || !eqInputs.get(7).input.equals("")) {
      testEq2.xMin = parseFloat(eqInputs.get(6).input);
      if (testEq2.xMin <= parseFloat(eqInputs.get(7).input)) {
        testEq2.xMax = parseFloat(eqInputs.get(7).input);
      } else {
        testEq2.xMax = testEq2.defXmax;
      }
    }
    if (!eqInputs.get(8).input.equals("") || !eqInputs.get(9).input.equals("")) {
      testEq3.xMin = parseFloat(eqInputs.get(8).input);
      if (testEq3.xMin <= parseFloat(eqInputs.get(9).input)) {
        testEq3.xMax = parseFloat(eqInputs.get(9).input);
      } else {
        testEq3.xMax = testEq3.defXmax;
      }
    }
    if (!eqInputs.get(10).input.equals("") || !eqInputs.get(11).input.equals("")) {
      testEq4.xMin = parseFloat(eqInputs.get(10).input);
      if (testEq4.xMin <= parseFloat(eqInputs.get(11).input)) {
        testEq4.xMax = parseFloat(eqInputs.get(11).input);
      } else {
        testEq4.xMax = testEq4.defXmax;
      }
    }
  }

  void testInputs(boolean a, boolean b, boolean c, boolean d) {
    if (a) {
      testEq1.testEquation(#F03AB3);
    }
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
    TextBox box1a = new TextBox(30, 55);
    TextBox box1b = new TextBox(30, 55);
    TextBox box2 = new TextBox(30, 55); 
    TextBox box2a = new TextBox(30, 55);
    TextBox box2b = new TextBox(30, 55);
    TextBox box3 = new TextBox(30, 55); 
    TextBox box3a = new TextBox(30, 55);
    TextBox box3b = new TextBox(30, 55);
    TextBox box4 = new TextBox(30, 55); 
    TextBox box4a = new TextBox(30, 55);
    TextBox box4b = new TextBox(30, 55);
    eqInputs.add(box1); // index 0
    eqInputs.add(box2); // index 1
    eqInputs.add(box3); // index 2
    eqInputs.add(box4); // index 3
    eqInputs.add(box1a); // index 4
    eqInputs.add(box1b); // index 5
    eqInputs.add(box2a); // index 6
    eqInputs.add(box2b); // index 7
    eqInputs.add(box3a); // index 8
    eqInputs.add(box3b); // index 9
    eqInputs.add(box4a); // index 10
    eqInputs.add(box4b); // index 11
    current = new TextBox(50, 50);
  }
  //  @Override
  public void display() {
    background(255); 
    fill(255);
    if (graphMode == 0) {
      graphGrid(gridRatio);
    } else if (graphMode == 1) {
      graphPolar(gridRatio);
    }
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
    }
    settingsWindow(); 
    inputWindow();
  }
}

