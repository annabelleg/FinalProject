  int b1x, b1y;
int b2x, b2y;
int b3x, b3y;
int buttonLength = 130;
int buttonHeight = 40;

void setup() {
 size(400,400);
 b1x=b2x=b3x=150;
 b1y = 135;
 b2y = b1y + buttonHeight + 10;
 b3y = b2y + buttonHeight + 10;
}

void draw(){
 background(225);
 fill(0); 
 textSize(15); 
 textAlign(CENTER); 
 text("Hello! Welcome to Mariya and Annabelle's \ncalculator extraordinaire.\nWhat would you like to do?", 200,25);
 stroke(0);
 rect(b1x,b1y, buttonLength, buttonHeight);
 stroke(0);
 rect(b2x,b2y, buttonLength, buttonHeight);
 stroke(0);
 rect(b3x,b3y, buttonLength, buttonHeight);
 textSize(10);
 fill(255);
 textAlign(CENTER);
 text("Graph Equations!", b1x+65, b1y + 20);
 text("Matrix stuff!", b2x+65, b2y + 20);
 text("Evaluate expressions!", b3x+65, b3y+20);
}
