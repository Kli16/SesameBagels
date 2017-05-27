float dx, dy, dz;
DashedLine right, left;

void setup() {
  
  size(1280, 720);
  background(255);
  dy = 1;
  dx = 1;
  dz = 5;
  left = new DashedLine(width/2 + 50, height/3, dx, dy);
  right = new DashedLine(width/2 - 50, height/3, dx * -1, dy);
}

void draw() {
  println("drawing");
  dy += dz;
  dx += dz;
  background(255);
  right.DrawDash(right.xStart, right.yStart, dx * -1, dy);
  left.DrawDash(left.xStart, left.yStart, dx, dy);
  
}

//float x1 = width/2 - 50;
//float x2 = width/2 + 50;
//line(0, 720, x1, height/3);
//line(1280, 720, x2, height/3);
//float slope1 = (height/3 - 720) / (((x2 - x1)/3) - 1280/3);
//float slope2 = (height/3 - 720)/ ((x1 + (x2 - x1)/3 * 2) - 1280/3 * 2);

//line(1280/3, 720, x1 + (x2 - x1)/3, height/3);
//line(1280/3 * 2, 720, x1 + (x2 - x1)/3 * 2, height/3);