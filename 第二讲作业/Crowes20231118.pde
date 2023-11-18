Rect[] cls;
int num = 100;

void initiate() {
  cls = new Rect[num];

  for (int idx = 0; idx < cls.length; idx ++) {
    float xx = random(width);
    float yy = random(height);
    float aa = random(10, 200);
    float bb = random(10, 200);
    cls[idx] = new Rect(xx, yy, aa, bb);
  }
}

void setup() {
  size(900, 900);
  background(255);
  initiate();
}

void draw() {
  for (int idx = 0; idx < cls.length; idx ++) {
    cls[idx].move();
    cls[idx].edge();
    cls[idx].show();
  }

}

void keyPressed() {
  if (key == 'r') {
    initiate();
  }
  if (key == 'p') {
    delay(10000);
  }
}
