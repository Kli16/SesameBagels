class Paddle {
  PVector position, vel;
  int size, total, avgX, avgY;
  float sumX, sumY;
  color trackc;

  Paddle(int bigness) {
    trackc = color(70,150,150);
    size = bigness;
    position = new PVector(width/2 - 75, height/2 - 56.25);
  }

  void move() {
    position.x = width - avgX - 175;
    position.y = avgY - 125;
  }

  void display() {
    fill(255, 200);
    rectMode(CORNER);
    rect(position.x, position.y, size, size - (size / 4));
  }

  void color_replace(PImage original, PImage updated) {
    //if (r>60 && r <140 && g > 140 && g < 160 && b > 140 && b < 160)
    sumX = 0;
    sumY = 0;
    total = 0;
    for (int i = 0; i < original.width; i++) {
      for (int j = 0; j < original.height; j ++) {
        color currentc = original.get(i, j);
        float r1 = red(currentc);
        float g1 = green(currentc);
        float b1 = blue(currentc); //base color = 30, 200, 145
        float r2 = red(trackc);
        float g2 = green(trackc);
        float b2 = blue(trackc);
        float d = dist(r1, g1, b1, r2, g2, b2);
        //float d = sqrt(30-r);
        if (d < 30) {
          updated.set(width-i, j, color(0, 0, 255)) ;
          sumX += i;
          sumY += j;
          total ++;
        } else {
          updated.set(width-i, j, color(r1, g1, b1));
        }
      }
    }
    avgX = (int)(sumX / total);
    avgY = (int)(sumY / total);
  }

  void follow(Ball ball) {
    if (ball.zCoord < 20) {
      PVector placeHolder = ball.pos.copy();
      vel = placeHolder.sub(position.x + 75, position.y + 56.25);
      vel.normalize();
      vel.mult(15);
      position.x += vel.x;
      position.y += vel.y;
    } else {
      PVector placeHolder = new PVector (width/2 - 75, height/2 - 56.25);
      vel = placeHolder.sub(position.x, position.y);
      vel.normalize();
      vel.mult(5);
      position.x += vel.x;
      position.y += vel.y;
    }
  }
}