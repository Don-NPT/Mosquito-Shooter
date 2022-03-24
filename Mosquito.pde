JSONObject mosquito_spritedata;
PImage mosquito_spritesheet;
ArrayList<PImage> mosquito_animation;

public class Mosquito {
  float x, y, speed;
  PImage mosquitoImg;
  ArrayList<PImage> animation;
  int len;
  float index;
  
  Mosquito(float posX, float posY, float s, ArrayList<PImage> mosquito_animation) {
    x = posX;
    y = posY;
    speed = s;
    mosquitoImg = loadImage("images/mosquito.png"); 
    animation= mosquito_animation;
    len = animation.size();
  }
  
  void show() {
    int index_ = floor(index) % len;
    imageMode(CENTER);
    image(animation.get(index_),x,y);
    //rect(x, y, 30, 30);
  }
  
  void fly() {
    //animate
    //if(index > 1) index = 0;
    index += speed/5;
    
     //Check mosquito touch the wall
    if(y == height-35){
     writeFile = true;
     end();
    }else if(screen == "level1"){
      y+=speed;
    }
  }
  
  void destroy() {
    for (int i = 0; i < mosquitos.size(); i++) {
      if (mosquitos.get(i) == this)
        mosquitos.get(i).y = 1000;
    }
  }
  
}
