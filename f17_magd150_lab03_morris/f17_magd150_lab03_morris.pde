//Interaction Instructions: Hold mouse and move mouse to begin blowing a bubble with the wand. See how big it can get!

//defines floats, makes bubble not quite prefectly round, demonstrates min & max
float bubX = min(20,25);
float bubY = max(20,25);

void setup () {
  size(1280,720);
}

void draw () {
  
  {background(255);}
  
//bubble wand
  noFill();
  stroke(255,0,200);
  ellipseMode(CENTER);
  strokeWeight(10);
  line(mouseX,mouseY-120,mouseX,mouseY+60);
  ellipse(mouseX,mouseY-200,80,150);
  
  //Popped message
  textSize(50);
  fill(255,0,0);
  if (bubX > 290) {
  text("Bubble Popped!", mouseX-100,mouseY-300);
  }
  
  //BubX will never go beyond 0-300
  bubX = constrain(bubX, -1, 301);
  
}
  //Hold and drag the mouse to blow a bubble (air motion creates bubble)
void mouseDragged() {
  {fill(0,0,255,100);
  noStroke();
  ellipse(pmouseX-70,pmouseY-200,bubX,bubY);}
  bubX = (bubX+1); 
  bubY = (bubY+1);
  
  //Print the size of the bubble
  println(bubX);
  
  //"if" statement for the bubble to pop
  if (bubX == 300) {
  bubX=0;
  bubY=0;
  println("BUBBLE POPPED!");
  }
 
}
//Release mouse to cancel bubble prematurely
void mouseReleased(){
  bubX=20;
  bubY=20;
  
      
}