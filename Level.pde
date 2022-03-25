
// set location of player
int playerX = 384; 
int playerY = 477;

float x1;
float y1;

void level() {
  background(sky);
  
  //enemy = 0, end game
  if(mosquitos.size() == 0){
    end();
  }
  
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
  if(reload) stroke(255, 0, 0, 20);
  else stroke(255, 0, 0, 100);
  strokeWeight(3);
  line(playerX, playerY, x1, y1);

  //draw gun (player)
  rectMode(CENTER);
  fill(0);
  noStroke();
  ellipse(playerX, playerY, 20, 20);
  
  //show mosquito
  for(int i=0; i< mosquitos.size(); i++){
    mosquitos.get(i).show();
    mosquitos.get(i).fly();
  }
  
  //show bullet
  for(int i=0; i< bullets.size(); i++){
    bullets.get(i).show();
    bullets.get(i).fire();
    
    //check bullet collision
    if(bullets.get(i).checkCollision()){
      bullets.get(i).destroy();
    }
    
    //destroy bullet out of screen
    else if(bullets.get(i).x >= 768 || bullets.get(i).x <= 0 || bullets.get(i).y >= 512 || bullets.get(i).y <= 0){
      bullets.get(i).destroy();
    }
    
  }
  
  //check reload
  if(num_round <= 0){
    bullet_timer--;
    reload = true;
  }
  
  //set reload timer
  if(bullet_timer <= 0){
    bullet_timer= 70;
    num_round = 15;
    reload = false;
  }
  
  //show bombs
  for(int i=0; i< bombs.size(); i++){
    bombs.get(i).show();
    if(bombs.get(i).index < 20) bombs.get(i).animate();
    else bombs.get(i).destroy();
  }
  
  //show score
  textAlign(LEFT);
  textSize(24);
  text("Score: " + score, 20, 30);
  
  //Show Ammo
  textAlign(LEFT);
  text("Bullet left : " + num_round, 180, 30);
  
  //show mosquitos number
  text("Mosquito remaining: "+mosquitos.size(), width-250, 30);
  
}

//end screen
void end(){
   reset();
   screen = "end";
   draw();
 }
 
