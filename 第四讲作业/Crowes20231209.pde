
ArrayList<Ball> ballCollection = new ArrayList<Ball>();
PImage img;
int num = 150; 
float radius = 50;
int count = 0;


void setup() {
  size(800, 800);
  background(255);
  img = loadImage("waterlily.jpg");
  imageMode(CENTER);
  img.resize(width,0);
  frameRate(2);
}


void draw() {
  if (count < 15) {
    makeBalls();
    for (Ball draw : ballCollection) {
      draw.show();
    }
    radius *= 0.8;
    num *= 1.2;
    count ++;
  }
  saveFrame();
}


void makeBalls() {
  for (int i=0; i < num; i++) {
    PVector position = new PVector(random(width), random(height)); 
    color col = img.get((int)position.x, (int)position.y);
    if (col != 255) {
      ballCollection.add(new Ball(position, radius, col));
    }
  }
}
