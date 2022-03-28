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
  btn_again = new Button(width/2, height-50, 150, 60, "Play again");
  btn_again.show();
  temp = 1;

}


void drawleaderscore(){
 fill(200);
 textSize(14);
 textAlign(LEFT);
 textLeading(20);
 
 column=0;
 row=1;
 for(int i=0; i< word.length; i++){

   if(i%8==0 && i!=0){
     column++;
     row=1;
   }
      if(column > 2) break;
   text(word[i],column*200+120,150+(row*30));
   row++;
 }
 
}
