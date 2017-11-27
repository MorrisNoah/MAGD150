//Declaring nine instances of the sleep class
sleep s1,s2,s3,s4,s5,s6,s7,s8,s9;

//Setting up inital background color
float backg = 255;

void setup(){

  size(1280,720);
  
  //Created the new class intances
  s1 = new sleep();
  s2 = new sleep();
  s3 = new sleep();
  s4 = new sleep();
  s5 = new sleep();
  s6 = new sleep();
  s7 = new sleep();
  s8 = new sleep();
  s9 = new sleep();
}

void draw(){
 
  //Setting up three functions
  functionbackground();
  functiondrawsleep();
  functionwake();
  
}

//First function:
//causes the background to fade from white to black upon startup
void functionbackground(){
  background(backg);
      backg = backg -3;
}
  
  
//Second function:
//drawing the screen saver "z" elements
void functiondrawsleep(){
  s1.draw();
  s2.draw();
  s3.draw();
  s4.draw();
  s5.draw();
  s6.draw();
  s7.draw();
  s8.draw();
  s9.draw();
}

//Third and final function:
//allowing the screen saver to be exited upon the press of any key

void functionwake(){
  
  if (keyPressed){
   exit();
  }
  
  }