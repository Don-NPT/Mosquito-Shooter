public class Mosquito {
  float x, y;
  
  Mosquito(float posX, float posY) {
    x = posX;
    y = posY;
  }
  
  void show() {
    ellipse(x, y, 20, 20);
  }
  
  void fly() {
    y += 1;
  }
  
  //void destroy() {
  //  for (int i = 0; i < level.enemies.size(); i++) {
  //    if (level.enemies.get(i) == this)
  //      level.enemies.remove(i);
  //  }
  //}
  
}
