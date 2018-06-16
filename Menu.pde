class Menu {
  
  PVector button;
  
  Menu () {
    button = new PVector(100, 400);
  }
  
  void display() {
    background(#08CBFF);
    noFill();
    stroke(255);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    strokeWeight(5);
    rect(button.x, button.y, 400, 100);
  }
}
