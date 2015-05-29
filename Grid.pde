void graphGrid(int scale) {
  stroke(0);
  for (int i = 1; i <= height/scale; i++) {
    if (i==(height/scale)/2) {
      strokeWeight(2);
      yCenter = i*scale;
    } else {
      strokeWeight(1);
    }
    line(0, i*scale, width, i*scale);
  }
  for (int i = 1; i <= width/scale; i++) {
    if (i==(width/scale)/2) {
      strokeWeight(2);
      xCenter = i*scale;
    } else {
      strokeWeight(1);
    }
    line(i*scale, 0, i*scale, height);
  }
}

void testEquation(int m, int b) {
  // y = mx + b form
  // gridScale = 25
  for (int x = (-1)*(xCenter); x <= xCenter; x++) {
    ellipse(x+xCenter, m*x+(b*25)+yCenter, 2, 2);
  }
}

void settingsButton() {
  rectMode(CENTER);
  fill(0);
  rect(30, 10, 60, 20);
  p = createFont("Arial", 15, true);
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
    rect(30, 30, 60, 20);
    p = createFont("Georgia", 15, true);
    textFont(p, 15);                
    fill(255); 
    if (!inputWindowOpen) {    
      text("Input", 0, 35);
    } else {
      text("Close", 0, 35);
    }
    if (mousePressed) {
      if (mouseX > 0 && mouseY > 0 && mouseX < 60 && mouseY < 20) {
        NewFrame yo = new NewFrame();
        inputWindowOpen = true;
      }
    }
  }

