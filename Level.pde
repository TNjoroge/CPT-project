class Level {
  float groundX[] = {-300, 700, 1275, 1475};
  float groundY[] = {500};
  PVector trap;
  
  Level() {
    trap = new PVector (1200, 500);
  }

  void display() {
    for (int i = 0; i < clouds.length; i++) {
      // move each cloud
      clouds[i].add(1, 0);

      // reset if they go too far
      if (clouds[i].x - 75 > b.pos.x + 700) {
        clouds[i].x = -75;
        clouds[i].y = (int) random(50, 300);
      }

      // draw each cloud
      noStroke();
      fill(255);
      ellipse(clouds[i].x, clouds[i].y, 70, 50);
      ellipse(clouds[i].x+20, clouds[i].y+15, 70, 50);
      ellipse(clouds[i].x-20, clouds[i].y+15, 70, 50);
    }
    noStroke();
    fill(#43A00F);
    rect(groundX[0], groundY[0], 900, 100);
    rect(groundX[1], groundY[0], 500, 100);
    rect(groundX[2], groundY[0], 100, 100);
    rect(groundX[3], groundY[0], 500, 100);
    rect(trap.x, trap.y, 75, 100);
    
    fill(#959595);
    rect(0, 200, 100, 300);
  }
} 
