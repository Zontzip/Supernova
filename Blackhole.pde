class Blackhole extends Entity
{
    float orbitDuration = 5*1000; // 5 second orbit
    float orbitRad = 50;

    Blackhole()
    {
        this.x = random(0, width);
        this.y = random(0, height);
    }

    void move()
    {

    }

    void display()
    {
        stroke(#FFFFFF);
        fill(0);

        pushMatrix();
        ellipse(x, y, 40, 40);
        translate(x, y);
        float ang = TWO_PI * millis()/orbitDuration;
        float x = cos(ang)*orbitRad;
        float y = sin(ang)*orbitRad;
        ellipse(x, y, 2, 2);
        line (x + 10, y, x + 5, y + 5);
        popMatrix();
    }
} // end class
