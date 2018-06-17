Ball b;
Level lvl;
Enemy e;
Menu menu;
boolean move[] = {false, false, false, false};
float screen;
PVector vel;
float life = -1;

void setup() {
  size (600, 600);
  b = new Ball();
  lvl = new Level();
  e = new Enemy();
  menu = new Menu();
  frameRate(60);
  screen = b.pos.x;
  vel = new PVector(0, 0);
}

void draw() {
  if (b.pos.x > screen) {
    screen = b.pos.x;
  }
  menu.display();
  if (life > 0) {
    b.movement();
    collision();
    translate(-screen + 300, 0);
    background(0);
    b.display();
    e.display();
    lvl.display();
  }
  if (life == 0) {
    //translate(0 , 0);
    background(0);
    textSize(50);
    fill(255);
    text("GAME OVER", screen - 150, 250, 1000, 1000);
  }
}

void keyPressed() {
  if (key == 'w') {
    move[0] = true;
  } 
  if (key == 'a') {
    move[1] = true;
  } 
  if (key == 'd') {
    move[2] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    move[0] = false;
  } 
  if (key == 'a') {
    move[1] = false;
  } 
  if (key == 'd') {
    move[2] = false;
  }
}  

void mousePressed() {
  if (mouseX >= menu.button.x &&
    mouseX <= menu.button.x + 400 &&
    mouseY >= menu.button.y &&
    mouseY <= menu.button.y + 100) {
    life = 3;
  }
}


//checks for collision
void collision() {  
  //calculates distance between ball and ground
  float grndOneX = constrain(b.pos.x, lvl.groundX[0], lvl.groundX[0] + 600);
  float grndOneY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndTwoX = constrain(b.pos.x, lvl.groundX[1], lvl.groundX[1] + 500);
  float grndTwoY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndThreeX = constrain(b.pos.x, lvl.groundX[2], lvl.groundX[2] + 800);
  float grndThreeY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  
 
  float disOne = dist(b.pos.x, b.pos.y, grndOneX, grndOneY);
  float disTwo = dist(b.pos.x, b.pos.y, grndTwoX, grndTwoY);
  float disThree = dist(b.pos.x, b.pos.y, grndThreeX, grndThreeY); 

  
  float enmyX = constrain(b.pos.x, e.enemyX[0], e.enemyX[0] + 40);
  float enmyY = constrain(b.pos.y, e.enemyY[0], e.enemyY[0] + 40);
  float enmyDis = dist(b.pos.x, b.pos.y, enmyX, enmyY);
  
  
  //adds gravity if distance is greater than radius
  if (disOne >= 25 && disTwo >= 25 && disThree >= 25|| b.pos.y > 500) {
    vel.add(0, .5);
  } else {
    vel.y = 0;
    b.pos.y = 475;
  }
  b.pos.add(vel);

  //stops ball from leaving screen
  if (b.pos.x <= screen - 275) {
    b.pos.x = screen - 275;
  }
  if (enmyDis <= 25) {
    println(life);
    b.pos.x = 300;
    life -= 1;
  }
  if (b.pos.y >= 650) {
    b.pos.x = 300;
    b.pos.y = 475;
    life -= 1;
  }
}