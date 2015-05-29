public class settingsApplet extends PApplet {

  public void setup() {
    background(#E8B4FF);
  }
  public void draw() {

    // Heading
    p = createFont("Georgia", 24);
    textFont(p, 24);                
    fill(255);                  
    text("Graph Settings", 0, 25);

    // ZOOM IN
    rectMode(CENTER);
    fill(0);
    rect(50, 50, 75, 25);
    p = createFont("Georgia", 18);
    textFont(p, 18);                
    fill(255);  
    text("Zoom In", 15, 60);   
    // Changes Scale
    if (mousePressed) {
      if (mouseX > 13 && mouseX < 87 && mouseY > 38 && mouseY < 62) {
        gridRatio+= 2;
      }
    } 
    // ZOOM OUT
    rectMode(CENTER);
    fill(0);
    rect(50, 100, 75, 25);
    p = createFont("Georgia", 16);
    textFont(p, 16);                
    fill(255);  
    text("Zoom Out", 15, 110);   
    // Changes Scale
    if (mousePressed) {
      if (mouseX > 13 && mouseX < 87 && mouseY > 58 && mouseY < 112) {
        if (gridRatio > 2) {
          gridRatio-= 2;
        }
      }
    }

    // SHOW EQUATION
    rectMode(CENTER);
    fill(0);
    rect(50, 150, 75, 25);
    p = createFont("Georgia", 18);
    textFont(p, 18);                
    fill(255);  
    text("Draw It", 15, 160);   
    // Changes Scale
    if (mousePressed) {
      if (mouseX > 13 && mouseX < 87 && mouseY > 108 && mouseY < 162) {
        drawEquation = true;
      }
    }
  }
}
