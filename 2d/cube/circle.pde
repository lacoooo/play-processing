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
        pushMatrix();
        translate(x, y, 0);
        rotateY(x / 100);
        rotateX(y / 100);
        box(r, r, r * 2);
        popMatrix();
    }

    void grow() {
        r += 0.12;
    }

}