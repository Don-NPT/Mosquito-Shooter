JSONObject bomb_spritedata;
PImage bomb_spritesheet;
ArrayList<PImage> bomb_animation;
ArrayList<Bomb> bombs;

public class Bomb {
  float x, y;
  ArrayList<PImage> animation;
  int len;
  float index;
  
  Bomb(float posX, float posY, ArrayList<PImage> bomb_animation) {
    x = posX;
    y = posY;
    animation= bomb_animation;
    len = animation.size();
    index = 0;
  }
  
  void show() {
    int index_ = floor(index) % len;
    imageMode(CENTER);
    image(animation.get(index_),x,y, 150,150);
    //rect(x, y, 30, 30);
  }
  
  void animate(){
    index += 0.5;
  }
 
   void destroy() {
      for (int i = 0; i < bombs.size(); i++) {
        if (bombs.get(i) == this)
          //mosquitos.get(i).y = 1000;
          bombs.remove(i);
      }
    }
  
  
}
