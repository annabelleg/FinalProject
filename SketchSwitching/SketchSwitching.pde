//creating a list of our apps
ArrayList<AppBase> apps;
import javax.swing.JFrame;
import java.util.*;
import java.io.*;

int selected;

void setup() {
  size(600, 578);
  background(255);
  rectMode(CENTER);

  //creating an instance of our list
  apps = new ArrayList<AppBase>();

  //adding each of our nested Applets to the list.
  apps.add(new RedCircle(this));
  apps.add(new BlueSquare(this));
  apps.add(new HomePage(this));

  //calling the initialization function on each
  //Applet in the list.
  for (AppBase a : apps) {
    a.init();
  }

  selected = 2;
}

void draw() {
  //we call the display method of
  //the selected app.
  apps.get(selected).display();
}

/**
 * Here we use key presses to determine which
 * app to display. 
 **/
void keyPressed() {
  if (key == '0') {
    selected = 0;
  }
  if (key == '1') {
    selected = 1;
  }
  if (key == '2') {
    selected = 2;
  }
}
void mouseClicked() {
  if (mouseX > 265 && mouseX < 390 && mouseY > 220 && mouseY < 260) {
    selected = 0;
  } else if (mouseX > 265 && mouseX <390 && mouseY > 220 && mouseY < 260) {
    selected = 1;
  }
}

