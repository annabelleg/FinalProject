void settingsWindow() {
  rectMode(CENTER);
  fill(0);
  rect(30, 10, 60, 20);
  p = createFont("Georgia", 15, true);
  textFont(p, 15);                
  fill(255); 
  if (!settingsWindowOpen) {    
    text("Settings", 0, 15);
  } else {
    text("Close", 0, 15);
  }
  if (mousePressed) {
    if (mouseX > 0 && mouseY > 0 && mouseX < 60 && mouseY < 20) {
      if (!settingsWindowOpen) {
        PFrame f = new PFrame();
        settingsWindowOpen = true;
      }
    }
  }
}

void inputWindow() {
  rectMode(CENTER);
  fill(0);
  rect(100, 10, 60, 20);
  p = createFont("Georgia", 15, true);
  textFont(p, 15);   
  fill(255); 
  if (!inputWindowOpen) {    
    text("Input", 75, 15);
  } else {
    text("Close", 75, 15);
  }
  if (mousePressed) {
    if (mouseX > 70 && mouseY > 0 && mouseX < 130 && mouseY < 20) {
      if (!inputWindowOpen) {
        NewFrame yo = new NewFrame();
        inputWindowOpen = true;
      }
    }
  }
}

