ArrayList<Bullet> bullets;

public class Bullet {
  
  float x, y;
  float targetX, targetY;
  Bullet(float targetX_, float targetY_) {
    x = playerX;
    y = playerY;
    targetX = targetX_;
    targetY = targetY_;
  }
  
  void show() {
    ellipse(x, y, 7, 7);
  }
  
  void fire() {
    float speed = 2;    
    PVector dir = new PVector(targetX - x, targetY - y);
    if(num_round > 0){
      if (dir.mag() > 0) {
        dir.normalize();
        dir.mult(min(speed, dir.mag()));
        
        x += dir.x * 12;
        y += dir.y * 12;
    }
  }else{
    delay(1500);
    num_round = max_round;
  }
  }
  
  boolean checkCollision() {
    for(Mosquito mosquito: mosquitos){
      if(x >= mosquito.x-25 && x <= mosquito.x+25 && y >= mosquito.y-25 && y <= mosquito.y+25) {
        bombs.add(new Bomb(mosquito.x, mosquito.y, bomb_animation));
        mosquito.destroy();
        score += 10;
        return true;
      }
    }
    return false;
  }
  
  void destroy() {
    for (int i = 0; i < bullets.size(); i++) {
      if (bullets.get(i) == this)
        //bullets.get(i).y = -100;
        bullets.remove(i);
    }
  }
  
}
