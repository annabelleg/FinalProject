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

  public abstract void makeData();

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
    if (equation_[1].equals("=") && equation_[2].equals("x")) {
      m = 1;
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
    if (equation.length() > 3) {
      hasFraction = false;
      findBar(equation.substring(findX()+2, equation.length()));
      boolean positive = true;
      //float num;
      if (equation_[findX()+1].equals("-")) {
        b = parseFloat(equation.substring(findX()+2, equation.length())) * (-1.0);
      } else {
        b = parseFloat(equation.substring(findX()+2, equation.length()));
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

  LinearEquation(String eq) {
    super(eq);
    findM();
    findB();
  }
}

