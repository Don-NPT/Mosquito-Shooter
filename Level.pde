
// set location of player
int playerX = 384; 
int playerY = 477;

float x1;
float y1;

int waveremaining = 4;
int wave = 1;

void level() {
  background(sky);
  
  //enemy = 0, waveremaining more than 0 spawn it!!!
  if(mosquitos.size() == 0 && waveremaining > 0 ){
    for(int i=0; i<max_mosquito; i++){
        mosquitos.add(new Mosquito(round(random(20, 748)), round(random(-400, 0)), random(0.5, 1), mosquito_animation));
      }
    waveremaining-=1;
    wave +=1;
  }
  
  //enemy = 0, end game
  if(mosquitos.size() == 0 && waveremaining == 0){
    end();
  }
  
  //show current wave
  textAlign(CENTER);
  fill(0, 10);
  textSize(60);
  text("Wave : "+wave ,width/2, height/2);
  
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
  text("Kill : " + score, 20, 30);
  
  //Show Ammo
  textAlign(LEFT);
  text("Bullet left : " + num_round, 180, 30);
  
  //draw ammo indicator
  for(int i=0; i<num_round; i++){
    rect(500+i*15, 477, 10, 30 );
  }
  
  //show mosquitos number
  text("Mosquito remaining: "+mosquitos.size(), width-250, 30);
  
  //Show wave remaining
  text("Wave remaining: "+waveremaining, width-250, 60);
}

//end screen
void end(){
   reset();
   screen = "end";
   draw();
 }
 
