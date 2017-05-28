class Octos {
  PImage real;
  PImage temp;
  String filename;
  float xV;
  float yV;
  float x;
  float y;
  int z;
  boolean _status; //true is alive, false is dead
  boolean a;
  boolean b;

  Octos(String filename, float xcor, float ycor) {
    real = loadImage(filename);
    temp = real.get();
    temp.resize(0, 50);
    yV = random(4, 15);
    xV = random(-yV, yV);
    x = xcor;
    y = ycor;
    z = 50;
    _status = true;
    a = true;
    b = true;
  }

  void MoveCharacter() {
    if (_status) {
      //temp.loadPixels();
      //for (int i = 0; i < temp.pixels.length; i++){ 
      //  temp.pixels[i] = color(255, 255, 255);
      //}
      //temp.updatePixels();
      temp = real.get();
      temp.resize(0, z);
      image(temp, x, y);
    }
    x = x + xV;
    y = y + yV;
    z = 50 + (int)(y/3);
    if ((x > width + 400) || (y > height)) {
      x = width/2 - 50;
      y = height/3 - 100;
      z = 50;
      yV = random(4, 15);
      xV = random(-yV, yV);
      _status = true;
      a = true;
      b = true;
    }
  }
}