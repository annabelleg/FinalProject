public class EquationApplet extends PApplet {
  
  TextBox typing = new TextBox(30, 30);

  public void setup() {
    background(255);
  }

  public void draw() {
    textFont(p, 24);                
    fill(255, 0, 0);                    
    text(typing.input, 30, 30);
  }

  void keyPressed() {
    if (typeMode) {
      for (int i = 0; i < 26; i++) {
        if (key == alphabetLower[i]) {
          typing.typeIn(String.valueOf(alphabetLower[i]));
        }
        if (key == alphabetUpper[i]) {
          typing.typeIn(String.valueOf(alphabetUpper[i]));
        }
      }
      for (int i = 0; i < 10; i++) {
        if (key == numbers[i]) {  
          typing.typeIn(String.valueOf(numbers[i]));
        }
      }
      for (int i = 0; i < 9; i++) {
        if (key == operations[i]) {  
          typing.typeIn(String.valueOf(operations[i]));
        }
      }
      if (key == ' ') {
        typing.typeIn(" ");
      }
      // FIGURE OUT BACKSPACE
    }
  }
}

