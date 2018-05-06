
ArrayList<Circle> circles;
PImage img;
void setup() {
    size(800, 800, P3D);
    circles = new ArrayList<Circle>();
    stroke(20);
    fill(255);
    smooth(8);
    noLoop();
    background(0);
    img = loadImage("1.jpg");
    img.loadPixels();
}

void draw() {
    for (int i = 0; i < width; i+= 10) {
      for (int j = 0; j < height; j+= 10) {
        int index = i + j * 800;
        float Col = 16777216 / (-img.pixels[index]);
        pushMatrix();
        translate(i + ((float)Math.random() - 0.5)*10, j + ((float)Math.random() - 0.5)*10, 0);
        double ro = noise((i) / 20, (j) / 20) * 160;
        rotateX((float)ro / 200);
        rotateY((float)ro / 100);
        rotateZ((float)ro / 200);
        //strokeWeight(Col / 2);
        if (Col > 10) Col = 10;
        rect(0, 0, Col * 40, Col * 1.2);
        //box(Col * 20, Col * 1.2, Col * 1.2);
        popMatrix();
      }
    }
    saveFrame("aa.png");
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}
