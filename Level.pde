// set location of player
int playerX = 384; 
int playerY = 477;

float x1;
float y1;

void level() {
  background(sky);
  
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
  //noCursor();
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
  
  
  //show score
  textAlign(LEFT);
  textSize(24);
  text("Score: " + score, 20, 30);
  
  //Show Ammo
  textAlign(LEFT);
  text("Bullet left : " + num_round, 180, 30);
  
  //show mosquito
  for(Mosquito mosquito: mosquitos){
    mosquito.show();
    mosquito.fly();
  }
  
  //show bullet
  for(Bullet bullet: bullets){
    bullet.show();
    bullet.fire();
    
    //check bullet collision
    if(bullet.checkCollision()){
      bullet.destroy();
    }
  }
  
  //spawn mosquitos
  if(mosquitos.size() <= max_mosquito){
    mosquitos.add(new Mosquito(round(random(20, 748)), round(random(-700, 0)), random(0.5, 0), mosquito_animation));
  }
  
  //show bombs
  for(Bomb bomb: bombs){
    bomb.show();
    if(bomb.index < 20) bomb.animate();
  }
  
}

//end screen
void end(){
   reset();
   screen = "end";
   draw();
 }
 
