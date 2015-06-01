public class Matrix {
  double[][] data;
  int[][][] coords;
  int rows, cols;

  Matrix(int r, int c) {
    rows = r; 
    cols = c;
    data = new double[r][c];
    coords = new int[r][c][2];
    enterData();
  }
  void enterData() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        data[r][c] = (int) (Math.random()*10) * 1.0;
      }
    }
  }
  void displayMatrix() {
    textSize(15);
    fill(0, 0, 0, 100);
    int rectW = cols*20;
    int rectH = rows*50;
    rect(rectW, rectH, cols*50, rows*50);
    fill(225);
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        text(String.valueOf(data[r][c]).substring(0, 3), rectW+ c*50 +15, rectH + r*50 + 25);
        coords[r][c][0] = rectW+ c*50 +15;
        coords[r][c][1] = rectH + r*50 + 25;
      }
    }
  }
  void displayREF() {
    textSize(15);
    fill(0, 0, 0, 100);
    int rectW = cols*80 ;
    int rectH = rows*50;
    rect(rectW, rectH, cols*50, rows*50);
    fill(225);
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        text(String.valueOf(data[r][c]).substring(0, 3), rectW+ c*50 + 25, rectH + r*50 + 25);
      }
    }
  }

  void REF() {
    exchange();
    dilateAndShear();
    checkMatrix();
  }
  void exchange() {
    for (int r = 0; r < rows; r++) {
      int k = 1;
      while (k < rows-r) {
        if (findLeadingEntry(r) > findLeadingEntry(r+k)) {
          switchRows(r, r+k);
        }
        k++;
      }
    }
  }
  int findLeadingEntry(int row) {
    for (int c = 0; c < cols; c++) {
      if (data[row][c] != 0.0)
        return c;
    }
    return -1;
  }
  void switchRows(int a, int b) {
    for (int c = 0; c < cols; c++) {
      double temp = data[a][c];
      data[a][c] = data[b][c];
      data[b][c] = temp;
    }
  }

  void dilateAndShear() {
    int r=0;
    while (r < rows) {
      int c = findLeadingEntry(r);
      if (c >= 0) {
        dilate(r, c);
        shear(r, c);
      }
      r++;
    }
  }
  void dilate(int r, int c) {
    if (data[r][c] != 1.0) {
      double val = 1/data[r][c];
      for (int i = c; i < cols; i++) {
        data[r][i] = data[r][i]*val;
      }
    }
  }

  void shear(int r, int c) {
    int tempr = 0;
    while (tempr < rows) {
      if (tempr != r) {
        double shearval = data[tempr][c];
        int startval = findLeadingEntry(tempr);
        for (int i = startval; i < cols; i++) {
          data[tempr][i] = data[tempr][i] + (-1)*shearval*(data[r][i]);
        }
      }
      tempr++;
    }
  }
  void checkMatrix() {
    for (int r = 1; r < rows; r++) {
      if (findLeadingEntry(r) <= findLeadingEntry(r-1)) {
        switchRows(r, r-1);
      }
    }
  }
}

void MatrixStuff() {
  background(225);
  fill(0);
  text("Enter dimensions of your matrix:", width/4, height/8);
  text("Rows:", width/8 + 5, height/8 + 25);
  text("Columns:", width/4 + 65, height/8 + 25);
  fill(225, 225, 225);
  rect(width/8 + 30, height/8 + 10, 50, 17);
  rect(width/4 + 100, height/8 + 10, 50, 17);
  fill(0);
  text(rows, width/8 + 40, height/8 + 25);
  text(cols, width/4 + 110, height/8 + 25);
  stroke(0);
  if (rows != 0 && cols != 0) {
    m = new Matrix(rows, cols);  
    if (!toShowMatrix) {
      m.displayMatrix();
      toShowMatrix = true;
    }
  }
  fill(225);
  rect(width/3, height - height/4, width/3, height/8);
  fill(0);
  textAlign(CENTER);
  textSize(15);
  text("Compute \nReduced Echelon Form", width/3+100, height - height/4 + 30);
}
void showREF() {
  m.REF();
  m.displayREF();
  toShowREF = true;
}
