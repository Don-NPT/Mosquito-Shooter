public class Mosquito {
  float x, y;
  PImage mosquitoImg;
  Mosquito(float posX, float posY) {
    x = posX;
    y = posY;
    mosquitoImg = loadImage("images/mosquito.png"); 
  }
  
  void show() {
    image(mosquitoImg,x,y);
    //ellipse(x, y, 20, 20);
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
