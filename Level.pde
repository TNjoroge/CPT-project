class Level {
  PVector ground;
  Level() {
    ground = new PVector(0, 500);
  }
  void display() {
    noStroke();
    fill(#43A00F);
    rect(ground.x, ground.y, 600, 100);
  }
}
