class Menu {

  PVector button;
  PVector[] clouds;

  Menu () {
    button = new PVector(100, 400);

    clouds = new PVector[10];

    for (int i = 0; i < clouds.length; i++) {
      float x = random(0, width);
      float y = random(0, height);
      clouds[i] = new PVector(x, y);
    }
  }

  void display() {

    background(#08CBFF);

    for (int i = 0; i < clouds.length; i++) {
      // move each cloud
      clouds[i].add(1, 0);

      // reset if they go too far
      if (clouds[i].x - 75 > width) {
        clouds[i].x = -75;
        clouds[i].y = (int) random(50, 400);
      }

      // draw each cloud
      noStroke();
      fill(255);
      ellipse(clouds[i].x, clouds[i].y, 70, 50);
      ellipse(clouds[i].x+20, clouds[i].y+15, 70, 50);
      ellipse(clouds[i].x-20, clouds[i].y+15, 70, 50);
    }
    //box
    noFill();
    stroke(0);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    strokeWeight(5);
    rect(button.x, button.y, 400, 100);

    //title
    fill(0);
    textSize(60);
    text("Oof GOT", 170, 100, 400, 500 );
    text("CAUGHT", 170, 175, 400, 500 );
    text("LACKIN", 185, 250, 400, 500 );
    textSize(48);
    text("CLICK TO START", 108, 418, 500, 100);
  }
}
