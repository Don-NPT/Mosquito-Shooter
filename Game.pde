String screen;
PImage title_bg;
ArrayList<Mosquito> mosquitos;
ArrayList<Bullet> bullets;
int num_mosquito;
int score;
Timer countDownTimer;
int timeLeft;
int maxTime;
Timer timer;
int max_round = 15;
int num_round = max_round;

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
 
 //setup bullets
 bullets = new ArrayList<Bullet>();
 
 //set initial score
 score = 0;
 
  //set timer
  countDownTimer = new Timer(1000);
  maxTime = 5;
  timeLeft = maxTime;
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

void mouseClicked() {
  switch(screen) {
  case "menu":
    if(btn_play.mouseInside){
      screen = "level1";
    } 
    break;
  case "level1":
  //check aim in 180 degree
  if(y1 <= playerY){
    bullets.add(new Bullet(x1, y1));
    num_round--;
    break;
  }
  }
   
}

//void mouseClicked() {
//  bullets = new ArrayList<Bullet>();
//  bullets.add(new Bullet(x1, y1));
//}
