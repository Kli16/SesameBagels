class Ball {
  PVector pos, vel, hitLoc;
  int size, dir, zCoord;
  float boxX1, boxY1, boxX2, boxY2;

  Ball() {
    size = 50;
    dir = -2;
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hitLoc = new PVector();
    zCoord = 100;
  }

  void display() {
    fill(255);
    stroke(255);
    ellipse(pos.x, pos.y, size, size);
    update();
  }

  void update() {
    size = zCoord + 20;
    zCoord += dir;
    pos.x += vel.x;
    pos.y += vel.y;
    bounceBox();
    if (zCoord >= 100 || zCoord <= 0) {
      dir *= -1;
    }
  }

  void lose() {
    dir = 0;
    noLoop();
  }


  void bouncePaddle() {
    vel.x = (pos.x - paddle.position.x) * 0.1;
    vel.y = (pos.y - paddle.position.y) * 0.1;
  }

  void drawBox() {
    boxX1 = ( ((100.0 - zCoord)/100) * (width/2 - width * .15) );
    boxY1 = ( ((100.0 - zCoord)/100) * (height/2 - height * .15) );
    boxX2 = width - boxX1;
    boxY2 = height - boxY1;
    noFill();
    rectMode(CORNERS);
    rect(boxX1, boxY1, boxX2, boxY2);
  }

  void bounceBox() {
    if (pos.x <= boxX1 + size/2) {
      vel.x *= -1;
      pos.x += 10;
    }
    if (pos.y <= boxY1 + size/2) {
      vel.y *= -1;
      pos.y += 10;
    }
    if (pos.x >= boxX2 - size/2) {
      vel.x *= -1;
      pos.x -= 10;
    }
    if (pos.y >= boxY2 - size/2) {
      vel.y *= -1;
      pos.y -= 10;
    }
  }
}