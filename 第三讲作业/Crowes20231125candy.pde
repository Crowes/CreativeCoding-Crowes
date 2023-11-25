float lineSize = 0;
float colSize = 0;
float H, S, B;

void candy() {
  colorMode(HSB);
  H=random(0,255);
  S=random(50,150);
  B=random(230,255);
  for(int line = 0; line <height; line += lineSize + 3) {
    lineSize = random(4, width/3);
    for(int col = 0; col < width; col += colSize + 3) {
      colSize = random(4, height/2); 
      
      int r = int(random(12));
      colorMode(HSB,360,255,255);
      fill((H+30*r)%360,S,B);
      rect(col, line, colSize, lineSize);
      
      strokeWeight(3);
      stroke(#ffffff);
      float x = col+colSize;
      float y = line+lineSize;
      line(0, y, width, y);
      line(x, line, x, y);
    }
  }
}


void setup() {
  size(800,800);
  background(0);
  candy();
}


void draw(){
  if (mousePressed){
    candy();
  }
}
