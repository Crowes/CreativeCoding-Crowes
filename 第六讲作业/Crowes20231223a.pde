ArrayList<Star> leaf;

int index;
int xSection=20;
int ySection=20;

float[][] brightnessValue;
PVector[][] vertexValue;
PVector[][] fieldVector;

float xCellSize;
float yCellSize;
float xVar = 0.05;
float yVar = 0.05;
float tVar = 0.005;
float vt;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(200,50,100);
  brightnessValue =new float[xSection][ySection];
  fieldVector=new PVector[xSection][ySection];
  xCellSize=width/xSection;
  yCellSize=height/ySection;
  fallLeaves();
}

void fallLeaves() {
  leaf=new ArrayList<Star>();
}

void mousePressed() {
  Star s=new Star(new PVector(mouseX, mouseY));
  leaf.add(s);
}

void draw() {
  background(200,50,100);
  for (int x=0;x<xSection;x++) {
    for (int y=0;y<ySection;y++) {
      brightnessValue[x][y]=noise(x*xVar,y*yVar,index*tVar)*40+70;
      fill(200,50,brightnessValue[x][y]);
      noStroke();
      rect(x*xCellSize, y*yCellSize, xCellSize, yCellSize);
    }
  }

  fieldVector();
  displayFieldVector();

  for (int i=0; i<leaf.size();i++) {
    leaf.get(i).move();
    leaf.get(i).edge();
    leaf.get(i).display();
  }

  index++;

}

void fieldVector() { 
  for (int x=0;x<xSection;x++){
    for (int y=0;y<ySection;y++){
      float angle=map(brightnessValue[x][y],0,255,0,TWO_PI);
      fieldVector[x][y] = PVector.fromAngle(angle);
    }
  }
}

void displayFieldVector(){
  for (int x=0;x<xSection;x++){
    for (int y=0;y<ySection;y++){
      float cellCenterX=x*xCellSize+xCellSize/2;
      float cellCenterY=y*yCellSize+yCellSize/2;
      float arrowHeadX=cellCenterX+xCellSize/2*cos(fieldVector[x][y].heading());
      float arrowHeadY=cellCenterY+yCellSize/2*sin(fieldVector[x][y].heading());
      float arrowHeadX2=cellCenterX+xCellSize/2*cos(fieldVector[x][y].heading()+PI);
      float arrowHeadY2=cellCenterY+yCellSize/2*sin(fieldVector[x][y].heading()+PI);
      stroke(200,0,brightnessValue[x][y],50);
      strokeWeight(1.5);
      line(cellCenterX,cellCenterY,arrowHeadX,arrowHeadY);
      line(cellCenterX,cellCenterY,arrowHeadX2,arrowHeadY2);
    }
  }
}
