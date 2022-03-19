void menu() {
  background(230,230,255);
  
  textAlign(CENTER);
  fill(0);
  textSize(60);
  text("Mosquito Shooter" ,width/2, height/2);
  
  //rectMode(CENTER);
  //fill(150);
  //rect(width/2, height/2+100, 150, 70);
  Button btn_play = new Button(width/2, height/2+100, 150, 60, "Play");
  
  btn_play.draws();
  
}

void mouseClicked() {
  screen = "level1";
}
