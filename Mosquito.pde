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
  
  void destroy() {
    for (int i = 0; i < mosquitos.size(); i++) {
      if (mosquitos.get(i) == this)
        mosquitos.get(i).y = 1000;
    }
  }
  
}
