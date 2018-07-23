

PFont myFont;
float round = 50;
float scale = 20;

void setup() {
  size(1000, 1000, P3D);
  noStroke();
  //fill(0, 255);
  smooth(8);
  //noLoop();
  background(255);
  myFont = createFont("Georgia", 100);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  fill(0, 255);
}

void draw() {
  clear();
  background(255);
  float wild = 7.2;
  for (float j = 10; j < 60; j++) {
    for (float i = round; i < round + 50; i++) {
      pushMatrix();
      float x = j * j * sin(radians(i) * wild);
      float z = j * j * cos(radians(i) * wild);
      float n = noise((x + frameCount * 10) / 2000, z / 2000, j / 20);
      x *= n;
      z *= n;
      translate(width/2 + x, j * 30 - 300, z);
      rotateY(radians(i) * wild);
      textSize(j * j / 20);
      //fill(0, z >= 0 ? 255 : 100);
      text(i, 0, 0);
      popMatrix();
    }
  }

  round += 0.04;
  camera(mouseX * 3, mouseY * 3, (height/10) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //ortho(-mouseX, mouseX, -mouseY, mouseY);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}
