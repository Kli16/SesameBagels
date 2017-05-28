class Player {
  int _Health;
  int _Progress;
  boolean _status; //true: Alive, false: Dead
  boolean _option; //true: binary movement false: image detected movement
  Ball _character;
  int size, total, avgX, avgY;
  float sumX, sumY;
  color trackc;
  PImage _picture;
  
  Player(){
    _Health = 100;
    _Progress = 0;
    _status = true;
    _character = new Ball(0,0);
    trackc = color(70,150,150);
    _picture = loadImage("Player.png");
    _picture.resize(0,100);
  }
  
  void move(PImage original, PImage updated) {
    //if (r>60 && r <140 && g > 140 && g < 160 && b > 140 && b < 160)
    sumX = 0;
    sumY = 0;
    total = 0;
    //ellipse(_character.x, _character.y, _character.rad*2, _character.rad*2);
    image(_picture, _character.x, _character.y);
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
        } 
        else {
          updated.set(width-i, j, color(r1, g1, b1));
        }
      }
    }
    avgX = (int)(sumX / total);
    avgY = (int)(sumY / total);
    _character.x = width - avgX;
    _character.y = 580;
  }
}