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
  LinearEquation testEq1, testEq2, testEq3, testEq4;
  float step = 0.1;

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
      p = createFont("Georgia", 18);
      textFont(p, 18);                
      fill(255);  
      //    text("Draw It", 15, 160);   
      // Changes Scale
      if (mousePressed) {
        if (mouseX > 13 && mouseX < 87 && mouseY > 108 && mouseY < 162) {
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

  void settingsWindow() {
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
        }
      }
    }
  }

  public RedCircle(PApplet parentApplet) {
    super(parentApplet);
  }

  // @Override
  public void init() {
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
      testEq1 = new LinearEquation(eqInputs.get(0).input);
      testEq2 = new LinearEquation(eqInputs.get(1).input);
      testEq3 = new LinearEquation(eqInputs.get(2).input);
      testEq4 = new LinearEquation(eqInputs.get(3).input);
      done = true;
    }
    if (drawEquation) {
      fill(255, 0, 0);
      noStroke();
      testEq1.testEquation(#F03AB3);
      testEq2.testEquation(#4BBCF7);
      testEq3.testEquation(#22DE4F);
      testEq4.testEquation(#FAD414);
    }
    settingsWindow();
    inputWindow();
  }
}

