void UI(){
  cp=new ControlP5(this,createFont("微软雅黑",16));
  cp.setColorCaptionLabel(color(150,150,100));
  
  cp.addSlider("Bradiu",50,500,250,50,50,200,30).setLabel("底部半径");
  cp.addSlider("Mradiu",50,500,90,50,50+30+10,200,30).setLabel("分隔半径");
  cp.addSlider("Tradiu",50,500,250,50,50+60+20,200,30).setLabel("顶部半径");
  cp.addSlider("change",0,layer,6,50,50+90+30,200,30).setLabel("分隔位置");
  cp.addSlider("section",3,20,6,50,50+120+40,200,30).setLabel("截面细分");
  cp.addSlider("cyHigh",0,100,60,50,50+150+50,200,30).setLabel("层间高度");
  cp.addSlider("col",0,360,150,50,50+180+60,200,30).setLabel("颜色");
  cp.addSlider("bottomHigh",0,cyHigh*layer/2,200,50,50+210+70,200,30).setLabel("底部高度");
  cp.addSlider("rotate",0,PI,PI/12,50,50+240+80,200,30).setLabel("旋转角度");
  cp.addToggle("point",false,50,50+270+90,80,30).setLabel("点");
  cp.addToggle("line",true,50+120,50+270+90,80,30).setLabel("线");
    
  cp.setAutoDraw(false);
}
