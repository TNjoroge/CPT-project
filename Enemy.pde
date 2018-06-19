class Enemy {
  float enemyX[] = {100, 1175, 2075, 2275, 2475, 2675, 2875, 3800, 4250};
  float enemyY[] = {465, 0, 0, 0, 0, 0, 0, 100}; 
  float speedX[] ={2, 3, 6};
  float speedY[] ={4, 7, 3, 7, 4};

  //setup used to reset values
  public void setup() {
    enemyX[0] = 100;
    enemyX[1] = 1175;
    enemyX[2] = 2075;
    enemyX[3] = 2275;
    enemyX[4] = 2475;
    enemyX[5] = 2675;
    enemyX[6] = 2875;
    enemyX[7] = 3800;
    enemyX[8] = 4250;
    enemyY[0] = 465;
    enemyY[1] = 0;
    enemyY[2] = 0;
    enemyY[3] = 0;
    enemyY[4] = 0;
    enemyY[5] = 0;
    enemyY[6] = 0;
    enemyY[7] = 100;
  }

  public void display() {
    //draws enemies
    noStroke();
    fill(255, 0, 0);
    rect(enemyX[1], enemyY[0], 35, 35);
    rect(enemyX[0], enemyY[0], 35, 35);
    rect(enemyX[2], enemyY[1], 75, 75);
    rect(enemyX[3], enemyY[2], 75, 75);
    rect(enemyX[4], enemyY[3], 75, 75);
    rect(enemyX[5], enemyY[4], 75, 75);
    rect(enemyX[6], enemyY[5], 75, 75);
    rect(enemyX[7], enemyY[0], 40, 40);
    rect(enemyX[8], enemyY[7], 50, 50);
  }

  //enmy movement
  public void movement () {
    enemyX[0]+= speedX[0];
    if (enemyX[0] >= 570||enemyX[0] <= 100) {
      speedX[0] = -speedX[0];
      enemyX[0] += speedX[0];
    }
    enemyX[1]+= speedX[1];
    if (enemyX[1] >= 1175||enemyX[1] <= 700) {
      speedX[1] = -speedX[1];
      enemyX[1] += speedX[1];
    }
    enemyY[1]+= speedY[0];
    if (enemyY[1] >= 425||enemyY[1] <= 0) {
      speedY[0] = -speedY[0];
      enemyY[1] += speedY[0];
    }
    enemyY[2]+= speedY[1];
    if (enemyY[2] >= 425||enemyY[2] <= 0) {
      speedY[1] = -speedY[1];
      enemyY[2] += speedY[1];
    }
    enemyY[3]+= speedY[2];
    if (enemyY[3] >= 425||enemyY[3] <= 0) {
      speedY[2] = -speedY[2];
      enemyY[3] += speedY[2];
    }
    enemyY[4]+= speedY[3];
    if (enemyY[4] >= 425||enemyY[4] <= 0) {
      speedY[3] = -speedY[3];
      enemyY[4] += speedY[3];
    }
    enemyY[5]+= speedY[4];
    if (enemyY[5] >= 425||enemyY[5] <= 0) {
      speedY[4] = -speedY[4];
      enemyY[5] += speedY[4];
    }
    enemyX[7]+= speedX[2];
    if (enemyX[7] <= 3075||enemyX[7] >= 3900) {
      speedX[2] = -speedX[2];
      enemyX[7] += speedX[2];
    }
  }
}
