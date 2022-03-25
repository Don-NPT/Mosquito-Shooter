
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

boolean send = false;
String msg = "";
int count = 0;
void setup() {
   size(400, 300);
   
   InitLayout();
}

void draw() {
   background(180);
   print(count+++"draw");
   
   for (TEXTBOX t : textboxes) {
      t.DRAW();
   }
   
   if (send) {
      text(msg, (width - textWidth(msg)) / 2, 260);
   }
}

void InitLayout() {
  print(count+++"Lay ");
   TEXTBOX receiver = new TEXTBOX();
   receiver.W = 100;
   receiver.H = 35;
   receiver.X = (width - receiver.W) / 2;
   receiver.Y = 50;
   textboxes.add(receiver);
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
     print(count++);
      t.PRESSED(mouseX, mouseY);
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, keyCode)) {
         send = true;
         msg = "Message is: " + textboxes.get(0).Text;
      }
   }
}
