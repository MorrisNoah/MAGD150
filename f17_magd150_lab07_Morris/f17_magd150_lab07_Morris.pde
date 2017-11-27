//The object of this game is to avoid getting touched by the bees. Survive long enough until you are provided a means of escape!

//Defining some instances of the Bee class
Bee bee, bee2, bee3, bee4, bee5, bee6, bee7;

//Two arrays of the Bee class
Bee[] BeeArray = new Bee[10];
Bee[] BeeSWARM = new Bee[50];

int health = 30;
float sun = 300;
float sky = 255;

//Some important booleans for the end of the game
boolean end = false;
boolean spray = false;


//Importing some music
    import processing.sound.*;
    SoundFile file;
    
    
void setup() {
  
//Playing the music
    file = new SoundFile(this, "Bumblebee.mp3");
    file.play();
  
  frameRate(60);
  fullScreen();
  
//Classses and arrays:
  bee = new Bee();
  bee2 = new Bee();
  bee3 = new Bee();
  bee4 = new Bee();
  bee5 = new Bee();
  bee6 = new Bee();
  bee7 = new Bee();
  
  for (int i = 0; i < BeeArray.length; i++) {
  BeeArray[i] = new Bee(); 
  }
  
  for (int i = 0; i < BeeSWARM.length; i++) {
  BeeSWARM[i] = new Bee(); 
  }
    

}

void draw() {
  
//Print the health number
  println(health);
  
//Change the sky from day to night
   sky = sky - 0.08;
   background(150,sky,255);
 
//The sun, which sets as time goes on
   sun = sun + 0.02;
   scale(2);
   noStroke();
   fill(255,255,0,150);
   ellipse(300,sun,100,100);
   scale(0.5);

//Grass ground
   ellipseMode(CORNER);
   fill(0,200,0);
   ellipse(-1000,height-100,width+2000,height);
  
//Drawing trees and beehives on the left and right sides
  trees();
  translate(width-100,0);
  trees();
  translate(-width+100,0);
  
//Drawing at the mouse position (a flower during the main part of the gameplay based on health amount, and bugspray at the end)
  if(end == false){
  flower(mouseX,mouseY);
  }else{
  bugspray();
  }
  
//Displaying all of the bees at specific points, based on frame rate count
   bee.update();
   bee.display();
  
    if(frameCount > 500){
    bee2.update();
    bee2.display();
  }
    if(frameCount > 1000){
    bee3.update();
    bee3.display();
    bee4.update();
    bee4.display();
  }
    if(frameCount > 1600){
    
    bee5.update();
    bee5.display();
    bee6.update();
    bee6.display();
    bee7.update();
    bee7.display();
  }
  
    if(frameCount > 2300){
        
    for (int i = 0; i < BeeArray.length; i++) {
    BeeArray[i].update();
    BeeArray[i].display();
    }
  }
  
    if(frameCount > 3100){
        
    for (int i = 0; i < BeeSWARM.length; i++) {
    BeeSWARM[i].update();
    BeeSWARM[i].display();
    }
  }
  
  
  //This is for the end of the game at the 4000th frame rate
  if(frameCount > 4000){
    end = true;
  }
  round(health);
  fill(0);
  textSize(13);
  text("HITPOINTS:", 200,25);
  text(health, 280,25);
}

void trees(){
  rectMode(CORNER);
  noStroke();
  fill(150,50,0);
  rect(0,0,100,height);
  rect(0,100,200,20);
  rect(0,400,180,20);
  rect(0,250,-100,20);
  
  stroke(0);
  ellipseMode(CENTER);
  
  fill(230,230,0);
  ellipse(200,150,70,100);
  fill(0);
  ellipse(200,160,25,25);
  
  fill(230,230,0);
  ellipse(180,450,70,100);
  fill(0);
  ellipse(180,460,25,25);
  
  fill(230,230,0);
  ellipse(-100,300,70,100);
  fill(0);
  ellipse(-100,310,25,25);
  
}

//The number of pedels on the flower depends on the health state. This creates a visual indicator for the player regarding how their health is doing.
void flower(float x, float y){
  fill(255,0,150);
  ellipseMode(CORNER);
  if(health >= 30){
  //bottom
  ellipse(x-5, y, 10, 25);
  }if(health >= 27){
  //top
  ellipse(x-5, y, 10, -25);
  }if(health >= 23){
  //left
  ellipse(x, y-5, -25, 10);
  }if(health >= 19){
  //right
  ellipse(x, y-5, 25, 10);
  }if(health >= 16){
     //upper left
  translate(mouseX,mouseY);
  rotate(radians(45));
  ellipse(0, -5, -25, 10);
  rotate(radians(-45));
  translate(-mouseX,-mouseY);
  }if(health >= 13){
     //upper right
  translate(mouseX,mouseY);
  rotate(radians(45));
  ellipse(-5, 0, 10, -25);
  rotate(radians(-45));
  translate(-mouseX,-mouseY); 
  }if(health >= 10){
     //lower left
  translate(mouseX,mouseY);
  rotate(radians(45));
  ellipse(-5, 0, 10, 25);
  rotate(radians(-45));
  translate(-mouseX,-mouseY); 
  }if(health >= 7){
  //lower right
  translate(mouseX,mouseY);
  rotate(radians(45));
  ellipse(0, -5, 25, 10);
  rotate(radians(-45));
  translate(-mouseX,-mouseY);
  }if(health >= 3){
  ellipseMode(CENTER);
  fill(255,255,0);
  ellipse(x,y,15,15);
  }if(health < 1.1){
  fill(255,0,0);
  textSize(50);
  text("GAME OVER!", mouseX, mouseY);
  }if(health < 1){
    //Run out of health, game over!
  println("GAME OVER");
  delay(3000);
  exit(); 
}
}

void bugspray(){
  rectMode(CENTER);
    fill(255,0,0);
    rect(mouseX,mouseY,50,80,5);
    fill(0);
    ellipse(mouseX,mouseY+5,30,30);
    rect(mouseX,mouseY+20,15,20);
    textSize(20);
    text("RAID", mouseX-25,mouseY-10); 
    fill(255,random(0,255),0);
    textSize(20);
    text("Click to use the spray!", mouseX-100,mouseY-100); 
    
}
  
  //Mouse pressed to activate the bugspray at the end
  void mousePressed(){
    if(end == true){
    spray = true;
    }
  }