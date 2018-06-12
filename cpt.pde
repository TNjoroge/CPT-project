Ball b;
Level lvl;
Enemy e;
boolean move[] = {false, false, false, false};
float screen;
PVector vel;
void setup() {
  size (600, 600);
  b = new Ball();
  lvl = new Level();
  frameRate(60);
  screen = b.pos.x;
  vel = new PVector(0, 0);
}

void draw() {
  if (b.pos.x > screen) {
    screen = b.pos.x;
  }


  b.movement();
  b.collision();
  translate(-screen + 300, 0);
  background(0);
  b.display();
  lvl.display();
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
