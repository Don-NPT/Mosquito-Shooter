BufferedReader reader;
String line;
String[] word;
int index = 0;
String input;
String namescore;
PrintWriter output;
int count=0;
int temp = 0;
boolean writeFile = false;

void leaderscore() {
  size(768,512);
  background(230,230,255);
  //background(title_bg);
  
  //while lopp for read txt and save txt
  if(writeFile == true){
    String namescore = " Dragon"+score;
    String[] lines = loadStrings("score.txt");
    String entireplay = join(lines, ' ');
    entireplay = entireplay+namescore;
    word = split(entireplay, ' ');
    count++;
    print(count+" ");
    
    saveStrings("score.txt",word);
    writeFile = false;
  }
  drawe();


  //temp = 1;
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
