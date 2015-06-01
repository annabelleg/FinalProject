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

  '+', '-', '*', '/', '^', '!', '=', '(', ')', '.', ','
};

// FIGURE OUT HOW TO DO OPERATIONS

public class TextBox {

  String input;
  int xCor, yCor; //center points

  TextBox(int x, int y) {
    input = "";
    xCor = x;
    yCor = y;
    String input = "";
    int xCor, yCor; //center points
    int maxChar;
    int nowChar;

    TextBox(int x, int y, int maxC) {
      input = "";
      xCor = x;
      yCor = y;
      maxChar = maxC;
      nowChar = 0;
    }

    void typeIn(String letter) {
      input += letter;
    }
    void erase() {
      input = input.substring(0, input.length()-1);
      nowChar++;
    }
    void erase() {
      if (nowChar>0) {
        input = input.substring(0, input.length()-1);
        nowChar--;
      }
    }
  }
}

void keyPressed() {
  if (mode == GRAPH) {
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
    //keyCode for TAB == 9
    else if (mode == ENTER_MATRIX) {
      if (enterRows) {
        String r = key+"";
        rows = Integer.parseInt(r);
        enterRows = false;
      }
      if (enterColumns) {
        String c = ""+key;
        cols = Integer.parseInt(c);
        enterColumns = false;
      }
    }
  }
}

