class Circle {

    float x;
    float y;
    float r;

    Circle(float _x, float _y) {
        x = _x;
        y = _y;
        r = 0;
    }

    void show() {
        lights();
        pushMatrix();
        //fill(0);
        translate(x, y, 0);
        rotateY(x / 100);
        rotateX(y / 300);
        box(r, r, r * 2);
        popMatrix();
    }

    void grow() {
        r += 0.05;
    }

}