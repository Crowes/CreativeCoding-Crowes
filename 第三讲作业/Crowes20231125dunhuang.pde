float lineSize = 0;
float colSize = 0;
color[] colors = {#648473, #426E8A, #421A18, #A23D30, #A6866E, #C5BBB7};


void dunhuang() {
  for(int line = 0; line <height; line += lineSize + 3) {
    lineSize = random(4, width/3);
    for(int col = 0; col < width; col += colSize + 3) {
      colSize = random(4, height/2); 
      
      color rectColor = colors[int(random(colors.length))];
      fill(rectColor);
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
  dunhuang();
}


void draw(){
  if (mousePressed){
    dunhuang();
  }
}
