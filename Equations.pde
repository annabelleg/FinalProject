public class EquationApplet extends PApplet {
  TextBox typing = new TextBox(30, 55);

  public void setup() {
    background(#6FF598);
  }

  public void draw() {
    p = createFont("Georgia", 24);
    textFont(p, 24);                
    fill(255);                  
    text("Input Your Equation", 0, 25);

    rectMode(CENTER);
    fill(255);
    rect(100, 50, 150, 25);
    //    p = createFont("Georgia", 18);
    //    textFont(p, 18);                
    //    fill(0);  
    //    text("Zoom In", 15, 60);   
    // Changes Scale
    if (mousePressed) {
      if (mouseX > 25 && mouseX < 175 && mouseY > 38 && mouseY < 62) {
        typeMode = true;
      }
    }
    textFont(p, 15);                
    fill(0);                    
    text(typing.input, 30, 55);
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
      if (key == ENTER) {
        drawEquation = true;
        typeMode = false;
      }
      if (key == BACKSPACE) {
        typing.erase();
      }
    }
  }
}

