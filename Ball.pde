class Ball extends Level {
  
  PVector pos;
  PVector constrainPoint;

  
  Ball() {
    pos = new PVector(300, 475);
  }
  
//draws character  
  void display() {
    //move before submission

    
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

//checks for ground collision
  void collision() {  
    float pointX = constrain(pos.x, ground.x, ground.x + 600);
    float pointY = constrain(pos.y, ground.y, ground.y + 100);
    float d = dist(pos.x, pos.y, pointX, pointY);
    if (d >= 25) {
      vel.add(0, .5);
    } else {
      vel.y = 0;
    }
   pos.add(vel);
  }
}
