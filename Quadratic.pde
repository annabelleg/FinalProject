public class QuadraticEquation extends Equation {
  // y = ax^2 + bx + c
  float a, b, c;

  QuadraticEquation(String eq) {
    super(eq);
  }

  void findA() {
    if (equation_[1].equals("=") && equation_[2].equals("x")) {
      a = 1;
    } else {
      findBar(equation.substring(2, findX()));
      int ex = 0;
      if (equation_[0].equals("y") && equation_[1].equals("=")) {
        ex = findX();
        if (!hasFraction) {
          a = parseFloat(equation.substring(2, ex));
        } else {
          float numerator = parseFloat(equation.substring(2, indexBar));
          float denominator = parseFloat(equation.substring(indexBar+1, ex));
          a = numerator/denominator;
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
}

