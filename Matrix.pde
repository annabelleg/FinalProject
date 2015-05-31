public class Matrix {
  double[][] data;
  int[][][] coords;
  int rows, cols;

  public  Matrix(int r, int c) {
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
    data[0][0] = 0.0;
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

