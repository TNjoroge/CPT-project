class Level {
  float groundX[] = {0, 700, 1600};
  float groundY[] = {500};
  Level() {
   
  }
  void display() {

    noStroke();
    fill(#43A00F);
    rect(groundX[0], groundY[0], 600, 100);
    rect(groundX[1], groundY[0], 800, 100);
    rect(groundX[2], groundY[0], 500, 100);
    
  }
} 