class Ball {

  float x;
  float y;
  float rad;
  color c;


  Ball( float newx, float newy){
    x = newx;
    y = newy;
    rad = 30;
    c = color(random(255), random(255), random(255));
  }
}