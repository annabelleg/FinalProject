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
    return 3.4
  }

  float getM() {
    return m;
  }
  float getB() {
    return b;
  }
  
  void makeData(){
    
  }



  void testEquation() {
    // y = mx + b form
    for (int x = (-1)*(xCenter); x <= xCenter; x++) {
      ellipse(x+xCenter, yCenter-(m*x+(b*gridRatio)), 2, 2);
      Coordinate c = new Coordinate(x, (m*x)+b);
      data.add(c);
    }
  }
}

