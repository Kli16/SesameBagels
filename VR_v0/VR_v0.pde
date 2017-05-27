

import processing.video.*;

Capture cam;

PImage original, updated ;

int red, green, blue;

void setup() {
  size(1280, 720);
  background(color(240, 240, 240)) ;

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + " " + cameras[i]);
    }

    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  original = cam ;
  updated = new PImage (original.width, original.height) ;
  color_replace() ;
  //image(updated, 0, 0) 
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  println(red(color(get(mouseX, mouseY))), green(color(get(mouseX, mouseY))), blue(color(get(mouseX, mouseY)))) ;
}

void color_replace() {
  float sumX=0, sumY=0;
  int total=0;
  for (int i = 0; i < original.width; i++) {
    for (int j = 0; j < original.height; j ++) {
      color c = original.get(i, j);
      float r = red(c);
      float g = green(c);
      float b = blue(c); //base color = 30, 200, 145
      float d = sqrt(30-r);
      if (r>60 && r <140 && g > 140 && g < 160 && b > 140 && b < 160) {
        set(width-i, j, color(0, 0, 255)) ;
        sumX += i;
        sumY += j;
        total ++;
      } else {
        set(width-i, j, color(r, g, b));
      }
    }
  }
  int avgX = (int)(sumX / total);
  int avgY = (int)(sumY / total);
  fill(0);
  println(avgX, avgY);
  ellipse(width-avgX, avgY, 50, 50);
}