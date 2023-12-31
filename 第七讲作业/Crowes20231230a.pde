import controlP5.*;
ControlP5 cp;

int num=3;
int angle;
int layer=0;
float a=0.8;
float rotate=0;
float Vrotate=0;
float locationy;
float hue=180;
int vcol=0;
float xx=400;
float yy=400;
float aplha=255;
boolean stroke=true;
boolean seed=true;

void setup() {
  size(800,800);
  colorMode(HSB,360,100,100);
  background(0,0,100);
  UI();
}

void draw() {
  fill(0,0,100,50);  
  rect(0,0,width,height);
  angle=360/num;
  pushMatrix();
  translate(xx,yy);
  if(seed==true){
    fill(0,0,0);
    ellipse(0,0,50,50);
  }
  blossom(layer);
  popMatrix();
  cp.draw();
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
    fill(hue+5*(vcol%20),80,80,aplha-5*(vcol%20));
    ellipse(x,y,h,w);
    popMatrix();
  } 
}
