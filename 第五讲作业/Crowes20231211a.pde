import peasy.*;
PeasyCam cam;
import controlP5.*;
ControlP5 cp;

float dia=50;
float sw=1;
int section=6;
PVector[][] vp;
int layer=20;
float Bradiu=250;
float Mradiu=90;
float Tradiu=250;
float cyHigh=60;
int col=150;
float bottomHigh=200;
float rotate=PI/12;
int change=6;
boolean point=false;
boolean line=true;

void setup(){
  size(800,800,P3D);
  background(255);
  lights();
  colorMode(HSB);
  cam=new PeasyCam(this,400);
  UI();
}

void draw(){
  background(255);

  buildCylinder();
  displayCylinder();
  
  cam.beginHUD();
  cp.draw();
  cam.endHUD();
  
  if(mouseX<300 && mouseY<500){
    cam.setActive(false);
  }else{
    cam.setActive(true);
  }
}

void buildCylinder(){
  float angle=TWO_PI/section;
  vp=new PVector[layer][section];
  
  for(int i=0;i<change;i++){
    for(int j=0;j<section;j++){
      float vtxRadiu=map(i,0,change,Bradiu,Mradiu);
      vp[i][j]=new PVector(vtxRadiu*cos(angle*j+rotate*i),vtxRadiu*sin(angle*j+rotate*i),cyHigh*i);
    }
  }
  for(int i=change;i<layer;i++){
    for(int j=0;j<section;j++){
      float vtxRadiu=map(i,change,layer,Mradiu,Tradiu);
      vp[i][j]=new PVector(vtxRadiu*cos(angle*j+rotate*i),vtxRadiu*sin(angle*j+rotate*i),cyHigh*i);
    }
  }
}

void displayCylinder(){
  
  float c=255/vp.length;
  
  strokeWeight(2);
  stroke(col,150,100);
  fill(0);
  beginShape(TRIANGLE_FAN);
  vertex(0,0,bottomHigh);
  for(int j=0;j<vp[0].length+1;j++){
    vertex(vp[0][j%vp[0].length].x,vp[0][j%vp[0].length].y,0);
  }
  endShape();
  
  for(int i=0;i<layer-1;i++){
    fill(col,150,i*c);
    
    if(line==true){
        strokeWeight(2);
        stroke(col,50,i*c);
      }else{
        noStroke();
      }
    
    for(int j=0;j<section;j++){
      beginShape(TRIANGLES);
      vertex(vp[i][j].x,
             vp[i][j].y,
             vp[i][j].z);
      vertex(vp[i+1][j].x,
             vp[i+1][j].y,
             vp[i+1][j].z);
      vertex(vp[i][(j+1)%vp[0].length].x,
             vp[i][(j+1)%vp[0].length].y,
             vp[i][(j+1)%vp[0].length].z);
      
      vertex(vp[i][(j+1)%vp[0].length].x,
             vp[i][(j+1)%vp[0].length].y,
             vp[i][(j+1)%vp[0].length].z);
      vertex(vp[i+1][j].x,
             vp[i+1][j].y,
             vp[i+1][j].z);
      vertex(vp[i+1][(j+1)%vp[0].length].x,
             vp[i+1][(j+1)%vp[0].length].y,
             vp[i+1][(j+1)%vp[0].length].z);
      endShape();
    }
  }
  
  for(int i=0;i<vp.length;i++){
    for(int j=0;j<vp[0].length;j++){
      if(point==true){
        strokeWeight(20);
        stroke(col,150,i*c+10);
      }else{
        noStroke();
      }
      point(vp[i][j].x,vp[i][j].y,vp[i][j].z);
    }
  }
}
