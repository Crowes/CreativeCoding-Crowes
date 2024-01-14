import controlP5.*;
ControlP5 cp;

int num=3;
int angle;
int layer=0;
float a=0.8;
float rotate=0;
float Vrotate=0;
float locationy;
float hue;
int vcol=0;
float xx=700;
float yy=400;
float aplha=255;
boolean stroke=false;
boolean seed=false;
boolean save=false;

int xSection=50;
int ySection=50;
float[][] brightnessValue;
float xVar=0.05;
float yVar=0.05;
float tVar=0.005;
int index;
float xCellSize;
int col=200;

float yCellSize;
String blessing="";
float bx=700;
float by=600;
float ts=20;
float tc=20;

void setup() {
  size(1000,800);
  fill(0);
  rect(0,0,300,height);
  colorMode(HSB,360,100,100);
  background(0,0,100);
  UI();
  brightnessValue =new float[xSection][ySection];
  xCellSize=width/xSection;
  yCellSize=height/ySection;
  hue=random(360);
}

void draw() {
  
  fill(0,0,100,50);  
  rect(0,0,width,height);
  angle=360/num;
  canvas();
  cp.draw();
 
  pushMatrix();
  translate(xx,yy);
  if(seed==true){
    fill(0,0,0);
    ellipse(0,0,50,50);
  }
  blossom(layer);
  popMatrix();
  
  fill(0,0,100);
  rect(0,0,400,height);
  fill(tc,40,40);
  textSize(ts);
  text(cp.get(Textfield.class,"blessing").getText(),bx,by);
  cp.draw();
  
  if(keyCode==TAB){
    saveFrame("####.png");
    noLoop();
  }
  
}  

void blossom(int l){
  rotate=0;
  vcol=0;
  for(int i=l;i>0;i--){
    locationy=20*pow(1.2,i);
    drawPetal(0,locationy);
    rotate+=Vrotate;
    vcol+=1;   
  }
}

void drawPetal(float x,float y){
  if(stroke==true){
    stroke(0,0,100);
    strokeWeight(2);
  }else{
    noStroke();
  }
  
  float w=2*y*PI/num;
  float h=a*w;
  for (int i=0;i<num;i++){
    pushMatrix();
    rotate(radians(angle*i+rotate));
    fill(hue+5*(vcol%20),40,80,aplha-5*(vcol%20));
    ellipse(x,y,h,w);
    popMatrix();
  } 
}

void canvas(){
  for (int x=0;x<xSection;x++) {
      for (int y=0;y<ySection;y++) {
        brightnessValue[x][y]=noise(x*xVar,y*yVar,index*tVar)*15+80;
        fill(col,10,brightnessValue[x][y]);
        noStroke();
        rect(x*xCellSize, y*yCellSize, xCellSize, yCellSize);
      }
  }
}
