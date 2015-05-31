public class Equation {

  ArrayList<Coordinate> data;
  String equation;
  String[] equation_;

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

  /* String toString() {
   String result = ""; 
   for (int i = 0; i < data.size (); i++) {
   result += data.get(i) + " ";
   } 
   return result;
   }*/
}

public class Coordinate {

  float x, y; 

  public Coordinate(float x, float y) {
    this.x = x; 
    this.y = y;
  }
  /*String toString() {
   return "(" + x "," + y + ")";
   }*/
}

