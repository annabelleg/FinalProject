public class EquationApplet extends PApplet {

  public void setup() {
    background(255);
  }

  public void draw() {
    p = createFont("Arial", 24, true);
     textFont(p, 24);                
     fill(255, 0, 0);                    
     text(current.input, current.xCor, current.yCor);
  }
}
