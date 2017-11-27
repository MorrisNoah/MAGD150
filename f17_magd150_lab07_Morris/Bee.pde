

class Bee {
  
  PVector pos;
  PVector vel;
  PVector acc;
  float speedlimit;
  //randomizing bee speed to create variance
  float beeSpeed = random(1,15);
  float beeFollow = random(0.1,2);
  float beehive;

  //Defining one of three beehive locations for the bee to spawn from
  Bee() {
    beehive = round(random(1,3));
   
    if(beehive == 1){
    pos = new PVector (200,150);
    }
    if(beehive == 2){
    pos = new PVector (180,450);
    }
    if(beehive == 3){
    pos = new PVector (width-200,300);
    }
    vel = new PVector(0,0);
  }
  
  
  void update() {

//This if statement will make the bees to go crazy when the bug spray is used at the end
          if(spray == false){
           speedlimit = beeSpeed;
  }else{
      float beeSpeed = -100;
      speedlimit = beeSpeed;
      beeFollow = 20;
  }
      
//Adapting some PVectors from an example in class too allow the physics to work
    PVector player = new PVector(mouseX, mouseY);
    PVector acc = PVector.sub(player,pos);
    //Another randomization to create variance
    acc.setMag(beeFollow);
    
    vel.add(acc);
    vel.limit(speedlimit);
    pos.add(vel);
  }
  
  void display() {
    
    //Drawing the bee
    fill(255,255,0);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, 30, 20);
    
    //lines
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect(pos.x, pos.y, 2, 20);
    rect(pos.x-8, pos.y, 2, 15);
    rect(pos.x+8, pos.y, 2, 15);
    
    //The bee's wing
    stroke(0);
    fill(255,255,255,200);
    ellipse(pos.x-random(-4,4), pos.y-15, 8, 15);
  
  
  //Defining a hitbox. Damgage to the health float will be taken using this
  if(pos.x+5 > mouseX && pos.y+5 > mouseY && pos.x < mouseX+5 && pos.y < mouseY+5){
    
    fill(255,0,0,150);
    noStroke();
    ellipse(pos.x,pos.y,50,50);
    health = health - 1;
  }
    
    
  }
  
}
    
    
    
    
    