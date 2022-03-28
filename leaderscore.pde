BufferedReader reader;
int row, column;
String[] word;
String[] save;
int index = 0;
String input;
String namescore;
PrintWriter output;
int temp = 0;

Button btn_again;

void leaderscore() {
  size(768,512);
  background(0);
  
  textSize(32);
  //show your score
  fill(255);
  text("Your name: " + textbox.Text + "    Kill Count: "+ score , width/2, 70);
  
  //show record
  fill(200);
  text("Kill Record" , width/2, 140);
  
  //while lopp for read txt and save txt 
  while(temp == 0){
    namescore = "Name: "+textbox.Text+"    KillCount: "+score+"&";
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

}


void drawleaderscore(){
 fill(200);
 textSize(14);
 textAlign(CENTER);
 textLeading(20);
 
 column=1;
 row=1;
 for(int i=0; i< word.length; i++){
   if(i==10){
     column++;
     row=1;
   }
   text(word[i],column*200,200+(row*30));
   row++;
 }
 
}
