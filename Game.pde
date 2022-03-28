import processing.sound.*;
String screen;
PImage title_bg;
PImage sky;
PImage sky2;
PImage sky3;
PImage sky4;

int num_mosquito = 15;
int max_mosquito = 15;
int score;
Timer countDownTimer;
int timeLeft;
int maxTime;
Timer timer;

SoundFile s_fire;
SoundFile s_fire2;
SoundFile s_reload;
SoundFile s_explosion;
SoundFile s_menu;
SoundFile s_level;
SoundFile s_end;
SoundFile s_click;

void setup() {
  frameRate(60);
  size(768,512);
  
  title_bg = loadImage("images/title_bg.jpg");
  screen = "menu";
  
  sky = loadImage("images/sky.jpg");
  sky2 = loadImage("images/sky2.jpg");
  sky3 = loadImage("images/sky3.jpg");
  sky4 = loadImage("images/sky4.jpg");
  
  loadsound();
  
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
  
}

void draw() {
  background(0);
  
  switch(screen) {
  case "menu":
  //set initial score
    score = 0;
    menu();
    musicSystem();
    break;
  case "level1":
    musicSystem();
    level();
    break;
  case "end":
    musicSystem();
    leaderscore();
    break;
  }
}

void mousePressed() {
  switch(screen) {
    case "menu":
    //click in textbox
    for (TEXTBOX t : textboxes) {
        t.PRESSED(mouseX, mouseY);
     }
     
      if(btn_play.mouseInside){
        s_click.play();
        screen = "level1";
      } 
      break;
    case "level1":
      //check aim in 180 degree
      if(reload == false){
        if(y1 <= playerY){
          s_fire2.play();
          bullets.add(new Bullet(x1, y1));
          num_round--;
          break;
        }
      }else{
        s_reload.play();
          break;
      }
      case "end":
      if(btn_again.mouseInside){
        s_click.play();
        screen = "menu";
        
      } 
  }
   
}

void reset(){
  //set initial background
  background = 1;
  
  //set loop save score
  temp = 0;
  
  //spawn mosquito
  num_mosquito = 15;
  mosquitos = new ArrayList<Mosquito>();
 
 //setup bullets
 num_round = 15;
 bullets = new ArrayList<Bullet>();
 
 //setup bomb animation
 bombs = new ArrayList<Bomb>();
 
  //set timer
  countDownTimer = new Timer(1000);
  maxTime = 5;
  timeLeft = maxTime;
  
  //reset wave
   waveremaining = 4;
   wave = 0; 
   nextwave = 1;
   spawntime = 200;

}

void loadsound(){
    s_fire = new SoundFile(this, "Sound/GunFire.wav");
    s_fire2 = new SoundFile(this, "Sound/gunfire2.mp3");
    s_reload = new SoundFile(this, "Sound/reload.wav");
    s_explosion = new SoundFile(this, "Sound/explosion.wav");
    s_menu = new SoundFile(this, "Sound/AirRaidSirens.wav");
    s_level = new SoundFile(this, "Sound/Assault.wav");
    s_end = new SoundFile(this, "Sound/end.wav");
    s_click = new SoundFile(this, "Sound/click.wav");
}

void musicSystem() {
  if (!s_menu.isPlaying() && screen == "menu") {
    stopMusics(screen);
    s_menu.play();
  }
  if (!s_level.isPlaying() && screen == "level1") {
    stopMusics(screen);
    s_level.play();
  }
  if (!s_end.isPlaying() && screen == "end") {
    stopMusics(screen);
    s_end.play();
  }
  
}

void stopMusics(String screen) {
  if (s_menu.isPlaying() && screen != "menu")
    s_menu.stop();
  if (s_level.isPlaying() && screen != "level1")
    s_level.stop();
    if (s_end.isPlaying() && screen != "end")
    s_end.stop();
}
