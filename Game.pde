String screen;

void setup() {
  frameRate(60);
  size(768,512);
  
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
