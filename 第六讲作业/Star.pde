class Star{
  PVector pos;
  color starColor;
  float dia = 20;
  
  Star(PVector p){
    pos = p;
    starColor = color(random(0,80),noise(pos.y,pos.x)*255,noise(pos.x,pos.y)*255);
  }
  
  void display(){
    noStroke();
    fill(starColor);
    float v=2.5;

    beginShape();
    vertex(pos.x, pos.y);
    vertex(pos.x+2*v,pos.y+8*v);
    vertex(pos.x+10*v,pos.y+8*v);
    vertex(pos.x+4*v,pos.y+12*v);
    vertex(pos.x+7*v,pos.y+20*v);
    vertex(pos.x,pos.y+15*v);
    vertex(pos.x-7*v,pos.y+20*v);
    vertex(pos.x-4*v,pos.y+12*v);
    vertex(pos.x-10*v,pos.y+8*v);
    vertex(pos.x-2*v,pos.y+8*v);
    endShape(CLOSE);
  }
  
  void move(){
    int xLoc=floor(pos.x/xSection);
    int yLoc=floor(pos.y/ySection);    
    xLoc=constrain(xLoc,0,xSection-1);
    yLoc=constrain(yLoc,0,ySection-1);    
    PVector dir=fieldVector[xLoc][yLoc];
    pos.add(dir);
  }
  
  void edge(){
    if(pos.x-dia/2<0){
      pos.x=width-dia/2;
    }
    if(pos.x+dia/2>width){
      pos.x=dia/2;
    }
    if(pos.y-dia/2<0){
      pos.y=height-dia/2;
    }
    if(pos.y+dia/2>height){
      pos.y=dia/2;
    }
  }
  
}
