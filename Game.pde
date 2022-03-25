String screen;
PImage title_bg;
PImage sky;

int num_mosquito;
int max_mosquito = 30;
int score;
Timer countDownTimer;
int timeLeft;
int maxTime;
Timer timer;
int max_round = 15;
int num_round = max_round;

boolean spawn;

void setup() {
  frameRate(60);
  size(768,512);
  
  title_bg = loadImage("images/title_bg.jpg");
  screen = "menu";
  
  sky = loadImage("images/sky.jpg");
  
  //get animation from mosquito spreadsheet
  mosquito_animation = new ArrayList<PImage>();
  mosquito_spritedata = loadJSONObject("images/mosquito.json");
  mosquito_spritesheet = loadImage("images/mosquito2.png");
  JSONArray sheep_frames = mosquito_spritedata.getJSONArray("frames");
  for (int i = 0; i < sheep_frames.size(); i++) {
    JSONObject mosquito_frame = sheep_frames.getJSONObject(i);
    JSONObject pos = mosquito_frame.getJSONObject("position");
    int x = pos.getInt("x");
    int y = pos.getInt("y");
    int w = pos.getInt("w");
    int h = pos.getInt("h");
    PImage mosquito_img = mosquito_spritesheet.get(x, y, w, h);
    mosquito_animation.add(mosquito_img);
  }
  
  //get animation from bomb spreadsheet
  bomb_animation = new ArrayList<PImage>();
  bomb_spritedata = loadJSONObject("images/bomb.json");
  bomb_spritesheet = loadImage("images/bomb.png");
  JSONArray bomb_frames = bomb_spritedata.getJSONArray("frames");
  for (int i = 0; i < bomb_frames.size(); i++) {
    JSONObject bomb_frame = bomb_frames.getJSONObject(i);
    JSONObject pos = bomb_frame.getJSONObject("position");
    int x = pos.getInt("x");
    int y = pos.getInt("y");
    int w = pos.getInt("w");
    int h = pos.getInt("h");
    PImage bomb_img = bomb_spritesheet.get(x, y, w, h);
    bomb_animation.add(bomb_img);
  }
  mosquitos = new ArrayList<Mosquito>();
  bombs = new ArrayList<Bomb>();
  bullets = new ArrayList<Bullet>();
  
  spawn = true;
  //reset();
}

void draw() {
  background(0);
  
  switch(screen) {
  case "menu":
  //set initial score
    score = 0;
    menu();
    break;
  case "level1":
    if(spawn) {
      for(int i=0; i<max_mosquito; i++){
        mosquitos.add(new Mosquito(round(random(20, 748)), round(random(-400, 0)), random(0.5, 1), mosquito_animation));
      }
    }
    spawn = false;
    level();
    break;
  case "end":
    leaderscore();
    break;
  }
}

void mousePressed() {
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

void reset(){
  //set loop save score
  temp = 0;
  //spawn mosquito
  num_mosquito = 8;
  mosquitos = new ArrayList<Mosquito>();
  for(int i=0;i<num_mosquito; i++){
    mosquitos.add(new Mosquito(i*100, round(random(-400, 0)), 1, mosquito_animation));
  }
 
 //setup bullets
 num_round = max_round;
 bullets = new ArrayList<Bullet>();
 
  //set timer
  countDownTimer = new Timer(1000);
  maxTime = 5;
  timeLeft = maxTime;

}

//void mouseClicked() {
//  bullets = new ArrayList<Bullet>();
//  bullets.add(new Bullet(x1, y1));
//}
