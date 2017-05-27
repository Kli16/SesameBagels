float dx, dy, dz;
DashedLine right, left;

void setup() {
  size(1280, 720);
  background(255);
}

void draw() {
  println("drawing");
  dy = 1;
  dx = 1;
  dz = 5;
  left = new DashedLine(width/2 + 50, height/3, dx, dy);
  right = new DashedLine(width/2 - 50, height/3, dx, dy);
  background(255);
  dy += dz;
  dx += dz;
  for (int i = 0; i < 100; i += 5) {
    right.DrawDash(right.xStart + i, right.yStart + i, dx, dy);
    left.DrawDash(left.xStart + i, left.yStart + i, dx, dy);
  }
}

//float x1 = width/2 - 50;
//float x2 = width/2 + 50;
//line(0, 720, x1, height/3);
//line(1280, 720, x2, height/3);
//float slope1 = (height/3 - 720) / (((x2 - x1)/3) - 1280/3);
//float slope2 = (height/3 - 720)/ ((x1 + (x2 - x1)/3 * 2) - 1280/3 * 2);

//line(1280/3, 720, x1 + (x2 - x1)/3, height/3);
//line(1280/3 * 2, 720, x1 + (x2 - x1)/3 * 2, height/3);