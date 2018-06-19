class Level {
  float groundX[] = {-300, 700, 1275, 1475, 2075, 2275, 2475, 2675, 2875, 3075, 4900 };
  float groundY[] = {500};
  float treeX [] = {800, 900, 1000, 1100, 200, 300, 400, 1600, 1700, 1800, 1900};
  float treeY [] = {275};
  float treeFlowerX [] = {825, 925, 1025, 1125, 225, 325, 425, 1625, 1725, 1825, 1925};
  float treeFlowerY [] = {275};


  PVector trap;

  Level() {
    trap = new PVector (1200, 500);
  }

  //setup used to reset values
  public void setup() {
    trap = new PVector (1200, 500);
  }

  public void display() {
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

    //draws ground
    noStroke();
    fill(0xff43A00F);
    rect(groundX[0], groundY[0], 900, 100);
    rect(groundX[1], groundY[0], 500, 100);
    rect(groundX[2], groundY[0], 100, 100);
    rect(groundX[3], groundY[0], 500, 100);
    rect(groundX[4], groundY[0], 75, 200);
    rect(groundX[5], groundY[0], 75, 200);
    rect(groundX[6], groundY[0], 75, 200);
    rect(groundX[7], groundY[0], 75, 200);
    rect(groundX[8], groundY[0], 75, 200);
    rect(groundX[9], groundY[0], 2200, 200);
    rect(trap.x, trap.y, 75, 100);

    //draws wall
    fill(0xff959595);
    rect(0, 200, 100, 300);

    //draws flag post
    rect(4300, 100, 15, 400);

    //draws goal
    rect(groundX[10], 400, 15, 100);
    fill(255, 0, 255);
    ellipse(groundX[10] + 7, 400, 50, 50);

    //draws trees
    fill(51, 0, 0);
    rect(treeX[0], treeY[0], 50, 225);
    rect(treeX[1], treeY[0], 50, 225);
    rect(treeX[2], treeY[0], 50, 225);
    rect(treeX[3], treeY[0], 50, 225);
    rect(treeX[4], treeY[0], 50, 225);
    rect(treeX[5], treeY[0], 50, 225);
    rect(treeX[6], treeY[0], 50, 225);
    rect(treeX[7], treeY[0], 50, 225);
    rect(treeX[8], treeY[0], 50, 225);
    rect(treeX[9], treeY[0], 50, 225);

    //draws leaves
    fill(0, 153, 0); 
    ellipse(treeFlowerX[0], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[1], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[2], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[3], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[4], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[5], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[6], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[7], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[8], treeFlowerY[0], 100, 100);
    ellipse(treeFlowerX[9], treeFlowerY[0], 100, 100);
  }
} 
