class DashedLine {
  float xStart;
  float yStart;

  public DashedLine(int xStart, int yStart, float dx, float dy) {
    this.xStart = xStart;
    this.yStart = yStart;
  }

  void DrawDash(float x, float y, float dx, float dy) {
    line(xStart, yStart, x + dx, y + dy); 
    xStart += dx * 2; 
    yStart += dy * 2;
  }
}