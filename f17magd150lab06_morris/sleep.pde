

class sleep {

  float sx = random(100, width-100);
  float sy = random(800,2500);
  float texts = random(30,60);

  sleep() {
  }

  void draw() {

    //horizontal shake:
    sx = sx + random(-5, 5);

    //drawing the "z" sleep elements
    noStroke();
    fill(255);

    //drawing a cluster of ellipses, each one radomizing slightly in position and size
   
    ellipse(sx - random(12,15), sy - random(18,20), random(60,80), random(50,70));
    ellipse(sx + random(8,10), sy + random(10,23), random(50,70), random(40,70));
    ellipse(sx - random(25,27), sy + random(8,10), random(60,70), random(50,60));
    ellipse(sx + random(17,20), sy - random(15,18), random(50,60), random(40,50));
    fill(0);
    
    //the "z" text
    textSize(texts);
    text("Z", sx-20, sy+15);

    //This "if-else" statement will keep the cloud elements floating,
    //and restart them below the screen when they reach the top
    if (sy < -100) {
      sy = random(800,2500);
      sx = random(100, width-100);
      
    } else {
      sy = sy - 5;
    }
  }
}