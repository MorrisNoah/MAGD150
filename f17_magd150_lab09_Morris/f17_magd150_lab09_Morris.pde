import processing.sound.*;
import processing.video.*;

PImage mirror;
PImage fedora;
PImage boombox;
PImage disc;

float speed = 1;

boolean play = false;

SoundFile jackson;

Capture reflect;

void setup() {
  
  size(940,616);
  
  //The mirror image is from pexels.com.
  mirror = loadImage("mirror.jpeg");
  
  //The fedora and boombox images are from pixabay.com.
  //I edited the boombox one in Photoshop.
  fedora = loadImage("fedora.png");
  boombox = loadImage("boombox.png");
  
  //I put together this little disc image.
  disc = loadImage("disc.png");
  
  //This is a remix of a song by Michael Jackson.
  //It was created by IZECOLD, and is made available free to use on Soundcloud.com.
  jackson = new SoundFile(this, "IZECOLD_remix.mp3");
  
  //Setting up a camera capture.
  reflect = new Capture(this, 640, 480);
  reflect.start();
}
void captureEvent(Capture reflect) {
  reflect.read();
}


void draw(){
  //This will control a sound effect using the intiger "speed."
  jackson.rate(speed);
  
  //Draw the background image.
  image(mirror, 0, 0, width, height);
  filter(POSTERIZE, 20);
  
  //Draw the boombox.
  image(boombox, 475, 310);
  boombox.resize(0, 250);
  
  //Draw a fedora.
  image(fedora, 400, 230);
  fedora.resize(0, 200);
  
  //Draw the disc.
  image(disc, 815, 330);
  
  //Draw a rectangle in place of the mirror
  noStroke();
  fill(0);
  rect(50, 0, 300, 410);
  
  //Draw the camera's capture IF the play button activated it.
  if(play == true){
  image(reflect, 50, 0, 300, 410);
  }
  
  //Play button effect based on mouse position.
  if(mouseX > 630 && mouseX < 767 && mouseY > 405 && mouseY < 555){
  fill(0,255,0,80);
  rect(630,405,137,150);
  }
  //Up button
  if(mouseX > 490 && mouseX < 605 && mouseY > 435 && mouseY < 550){
  fill(255,0,0,80);
  rect(490,435,115,115);
  }
  //Down button
  if(mouseX > 790 && mouseX < 905 && mouseY > 435 && mouseY < 550){
  fill(255,0,0,80);
  rect(790,435,115,115);
  }
  //Disc interaction.
  if(mouseX > 815 && mouseX < 905 && mouseY > 330 && mouseY < 370){
   fill(0);
   rect(0, 550, width, height);
   textSize(18);
   fill(255);
   text("It's a game CD... so it won't work... ", 100, 580);
  }
}

void mousePressed() {
  
  //Play button interaction.
  if(mouseX > 630 && mouseX < 767 && mouseY > 405 && mouseY < 555){
  //This plays the music and will cause the capture to dispaly.
  //By using an "if" statement, 
  //I will ensure that the user cannot play the file multiple times.
  if(play == false){
  jackson.play();
  play = true;
  }
  
  fill(0,255,0,150);
  rect(630,405,137,150);
  }
  
  //Up button interaction.
  if(mouseX > 490 && mouseX < 605 && mouseY > 435 && mouseY < 550){
  //This will increase the rate of the music.
  speed = speed * 1.5;
  fill(255,0,0,150);
  rect(490,435,115,120);
  }
  
  //Down button interaction.
  if(mouseX > 790 && mouseX < 905 && mouseY > 435 && mouseY < 550){
  //This will decrease the rate of the music.
  speed = speed / 1.5;
  fill(255,0,0,150);
  rect(790,435,115,120);
  }
  
}