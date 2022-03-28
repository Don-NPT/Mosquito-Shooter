BufferedReader reader;
String line;
String[] word;
String[] save;
int index = 0;
String input;
String namescore;
PrintWriter output;
int temp = 0;
Button btn_restart;

ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
boolean send = false;
String msg = "";

Button btn_again;


void leaderscore() {
  size(768,512);
  background(230,230,255);
  
  fill(0);
  rect(width/2, height/2, 500, 500);
  
  textSize(32);
  //show your score
  fill(255);
  text("Your name: " + textboxes.get(0).Text + "    Kill Count: "+ score , width/2, 70);
  
  //show record
  fill(200);
  text("Kill Record" , width/2, 140);
  
  //while lopp for read txt and save txt 
  while(temp == 0){
    namescore = "Name: "+textboxes.get(0).Text+"    KillCount: "+score+"&";
    String[] lines = loadStrings("score.txt");
    String entireplay = join(lines, ' ');
    entireplay = entireplay+namescore;
    word = split(entireplay, '&');
    save = split(entireplay, '@');
    saveStrings("score.txt",save);
    break;
  }
  
  drawleaderscore();
  btn_again = new Button(width/2, height/2+80, 150, 60, "Play again");
  btn_again.show();
  temp = 1;
  
  btn_restart = new Button(width/2, height-60, 150, 60, "Restart");
  btn_restart.show();

}


void drawleaderscore(){
 fill(200);
 textSize(12);
 textAlign(CENTER);
 textLeading(20);
 for(int i=0; i< word.length; i++){
   text(word[i],width/2,200+(i*60));
 
 }
}

boolean checkfile(){
   File f = new File ("score.txt");
   if(f.exists()){
    return true;
   }else{
   return false;
   }
  
}

//layout input name
void InitLayout() {
   TEXTBOX receiver = new TEXTBOX();
   receiver.W = 100;
   receiver.H = 20;
   receiver.X = (width - receiver.W) / 2;
   receiver.Y = 50;
   textboxes.add(receiver);
}

void drawTEXTBOX() {
   
   for (TEXTBOX t : textboxes) {
      t.DRAW();
   }
   
   if (send) {
      text(msg, (width - textWidth(msg)) / 2-200, 260);
   }
}



void keyPressed() {
   for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, keyCode)) {
         send = true;
      }
   }
}
