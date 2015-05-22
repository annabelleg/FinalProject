void graphGrid(int scale) {
  for (int i = 1; i <= height/scale; i++) {
    if (i==(height/scale)/2) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(0, i*scale, width, i*scale);
  }
  for (int i = 1; i <= width/scale; i++) {
    if (i==(width/scale)/2) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(i*scale, 0, i*scale, height);
  }
}

