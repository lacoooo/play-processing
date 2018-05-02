
ArrayList<Circle> circles;
PImage img = createImage(66, 66, RGB);

void setup() {
    size(1000, 1000);
    circles = new ArrayList<Circle>();
    stroke(0);
    strokeWeight(1);
    img = loadImage("1.jpg");
    //image(img, 0, 0, 1000, 1000);
    img.loadPixels();
}

void draw() {
  
    background(255);
    int x = floor(random(width));
    int y = floor(random(height));
    boolean ok = true;
    for ( Circle c : circles ) {
        if ( dist(x, y, c.x, c. y) <= c.r ) {
            ok = false;
        }
    }
    int index = x + y * 1000;
    if ( ok && -img.pixels[index] > random(16700000) + 10000000 ) {
        circles.add( new Circle(x, y) );
    }
    
    //if (circles.size() > 50) return;

    for( Circle c : circles ) {
        c.show();
        boolean overLap = false;
        for ( Circle other : circles ) {
            if ( c == other ) continue;
            float dist = dist( c.x, c.y, other.x, other.y );
            float real = c.r + other.r;
            if ( dist < real ) {
                overLap = true;
            }
        }
        if ( overLap == false ) {
            c.grow();
        }
    }
    print(1);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("#####.png");
}
