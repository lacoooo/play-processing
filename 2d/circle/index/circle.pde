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
        noFill();
        ellipse(x, y, r * 2, r * 2);
    }

    void grow() {
        r += 0.002;
    }

}
