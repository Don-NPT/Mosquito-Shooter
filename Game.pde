String screen;
PImage title_bg;

void setup() {
  frameRate(60);
  size(768,512);
  
  title_bg = loadImage("images/title_bg.jpg");
  screen = "menu";
}

void draw() {
  background(0);
  
  switch(screen) {
  case "menu":
    menu();
    break;
  case "level1":
    level();
    break;
  }
}
