class Blackhole extends Entity
{
    float orbitDuration = 5*1000; // 5 second orbit
    float orbitRad = 50;
    
    PVector location;

    Blackhole()
    {
        location = new PVector(random(0, width), random(0, height) );
    }

    void move()
    {

    }

    void display()
    {
        stroke(#FFFFFF);
        fill(0);

        pushMatrix();
        ellipse(location.x, location.y, 40, 40);
        translate(location.x, location.y);
        float ang = TWO_PI * millis()/orbitDuration;
        float x = cos(ang)*orbitRad;
        float y = sin(ang)*orbitRad;
        ellipse(location.x, location.y, 2, 2);
        line (location.x + 10, location.y, location.x + 5, location.y + 5);
        popMatrix();
    }
} // end class
