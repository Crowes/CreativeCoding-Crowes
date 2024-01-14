void UI(){
  cp=new ControlP5(this,createFont("微软雅黑",16));
  cp.setColorCaptionLabel(color(0,0,0));
  cp.addSlider("num",3,12,3,50,50,200,30).setLabel("花瓣数量");
  cp.addSlider("layer",0,19,0,50,50+30+10,200,30).setLabel("花瓣层数");
  cp.addSlider("a",0.4,1,0.8,50,50+60+20,200,30).setLabel("花瓣宽度");
  cp.addSlider("Vrotate",0,180,0,50,50+90+30,200,30).setLabel("花瓣角度");
  cp.addSlider("xx",400,width,(width+400)/2,50,50+120+40,200,30).setLabel("花朵左右");
  cp.addSlider("yy",0,height,height/2,50,50+150+50,200,30).setLabel("花朵上下");
  cp.addSlider("col",0,360,200,50,50+180+60,200,30).setLabel("背景颜色");
  cp.addSlider("bx",400,width,(width+400)/2,50,50+210+70,200,30).setLabel("文字左右");
  cp.addSlider("by",0,height,height*0.75,50,50+240+80,200,30).setLabel("文字上下");
  cp.addSlider("ts",20,200,20,50,50+270+90,200,30).setLabel("文字大小");
  cp.addSlider("tc",0,360,20,50,50+300+100,200,30).setLabel("文字颜色");
  cp.addTextfield("blessing",50,50+330+110,200,30).setLabel("输入文字");
  cp.addToggle("stroke",false,50,50+360+120+20,80,30).setLabel("边缘");
  cp.addToggle("seed",false,50+120,50+360+120+20,80,30).setLabel("中心");
  cp.setAutoDraw(false);
}
