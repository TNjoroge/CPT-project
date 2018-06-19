Ball b;
Level lvl;
Enemy e;
Menu menu;
boolean move[] = {false, false, false, false};
float screen;
PVector vel;
int life = -1;
PVector[] clouds;
boolean pole = false;



public void setup() {
  size  (600, 600);
  b = new Ball();
  lvl = new Level();
  e = new Enemy();
  menu = new Menu();
  screen = 0;
  vel = new PVector(0, 0);


  clouds = new PVector[10];
  for (int i = 0; i < clouds.length; i++) {
    float x = random(b.pos.x - 300, width);
    float y = random(0, 250);
    clouds[i] = new PVector(x, y);
  }
}

public void draw() {
  //sets screens psotion
  screen = b.pos.x;

  //draws menu
  menu.display();

  //draws game
  if (life > 0) {
    b.movement();
    translate(-screen + 300, 0);
    collision();
    background(0);
    b.display();
    e.display();
    lvl.display();
    e.movement();
    fill(0);
    text("LIVES :" + life, b.pos.x - 280, 50);
  }

  //draws game over screen
  if (life == 0 ) {
    //translate(0 , 0);
    background(0);
    textSize(50);
    fill(255);
    text("GAME OVER", b.pos.x - 150, 250, 1000, 1000);
    textSize(20);
    text("CLICK ANYWHERE TO RESTART", b.pos.x - 155, 300, 1000, 1000);
    //e.setup();
    lvl.setup();
  }

  //draws winning screen
  if (b.pos.x >= 4900) {
    b.pos.x = 7000;
    background(0);
    textSize(50);
    fill(255);
    text("Winner", b.pos.x - 80, 250, 1000, 1000);
  }
  //moves trap
  if (b.pos.x > lvl.trap.x) {
    lvl.trap.y += 10;
  }
  //moves flag enemy
  if (b.pos.x >= 4200) {
    pole = true;
  } 
  if (pole == true) {
    e.enemyY[7] += 20;
  }
}

//key detection for movement
public void keyPressed() {
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

public void keyReleased() {
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

//mouse detection to start game
public void mousePressed() {
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
public void collision() {  
  //calculates distance between ball and ground
  float grndOneX = constrain(b.pos.x, lvl.groundX[0], lvl.groundX[0] + 900);
  float grndOneY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndTwoX = constrain(b.pos.x, lvl.groundX[1], lvl.groundX[1] + 500);
  float grndTwoY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndThreeX = constrain(b.pos.x, lvl.groundX[2], lvl.groundX[2] + 100);
  float grndThreeY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndFourX = constrain(b.pos.x, lvl.groundX[3], lvl.groundX[3] + 500);
  float grndFourY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndFiveX = constrain(b.pos.x, lvl.groundX[4], lvl.groundX[4] + 100);
  float grndFiveY = constrain(b.pos.y, lvl.groundY[0], lvl.groundY[0] + 100);
  float grndSixX = constrain(b.pos.x, lvl.groundX[5], lvl.groundX[5] + 100);
  float grndSevenX = constrain(b.pos.x, lvl.groundX[6], lvl.groundX[6] + 100);
  float grndEightX = constrain(b.pos.x, lvl.groundX[7], lvl.groundX[7] + 100);
  float grndNineX = constrain(b.pos.x, lvl.groundX[8], lvl.groundX[8] + 100);
  float grndTenX = constrain(b.pos.x, lvl.groundX[9], lvl.groundX[9] + 8000);
  float grndElevenX = constrain(b.pos.x, lvl.groundX[10], lvl.groundX[10] + 100);
  float grndElevenY = constrain(b.pos.y, lvl.groundX[0], lvl.groundX[0] - 325);

  float disOne = dist(b.pos.x, b.pos.y, grndOneX, grndOneY);
  float disTwo = dist(b.pos.x, b.pos.y, grndTwoX, grndTwoY);
  float disThree = dist(b.pos.x, b.pos.y, grndThreeX, grndThreeY);
  float disFour = dist(b.pos.x, b.pos.y, grndFourX, grndFourY);
  float disFive = dist(b.pos.x, b.pos.y, grndFiveX, grndFiveY);
  float disSix = dist(b.pos.x, b.pos.y, grndSixX, grndFiveY);
  float disSeven = dist(b.pos.x, b.pos.y, grndSevenX, grndFiveY);
  float disEight = dist(b.pos.x, b.pos.y, grndEightX, grndFiveY);
  float disNine = dist(b.pos.x, b.pos.y, grndNineX, grndFiveY);
  float disTen = dist(b.pos.x, b.pos.y, grndTenX, grndFiveY);
  float disEleven = dist(b.pos.x, b.pos.y, grndElevenX, grndElevenY);

  //calculates distance between ball and enemies
  float enmyOneX = constrain(b.pos.x, e.enemyX[0], e.enemyX[0] + 35);
  float enmyOneY = constrain(b.pos.y, e.enemyY[0], e.enemyY[0] + 35);
  float enmyDisOne = dist(b.pos.x, b.pos.y, enmyOneX, enmyOneY);
  float enmyTwoX = constrain(b.pos.x, e.enemyX[1], e.enemyX[1] + 35);
  float enmyTwoY = constrain(b.pos.y, e.enemyY[0], e.enemyY[0] + 35);
  float enmyDisTwo = dist(b.pos.x, b.pos.y, enmyTwoX, enmyTwoY);
  float enmyThreeX = constrain(b.pos.x, e.enemyX[2], e.enemyX[2] + 75);
  float enmyThreeY = constrain(b.pos.y, e.enemyY[1], e.enemyY[1] + 75);
  float enmyDisThree = dist(b.pos.x, b.pos.y, enmyThreeX, enmyThreeY);
  float enmyFourX = constrain(b.pos.x, e.enemyX[3], e.enemyX[3] + 75);
  float enmyFourY = constrain(b.pos.y, e.enemyY[2], e.enemyY[2] + 75);
  float enmyDisFour = dist(b.pos.x, b.pos.y, enmyFourX, enmyFourY);
  float enmyFiveX = constrain(b.pos.x, e.enemyX[4], e.enemyX[4] + 75);
  float enmyFiveY = constrain(b.pos.y, e.enemyY[3], e.enemyY[3] + 75);
  float enmyDisFive = dist(b.pos.x, b.pos.y, enmyFiveX, enmyFiveY);
  float enmySixX = constrain(b.pos.x, e.enemyX[5], e.enemyX[5] + 75);
  float enmySixY = constrain(b.pos.y, e.enemyY[4], e.enemyY[4] + 75);
  float enmyDisSix = dist(b.pos.x, b.pos.y, enmySixX, enmySixY);
  float enmySevenX = constrain(b.pos.x, e.enemyX[6], e.enemyX[6] + 75);
  float enmySevenY = constrain(b.pos.y, e.enemyY[5], e.enemyY[5] + 75);
  float enmyDisSeven = dist(b.pos.x, b.pos.y, enmySevenX, enmySevenY);
  float enmyEightX = constrain(b.pos.x, e.enemyX[7], e.enemyX[7] + 35);
  float enmyDisEight = dist(b.pos.x, b.pos.y, enmyEightX, enmyOneY);
  float enmyNineX = constrain(b.pos.x, e.enemyX[8], e.enemyX[8] + 50);
  float enmyNineY = constrain(b.pos.y, e.enemyY[7], e.enemyY[7] + 50);
  float enmyDisNine = dist(b.pos.x, b.pos.y, enmyNineX, enmyNineY);

  //adds gravity if distance is greater than radius
  if (disOne >= 25 && disTwo >= 25 && disThree >= 25 && disFour >= 25 && disFive >= 25 && disSix >= 25 && disSeven >= 25 && disEight >= 25 && disNine >= 25 && disTen >= 25 && disEleven >=25  || b.pos.y > 500) {
    vel.add(0, .5f);
  } else {
    vel.y = 0;
    b.pos.y = 475;
  }
  b.pos.add(vel);


  //stops ball play area
  if (b.pos.x <= 125) {
    b.pos.x = 125;
  }
  if (enmyDisOne <= 25 || enmyDisTwo <= 25 || enmyDisThree <= 25|| enmyDisFour <= 25|| enmyDisFive <= 25|| enmyDisSix <= 25|| enmyDisSeven <= 25 || enmyDisEight <= 25 || enmyDisNine <= 25) {
    println(life);
    b.pos.x = 300;
    life -= 1;
    e.enemyX[0] =100;
    e.enemyX[1] =1175;
    e.enemyY[1] =0;
    e.enemyY[2] =0;
    e.enemyY[3] =0;
    e.enemyY[4] =0;
    e.enemyY[5] =0;
    translate(b.pos.x, 0);
    //e.setup();
    lvl.setup();
  }
  if (b.pos.y >= 650) {
    b.pos.x = 300;
    b.pos.y = 475;
    life -= 1;
    translate(b.pos.x + 300, 0);
    //e.setup();
    lvl.setup();
  }
}
