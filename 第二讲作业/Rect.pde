class Rect{
  float rX, rY, ra, rb;
  float speedX, speedY, speedR;
  float rotateR;
  color fC;
  int y=year(), mo=month(), d=day(), h=hour(), m= minute(), s=second();
  float Y, MO, D, H, M, S;
  

  Rect(float x, float y, float a, float b){
    rX = x;
    rY = y;
    ra = a;
    rb = b;
    speedX = random(3);
    speedY = random(3);
    rotateR = random(-3,3);
    speedR = random(-0.0008,0.0008);
    Y = map(y,0,60,0,255);
    MO = map(mo,0,12,0,255);
    D = map(d,0,31,0,255);
    H = map(h,0,12,0,255);
    M = map(m,0,60,0,255);
    S = map(s,0,60,0,255);
    fC = color(random(0,Y), random(0,M), random(0,S));
  }
  

  void show(){
    fill(fC);
    stroke(Y, MO, D);
    rect(rX, rY, ra, rb);
    rotate(rotateR);
  }
  
  void move(){
    rX += speedX;
    rY += speedY;
    rotateR += speedR;
  }
  
  void edge(){
    if(rX-ra/2>width) rX=-ra/2;
    if(rX<-ra/2) rX=width+ra/2;
    if(rY-rb/2>height) rY=-rb/2;
    if(rY<-rb/2) rY=height+rb/2;
  }


}
