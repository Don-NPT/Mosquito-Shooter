Button btn_play;
TEXTBOX textbox;
boolean send = false;
String msg = "";

void menu() {

  background(title_bg);
  
  fill(0, 200);
  noStroke();
  rectMode(CENTER);
  rect(width/2, height/2, 600, 300);
  
  textAlign(CENTER);
  fill(255);
  textSize(60);
  text("Mosquito Shooter" ,width/2, height/2);
  
  btn_play = new Button(width/2, height/2+80, 150, 60, "Play");

  //Show button
  btn_play.show();
  
  //draw box for input name
  fill(255);
  text("Enter player's name:", width/2, height-55);
  rectMode(CENTER);
  textbox.DRAW();

}
void keyPressed() {
  textbox.KEYPRESSED(key, keyCode);
}
