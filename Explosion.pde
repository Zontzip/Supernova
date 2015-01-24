class Explosion extends Entity
{
    float randX, randY;

    Explosion(float x, float y)
    {
        this.x = x;
        this.y = y;
        theta = random (0, 6);
    }
    
    void update()
    {
        lx = sin(theta);
        ly = -cos(theta);

        x += lx;
        y += ly;
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
        stroke(#4C341C);
        fill(#FFAD5C);
        
        beginShape();
        vertex(x + 0, y - 10);
        vertex(x + 10, y - 10);
        vertex(x + 10, y - 5);
        vertex(x + 20, y - 5);
        vertex(x + 20, y + 0);
        vertex(x + 10, y + 0);
        vertex(x + 10, y + 10);
        vertex(x + 5, y + 10);
        vertex(x + 5, y + 5);
        vertex(x + 0, y + 5);
        vertex(x + 0, y + 10);
        vertex(x - 5, y + 10);
        vertex(x - 5, y + 0);
        vertex(x - 10, y + 0);
        vertex(x - 10, y - 5);
        vertex(x + 0, y - 5);
        endShape();
    }
}
