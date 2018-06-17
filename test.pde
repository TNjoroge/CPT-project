Ball b;
Level lvl;
Enemy e;
Menu menu;
boolean move[] = {false, false, false, false};
float screen;
PVector vel;
float life = -1;
PVector[] clouds;

void setup() {
  size (600, 600);
  b = new Ball();
  lvl = new Level();
  e = new Enemy();
  menu = new Menu();
  frameRate(60);
  screen = 0;
  vel = new PVector(0, 0);

  
  clouds = new PVector[10];
  for (int i = 0; i < clouds.length; i++) {
    float x = random(b.pos.x - 300, width);
    float y = random(0, 250);
    clouds[i] = new PVector(x, y);
  }
}

void draw() {
  screen = b.pos.x;

  menu.display();
  if (life > 0) {
    b.movement();
    translate(-screen + 300, 0);
    collision();
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
    text("GAME OVER", b.pos.x - 150, 250, 1000, 1000);
    textSize(20);
    text("CLICK ANYWHERE TO RESTART", b.pos.x - 155, 300, 1000, 1000);
  }
  if (b.pos.x > lvl.trap.x) {
      lvl.trap.y += 10;
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
  if (life == 0 && mousePressed == true) {
    life = 3;
  }
}


//checks for collision
void collision() {  
  //calculates distance between ball and ground
  float grndOneX = constrain(b.pos.x, lvl.groundX[0], lvl.groundX[0] + 900);
  float grndOneY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndTwoX = constrain(b.pos.x, lvl.groundX[1], lvl.groundX[1] + 500);
  float grndTwoY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndThreeX = constrain(b.pos.x, lvl.groundX[2], lvl.groundX[2] + 800);
  float grndThreeY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  //float grndFourX = constrain(b.pos.x, lvl.groundX[3], lvl.groundX[3] + 800);
  //float grndFourY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);

  float disOne = dist(b.pos.x, b.pos.y, grndOneX, grndOneY);
  float disTwo = dist(b.pos.x, b.pos.y, grndTwoX, grndTwoY);
  float disThree = dist(b.pos.x, b.pos.y, grndThreeX, grndThreeY);

  float enmyX = constrain(b.pos.x, e.enemyX[0], e.enemyX[0] + 35);
  float enmyY = constrain(b.pos.y, e.enemyY[0], e.enemyY[0] + 35);
  float enmyDis = dist(b.pos.x, b.pos.y, enmyX, enmyY);


  //adds gravity if distance is greater than radius
  if (disOne >= 25 && disTwo >= 25 && disThree >= 25|| b.pos.y > 500) {
    vel.add(0, .5);
  } else {
    vel.y = 0;
    b.pos.y = 475;
  }
  b.pos.add(vel);

  //stops ball play area
  if (b.pos.x <= 125) {
    b.pos.x = 125;
  }
  if (enmyDis <= 25) {
    println(life);
    b.pos.x = 300;
    life -= 1;
    translate(b.pos.x, 0);
  }
  if (b.pos.y >= 650) {
    b.pos.x = 300;
    b.pos.y = 475;
    life -= 1;
    translate(b.pos.x + 300, 0);
  }
}
