
ArrayList<Circle> circles;
PImage img = createImage(66, 66, RGB);

void setup() {
    size(800, 800, P3D);
    circles = new ArrayList<Circle>();
    stroke(0);
    img = loadImage("1.jpg");
    //image(img, 0, 0, 1000, 1000);
    img.loadPixels();
}

void draw() {
  
    background(255);
    lights();
    for (int i = 0; i < 80; i ++) {
      int x = floor(random(width));
      int y = floor(random(height));
      boolean ok = true;
      for ( Circle c : circles ) {
          if ( dist(x, y, c.x, c. y) <= c.r ) {
              ok = false;
          }
      }
      int index = x + y * 800;
          if ( ok && -img.pixels[index] > random(16700000) + 9000000 ) {
            circles.add( new Circle(x, y) );
        }
    }

    //if (circles.size() > 50) return;

    for( Circle c : circles ) {
        c.show();
        boolean overLap = false;
        for ( Circle other : circles ) {
            if ( c == other ) continue;
            float dist = dist( c.x, c.y, other.x, other.y );
            float real = c.r + other.r;
            if ( dist < real && real > 0 ) {
                overLap = true;
            }
        }
        if ( overLap == false ) {
            c.grow();
        }
    }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}