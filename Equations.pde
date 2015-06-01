public class EquationApplet extends PApplet {
  TextBox typing = new TextBox(30, 55, 20);
  boolean linear = false;
  boolean a = false;
  boolean b = false;
  boolean c = false;

  // TextBox a = newTextBox(25, 100, 4);
  //  TextBox b = newTextBox(25, 100, 4);
  // TextBox c = newTextBox(25, 100, 4);

  public void setup() {
    background(#6FF598);
  }

  public void draw() {

    if (destroyInput) {
      //   frame.setVisible(false);
    }

    p = createFont("Georgia", 24);
    textFont(p, 24);                
    fill(255);                  
    text("Input Your Lineaer Equation", 0, 25);
    p = createFont("Georgia", 15);
    textFont(p, 15);                
    fill(0);                  
    text("In the form y=mx+b and\npress enter to graph", 200, 45);

    rectMode(CENTER);
    fill(255);
    rect(100, 50, 150, 25);

    p = createFont("Georgia", 24);
    textFont(p, 24);                
    fill(255);                  
    text("Quadratic Equation", 0, 100);

    rectMode(CENTER);
    fill(255);
    rect(29, 120, 30, 25);
    p = createFont("Georgia", 24);
    textFont(p, 24);                
    fill(0);                  
    text("x", 48, 125);

    // Changes Scale
    if (mousePressed) {
      if (mouseX > 25 && mouseX < 175 && mouseY > 38 && mouseY < 62) {
        typeMode = true;
        linear = true;
        a = false;
        typing.input = "";
        typing.maxChar = 20;
      }
      if (mouseX > 14 && mouseX < 44 && mouseY > 107 && mouseY < 132) {
        typeMode = true;
        linear = false;
        a = true;
        typing.input = "";
        typing.maxChar = 3;
      }
    }
    if (linear) {
      textFont(p, 15);                
      fill(0);                    
      text(typing.input, 30, 55);
    }

    if (a) {
      textFont(p, 18);                
      fill(0);                    
      text(typing.input, 15, 125);
    }
  }

  void keyPressed() {
    //  print(typeMode);
    //  print(a);
    print(typing.input + " ");
    if (typeMode) {
      if (typing.nowChar < typing.maxChar) {
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
          theEquation = typing.input;
          drawEquation = true;
          typeMode = false;
        }
      }
      if (key == BACKSPACE) {
        typing.erase();
      }
    }
  }
}

