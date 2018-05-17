Ball b;
boolean h[] = {false, false, false, false};a

void setup() {
  size (600, 600);
  b = new Ball();
  frameRate(60);
  println(h[0]);
  println(h[1]);
  println(h[2]);
  println(h[3]);
}

void draw() {
  background(0);
  b.display();
  b.movement();
}

void keyPressed() {
  if (key == 'w') {
    h[0] = true;
  } 
  if (key == 'a') {
    h[1] = true;
  } 
  if (key == 's') {
    h[2] = true;
  } 
  if (key == 'd') {
    h[3] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    h[0] = false;
  } 
  if (key == 'a') {
    h[1] = false;
  } 
  if (key == 's') {
    h[2] = false;
  } 
  if (key == 'd') {
    h[3] = false;
  }
}


/*void checkBoundryCollision() {
 if (position.x > 0) {
 position.x = 0;
 velocity.x = 0;
 } else if (position.x < width) {
 position.x = width;
 velocity.x *= 0;
 } else if (position.y < height) {
 position.y = height;
 velocity.y *= 0;
 } else if (position.y > 0) {
 position.y = 0;
 velocity.y *= 0;
 }
 }
 */