PImage marioBox;
boolean breakBox = false;
float N = 0;
float P = 0;
float u, v, uOffset, vOffset;
float camera = 250;

void setup() {
  pixelDensity(displayDensity());
  size(1280,720,P3D);
  noStroke();
  textureMode(NORMAL);
  frameRate(60);
  
  marioBox = loadImage("Texture2D.jpg");
}

void draw() {
  //Give the user control of the camera, plus have it move slightly when idle.
    camera = camera + 0.1;
  background(0,100,200);
  camera(camera, mouseY/2, mouseX/2, width/2, height/2, 0, 0, 1, 0);
//Draw some lights
  directionalLight(255, 255, 255, 500, 500, 500);
  ambientLight(150,100,0);
  
  
//When the mouse is clicked, the box will break.
//N is the negative motion variable, P is the positive one.
  if(breakBox == true){
    N = N - 0.05;
    P = P + 0.05;
  }
  
  //Setting up some things for the box
  pushMatrix();
  translate(width/2, height/2, 100);
  rotateY(15);
  rotateX(0.3);
  rotateZ(-0.3);
  scale(100);

  //Draw all 6 sides of the box
  
  //Behind Right
  beginShape();
  texture(marioBox);
  translate(0,N,P*2);
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);  
  endShape(CLOSE);
  translate(0,-N,-P*2);
  
  // Behind Left
  beginShape(QUADS);
  texture(marioBox);
  translate(P*2,N);
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);
  endShape();
  translate(-P*2,-N);

  // Front Left
  beginShape();
  texture(marioBox);
  translate(0,0,N);
  vertex(1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1); 
  vertex(1, 1, -1, 0, 1);
  endShape(CLOSE);
  translate(0,0,-N);

  fill(0,255,255);
  // Front Right
  beginShape();
  texture(marioBox);
  translate(N,0);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape(CLOSE);
  translate(-N,0);

  fill(255,175,50);
  // Bottom
  beginShape();
  translate(0,P);
  vertex(-1, 1, 1);
  vertex(1, 1, 1);
  vertex(1, 1, -1);
  vertex(-1, 1, -1);
  endShape(CLOSE);
  translate(0,-P);
  
  fill(255,175,50);
  // Top
  beginShape();
  translate(0,N);
  rotateX(N/3);
  vertex(-1, -1, -1);
  vertex(1, -1, -1);
  vertex(1, -1, 1);
  vertex(-1, -1, 1);
  endShape(CLOSE);  
  popMatrix();
  
 //Create a mushroom
 fill(255,0,0);
 translate(630, 390, 100);
 box(50, 80, 50);
 translate(0,-50,0);
 sphere(60);
}

//Clicking the mouse will activate the breakBox boolean.
void mousePressed(){
 breakBox = true;
}