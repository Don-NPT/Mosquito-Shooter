String screen;
PImage title_bg;
ArrayList<Mosquito> mosquitos;
int num_mosquito;

void setup() {
  frameRate(60);
  size(768,512);
  
  title_bg = loadImage("images/title_bg.jpg");
  screen = "menu";
  
  //spawn mosquito
  num_mosquito = 8;
  mosquitos = new ArrayList<Mosquito>();
  for(int i=0;i<num_mosquito; i++){
    mosquitos.add(new Mosquito(i*100, round(random(-400, 0))));
  }
 
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
