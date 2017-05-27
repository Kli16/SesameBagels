import processing.video.*;

Capture cam;
Paddle paddle, ai;
PImage original, updated ;
Ball ball;
int red, green, blue, avgX, avgY, score;

float paddleX, paddleY, paddleZ;

void setup() {
  size(1280, 720);
  background(0);
  score = 0;

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
  ball = new Ball();
  paddle = new Paddle(350);
  ai = new Paddle(150);
  //ai.position.x -= 75;
  //ai.position.y -= 56.25;
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(10);
  if (cam.available() == true) {
    cam.read();
  }
  original = cam;
  updated = new PImage (original.width, original.height) ;
  createRoom();
  AI();
  ai.display();
  ai.follow(ball);
  ball.display();
  paddle.color_replace(original, updated) ;
  paddle.move();
  paddle.display();
  ball.drawBox();
  checkLoss();
  textSize(50);
  fill(255);
  text("SCORE :" + score, 0, 50);
  //tint(255, 50);
  //image(updated, 0, 0); 
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  //println(red(color(get(mouseX, mouseY))), green(color(get(mouseX, mouseY))), blue(color(get(mouseX, mouseY)))) ;
  println(ai.position.x, ai.position.y);
  println(ball.zCoord);
  println(ball.pos.x, ball.pos.y);
}

/*void createRoom() {
 rect (width/2 - 175, height/2 - 125, 350, 250);
 line(width/2 -175, height/2 - 125, 0, 0);
 line(width/2 + 175, height/2 - 125, width, 0);
 line(width/2 - 175, height/2 + 125, 0, height);
 line(width/2 + 175, height/2 + 125, width, height);
 }*/

void createRoom() {
  fill(0);
  rectMode(CORNER);
  rect(width/2 - width * .15, height/2 - height * .15, width * .3, height * .3);
  line(width/2 - width * .15, height/2 - height * .15, 0, 0);
  line(width/2 + width * .15, height/2 - height * .15, width, 0);
  line(width/2 - width * .15, height/2 + height * .15, 0, height);
  line(width/2 + width * .15, height/2 + height * .15, width, height);
}


void checkLoss() {
  if (ball.zCoord == 100) {
    println("one hunna");
    if (ball.pos.x < paddle.position.x || ball.pos.y < paddle.position.y || ball.pos.x > paddle.position.x + 350 || ball.pos.y > paddle.position.y + 250) {
      ball.lose();
      fill(255, 0, 0);
      text("YOU LOST YOU LOSER", width/2 - 250, height/2 - 200);
      println("U lose loser");
    } else {
      ball.bouncePaddle();
      score += 1;
    }
  }
}

void AI() {
  if (ball.zCoord == 0) {
    if (ball.pos.x < ai.position.x || ball.pos.y < ai.position.y || ball.pos.x > ai.position.x + 150 || ball.pos.y > ai.position.y + 112.5) {
      ball.lose();
      text("YOU WON YOU LOSER", width/2 - 250, height/2 - 200);
    } else {
      ball.bouncePaddle();
    }
  }
}