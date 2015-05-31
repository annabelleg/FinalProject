public class Equation {

  ArrayList<Coordinate> data;
  String equation;
  String[] equation_;
  boolean linear = false;
  boolean parabola = false;

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

  float findY() {
    float m = 0;
    int ex = 0;
    if (equation_[0].equals("y") && equation_[1].equals("=")) {
      ex = findX();
      m = parseInt(equation.substring(2, ex));
    }
    return m;
  }

  public class Coordinate {

    float x, y; 

    public Coordinate(float x, float y) {
      this.x = x; 
      this.y = y;
    }
  }
}

