Button btn_play;

void menu() {

  background(title_bg);
  
  fill(0, 200);
  rectMode(CENTER);
  rect(width/2, height/2, 600, 300);
  
  textAlign(CENTER);
  fill(255);
  textSize(60);
  text("Mosquito Shooter" ,width/2, height/2);
  
  btn_play = new Button(width/2, height/2+80, 150, 60, "Play");
  //draw box for input name
  drawTEXTBOX();
  InitLayout();
  //Show button
  btn_play.show();
  
}
