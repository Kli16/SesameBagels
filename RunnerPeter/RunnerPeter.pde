import processing.video.*;

Capture cam;

PImage original, updated;
int red, green, blue, z;
float dx, dy, dz;
DashedLine right, left;
Player _player;
Octos Cat;
Octos Pusheen;
Octos Spider;
Octos Adventure;
Octos Minion;
ArrayList<Octos> _octos;
int _score;
ArrayList<Boolean> _scores;
boolean a = true;
boolean b = true;

void setup() {
  size(1280, 720);
  background(255);
  dy = 1;
  dx = 1;
  dz = 5;
  z = 1;
  _player = new Player();
  String[] cameras = Capture.list();
  Cat = new Octos("Octocat.png", width/2 - 50, height/3 - 100);
  Pusheen = new Octos("Octopusheen.png", width/2 - 50, height/3 - 100);
  Spider = new Octos("Octospider.png", width/2 - 50, height/3 - 100);
  Adventure = new Octos("Octoadventure.png", width/2 - 50, height/3 - 100);
  Minion = new Octos("Octominion.png", width/2 - 50, height/3 - 100);
  _octos = new ArrayList<Octos>();
  _octos.add(Cat);
  _octos.add(Pusheen);
  _octos.add(Spider);
  _octos.add(Adventure);
  _octos.add(Minion);
  _score = 0;
  _scores = new ArrayList<Boolean>();
  _scores.add(true);
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
  background(230);
  PFont font = loadFont("Avenir-Medium-100.vlw");
  textSize(100);
  textFont(font);
  fill(255, 77, 77);
  text("PETERRUNNER", 310, 100); 
  font = loadFont("Avenir-Light-24.vlw");
  textSize(24);  
  fill(255, 153, 153);
  text("Kevin Li and Peter Lee", 525, 135); 
  textSize(24);
  text("Stuyhacks May 2017", 530, 165); 
  font = loadFont("Avenir-Light-80.vlw");
  textSize(40);
  fill(255, 77, 77);

  text("SCORE", 140, 200 ); 
  fill(92, 214, 92);
  textSize(80);
  text(_score, 140, 270 ); 

  left = new DashedLine(width/2 + 50, height/3, dx, dy);
  right = new DashedLine(width/2 - 50, height/3, dx * -1, dy);
  if (cam.available() == true) {
    cam.read();
  }
  original = cam ;
  updated = new PImage (original.width, original.height);
  //color_replace() ;
  //image(updated, 0, 0) 
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  for (int i = 0; i < 40; i++) {
    dy += dz;
    dx += dz;
    right.DrawDash(right.xStart, right.yStart, dx * -1, dy);
    left.DrawDash(left.xStart, left.yStart, dx, dy);
  }
  dx = 10;
  dy = 10;
  Pusheen.MoveCharacter();
  Cat.MoveCharacter();
  Spider.MoveCharacter();
  Adventure.MoveCharacter();
  Minion.MoveCharacter();
  _player.move(original, updated);
  for (Octos i : _octos) {
    if ((abs((i.x + i.temp.width/2) - _player._character.x) < 15) && (i.y > 375)) {
      i._status = false;
      a = false;
      if (!a == b) {
        _score++;
      }
      b = false;
    }
  }
}

//if (dx == 1 && dy ==1) {
//  left = new DashedLine(width/2 + 50, height/3, dx, dy);
//  right = new DashedLine(width/2 - 50, height/3, dx * -1, dy);
//}

//
//float x1 = width/2 - 50;
//float x2 = width/2 + 50;
//line(0, 720, x1, height/3);
//line(1280, 720, x2, height/3);
//float slope1 = (height/3 - 720) / (((x2 - x1)/3) - 1280/3);
//float slope2 = (height/3 - 720)/ ((x1 + (x2 - x1)/3 * 2) - 1280/3 * 2);

//line(1280/3, 720, x1 + (x2 - x1)/3, height/3);
//line(1280/3 * 2, 720, x1 + (x2 - x1)/3 * 2, height/3);