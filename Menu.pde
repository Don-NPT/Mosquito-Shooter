Button btn_play;

void menu() {
  //background(230,230,255);
  background(title_bg);
  
  fill(0, 200);
  rectMode(CENTER);
  rect(width/2, height/2, 600, 300);
  
  textAlign(CENTER);
  fill(255);
  textSize(60);
  text("Mosquito Shooter" ,width/2, height/2);
  
  //rectMode(CENTER);
  //fill(150);
  //rect(width/2, height/2+100, 150, 70);
  btn_play = new Button(width/2, height/2+80, 150, 60, "Play");
  
  btn_play.draws();
  
}

void mouseClicked() {
  if(btn_play.mouseInside){
    screen = "level1";
  }  
  
}
