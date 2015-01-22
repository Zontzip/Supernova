class Bullet
{
    float x, y;
    float theta;
    float lx, ly;
    float speed;

    int alive = millis();
    int lifeSpan;
    color colour;

    Bullet(float x, float y, float theta, int lifeSpan, color colour)
    {
        this.x = x;
        this.y = y;
        this.theta = theta;
        this.lifeSpan = lifeSpan;
        this.colour = colour;
    }

    void update() 
    {
        lx = sin(theta);
        ly = -cos(theta);
        speed = 10.0f;
        x += lx * speed;
        y += ly * speed;
    }

    void move()
    {
        if (x < 0) {
            x = width; 
          }
        if (x > width) {
            x = 0; 
        }
        if (y < 0) {
          y = height; 
        }
        if (y > height) {
          y = 0; 
        }
    }

    void display()
    {
        stroke(colour);
        
        pushMatrix();
        translate(x, y);
        rotate(theta);
        line(0, 5, 0, -5);
        popMatrix();
    }

    void die() 
    {
        if (millis() - alive >= lifeSpan) {
            println("Laser offline");
            bullets.remove(this);
            alive = millis();
        }
    }
} // end class
