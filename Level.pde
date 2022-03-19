// set location of player
int playerX = 384; 
int playerY = 477;

float x1;
float y1;

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
  x1 = playerX + 800 * cos(angle);
  y1 = playerX + 600 * sin(angle);
  stroke(255, 0, 0, 100);
  strokeWeight(3);
  line(playerX, playerY, x1, y1);

  //draw gun (player)
  rectMode(CENTER);
  fill(0);
  noStroke();
  ellipse(playerX, playerY, 20, 20);
  
  //show mosquito
  for(Mosquito mosquito: mosquitos){
    mosquito.show();
    mosquito.fly();
  }
  
  //show bullet
  for(Bullet bullet: bullets){
    bullet.show();
    bullet.fire();
  }
  
  //check bullet collision
  
  
}
