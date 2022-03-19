// set location of player
int playerX = 384; 
int playerY = 477;

//boolean spawnMosquito;

void level() {
  background(230,230,255);
  
  textAlign(CENTER);
  fill(0, 10);
  textSize(60);
  text("This is level 1" ,width/2, height/2);
  
  //draw wall
  rectMode(CENTER);
  fill(150);
  noStroke();
  rect(width/2, height-35, width, 70);
  
  //aim line
  float angle = atan2(mouseY - playerY, mouseX - playerX);
  float x1 = playerX + 10000 * cos(angle);
  float y1 = playerX + 10000 * sin(angle);
  stroke(255, 0, 0, 100);
  strokeWeight(3);
  line(playerX, playerY, x1, y1);
  
  //draw gun (player)
  rectMode(CENTER);
  fill(0);
  noStroke();
  ellipse(playerX, playerY, 20, 20);
  
  for(Mosquito mosquito: mosquitos){
    mosquito.show();
    mosquito.fly();
  }
  
}
