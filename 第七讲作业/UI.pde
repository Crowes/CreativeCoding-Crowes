void UI(){
  cp=new ControlP5(this,createFont("微软雅黑",16));
  cp.setColorCaptionLabel(color(0,0,0));
  
  cp.addSlider("num",3,12,3,50,50,200,30).setLabel("花瓣数量");
  cp.addSlider("layer",0,19,0,50,50+30+10,200,30).setLabel("花瓣层数");
  cp.addSlider("a",0.4,1,0.8,50,50+60+20,200,30).setLabel("花瓣宽度");
  cp.addSlider("Vrotate",0,180,0,50,50+90+30,200,30).setLabel("花瓣角度");
  cp.addSlider("xx",0,width,width/2,50,50+120+40,200,30).setLabel("花朵左右");
  cp.addSlider("yy",0,height,height/2,50,50+150+50,200,30).setLabel("花朵上下");
  cp.addToggle("stroke",true,50,50+180+60,80,30).setLabel("边缘");
  cp.addToggle("seed",true,50+120,50+180+60,80,30).setLabel("中心");
  cp.setAutoDraw(false);
}
