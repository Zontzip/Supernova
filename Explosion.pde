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
        stroke(#FF7373);
        
        pushMatrix();
        line(x, y, x - 10, y + 20);
        line(x - 10, y + 20, x, y + 20);
        line(x, y + 20, x + 5, y + 15);
        line(x + 5, y + 15, x + 15, y + 20);
        line(x + 15, y + 20, x + 20, y + 20);
        line(x + 20, y + 20, x + 15, y + 10);
        line(x + 15, y + 10, x + 20, y + 20);
        line(x + 15, y + 10, x + 20, y);
        line(x + 20, y, x + 15, y - 5);
        line(x + 15, y - 5, x + 10, y);
        line(x + 10, y, x, y);
        popMatrix();
    }
}
