/*public class QuadraticEquation extends Equation {
  // y = ax^2 + bx + c
  float a, b, c;

  QuadraticEquation(String eq) {
    super(eq);
    findA();
    findB();
    findC();
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
    } else {
      findBar(equation.substring(2, getXsquared()));
      if (equation_[0].equals("y") && equation_[1].equals("=")) {
        if (!hasFraction) {
          a = parseFloat(equation.substring(2, getXsquared()));
        } else {
          float numerator = parseFloat(equation.substring(2, indexBar));
          float denominator = parseFloat(equation.substring(indexBar+1, getXsquared()));
          a = numerator/denominator;
        }
      }
    }
  }

  void findB() {
    hasFraction = false;
    if (equation.length() <= 6) {
      b = 0;
    } else {
      int ex = findX();
      int exT = getXsquared();
      if (ex-exT == 3) {
        b = 1;
        return;
      }
      findBar(equation.substring(exT+4, ex));
      if (!hasFraction) {
        b = parseFloat(equation.substring(exT+3, ex));
      } else {
        float numerator = parseFloat(equation.substring(exT, indexBar));
        float denominator = parseFloat(equation.substring(indexBar+1, ex));
        b = numerator/denominator;
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
  }
}*/

