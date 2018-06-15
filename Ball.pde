class Ball extends Level{

  PVector pos;
  PVector constrainPoint;

  Ball() {
    pos = new PVector(300, 475);
  }

  //draws character  
  void display() {
    //move before submission

    background(#08CBFF);
    //character
    noStroke();
    fill(255, 0, 255);
    ellipse(pos.x, pos.y, 50, 50);
  } 

  //movement
  void movement() {    
    if (move[0]) {
      pos.sub(0, 8);
    } 
    if (move[1]) {
      pos.sub(4, 0);
    } 
    if (move[2]) {
      pos.add(4, 0);
    }
  }


}
