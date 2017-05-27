import processing.video.*;

Capture cam;

PImage original, updated;
int red, green, blue;
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

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("no camera");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + " " + cameras[i]);
    }

    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  background(255);
  if (cam.available() == true) {
    cam.read();
  }
  original = cam ;
  updated = new PImage (original.width, original.height);
  show();
  //color_replace() ;
  //image(updated, 0, 0) 
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  println(red(color(get(mouseX, mouseY))), green(color(get(mouseX, mouseY))), blue(color(get(mouseX, mouseY)))) ;
}

void show() {
  for (int i = 0; i < original.width; i++) {
    for (int j = 0; j < original.height; j ++) {
      color c = original.get(i, j);
      float r = red(c);
      float g = green(c);
      float b = blue(c); //base color = 30, 200, 145
      float d = sqrt(30-r);
      set(width-i, j, color(r, g, b));
    }
  }
}


//if (dx == 1 && dy ==1) {
//  left = new DashedLine(width/2 + 50, height/3, dx, dy);
//  right = new DashedLine(width/2 - 50, height/3, dx * -1, dy);
//}
//dy += dz;
//dx += dz;
//background(255);
//right.DrawDash(right.xStart, right.yStart, dx * -1, dy);
//left.DrawDash(left.xStart, left.yStart, dx, dy);
//dx = 10;
//dy = 10;
//
//float x1 = width/2 - 50;
//float x2 = width/2 + 50;
//line(0, 720, x1, height/3);
//line(1280, 720, x2, height/3);
//float slope1 = (height/3 - 720) / (((x2 - x1)/3) - 1280/3);
//float slope2 = (height/3 - 720)/ ((x1 + (x2 - x1)/3 * 2) - 1280/3 * 2);

//line(1280/3, 720, x1 + (x2 - x1)/3, height/3);
//line(1280/3 * 2, 720, x1 + (x2 - x1)/3 * 2, height/3);