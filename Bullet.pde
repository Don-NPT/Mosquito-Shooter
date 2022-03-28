ArrayList<Bullet> bullets;
int bullet_timer = 70;
boolean reload = false;
int num_round = 15;

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

    if (dir.mag() > 0) {
      dir.normalize();
      dir.mult(min(speed, dir.mag()));
      
      x += dir.x * 12;
      y += dir.y * 12;
    }

  }
  
  boolean checkCollision() {
    for(Mosquito mosquito: mosquitos){
      if(x >= mosquito.x-25 && x <= mosquito.x+25 && y >= mosquito.y-25 && y <= mosquito.y+25) {
        bombs.add(new Bomb(mosquito.x, mosquito.y, bomb_animation));
        s_explosion.play();
        mosquito.destroy();
        score ++;
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
