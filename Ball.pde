class Ball extends Level {

  PVector pos;
  PVector constrainPoint;

  Ball() {
    pos = new PVector(4000, 475);
  }

  //draws character  
  public void display() {
    //move before submission

    background(0xff08CBFF);
    //character
    noStroke();
    fill(255, 0, 255);
    ellipse(pos.x, pos.y, 50, 50);
  } 

  //movement
  public void movement() {    
    if (move[0]) {
      pos.sub(0, 8);
    } 
    if (move[1]) {
      pos.sub(5, 0);
    } 
    if (move[2]) {
      pos.add(5, 0);
    }
  }
}
