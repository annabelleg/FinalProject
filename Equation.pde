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
  }

  void fillEq() {
    for (int i = 0; i < equation_.length; i++) {
      equation_[i] = equation.substring(i, i+1);
    }
  }

  void makeData() {
    // y = mx + b;
    float yTemp; 
    for (float i = 0; i < 10; i++) {
      yTemp = 6;
    }
  }

  String giveEquation() {
    String result = "[ ";
    for (int i =0; i<equation_.length; i++) {
      result += equation_[i] + ",";
    }
    return result + "]";
  }

  int findX() {
    int index = 0;
    while (!equation_[index].equals ("x")) {
      index++;
    }
    return index;
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

public class LinearEquation extends Equation {
  // y = mx+b
  float m;
  float b;

  void findM() {
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

  float findY() {
    return m;
  }

  LinearEquation(String eq) {
    super(eq);
    findM();
  }

}

