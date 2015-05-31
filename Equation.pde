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


