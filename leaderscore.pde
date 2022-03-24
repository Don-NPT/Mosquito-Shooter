BufferedReader reader;
String line;
String[] word;
String[] save;
int index = 0;
String input;
String namescore;
PrintWriter output;
int count=0;
int temp = 0;

void leaderscore() {
  size(768,512);
  background(230,230,255);
  //background(title_bg);
  
  //while lopp for read txt and save txt
  while(temp == 0){
  String namescore = "Dragon"+score+" ";
  String[] lines = loadStrings("score.txt");
  String entireplay = join(lines, ' ');
  entireplay = entireplay+namescore;
  word = split(entireplay, ' ');
  save = split(entireplay, '@');
  count++;
  print(count+"leaderscore ");
  saveStrings("score.txt",save);
  break;
}
  drawe();
  temp = 1;
}


void drawe(){
 fill(255);
 textSize(32);
 textAlign(CENTER);
 textLeading(40);
 for(int i=0; i< word.length; i++){
   text(word[i],width/2,height/2+(i*60)-200);
 
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
