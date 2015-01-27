class Bullet
{
    float theta;
    float speed;

    int alive = millis();
    int lifeSpan;
    int offset;
    color colour;
    
    PVector location;
    PVector direction;

    Bullet(float x, float y, float theta, int lifeSpan, int offset, color colour)
    {
        location = new PVector(x += offset, y);
        direction = new PVector(0, 0);
        
        this.theta = theta;
        this.lifeSpan = lifeSpan;
        this.offset = offset;
        this.colour = colour;
        
        speed = 10.0f;
    }

    void update() 
    {
        direction.set(sin(theta) * speed, -cos(theta) * speed);
        location.add(direction);
    }

    void move()
    {
        if (location.x < 0) {
            location.x = width; 
          }
        if (location.x > width) {
            location.x = 0; 
        }
        if (location.y < 0) {
          location.y = height; 
        }
        if (location.y > height) {
          location.y = 0; 
        }
    }

    void display()
    {
        stroke(colour);
        strokeWeight(2);
        
        pushMatrix();
        translate(location.x, location.y);
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
