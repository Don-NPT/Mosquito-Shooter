public class Button {
  float x, y;
  int w, h;
  String text;
  boolean mouseInside;
  
  PImage buttonImg, buttonPressedImg;


  //_________________________________________________ constructor

  Button (float posX, float posY, float rectWidth, float rectHeight, String t) {
    x = posX;
    y = posY;
    w = round(rectWidth);
    h = round(rectHeight);
    text = t;
    
    
    
    //buttonImg = loadImage("Images/Button.png");
    //buttonImg.resize(wScale, hScale);
    //buttonPressedImg = loadImage("Images/ButtonPressed.png");
    //buttonPressedImg.resize(wScale, hScale);
  }
  
  void show(){
    if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2) 
      mouseInside = true;
    else
      mouseInside = false;

    if (mouseInside) {
      rectMode(CENTER);
      noStroke();
      fill(155);
      rect(x, y , w, h);
      
      fill(255);
      textSize(24);
      textAlign(CENTER);
      text(text, x, y+5);
    } else {
      rectMode(CENTER);
      noStroke();
      fill(255);
      rect(x, y, w, h);
      
      fill(0);
      textSize(24);
      textAlign(CENTER);
      text(text, x, y+5);
    }

    
  }
  
}
