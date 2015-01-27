class Explosion extends Entity
{
    int savedTime;
    int totalTime = 5000;
    
    Explosion(float x, float y)
    {
        location = new PVector(x, y);
        direction = new PVector(0, 0);
        
        theta = random (0, 6);
        
        savedTime = millis();
    }
    
    void update()
    {
        direction.set(sin(theta), -cos(theta));
        location.add(direction);
        
        int passedTime = millis() - savedTime;
        if (passedTime > totalTime) {
            gameState = GAME_OVER;
        }
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
        stroke(#4C341C);
        fill(#FFAD5C);
        
        beginShape();
        vertex(location.x + 0, location.y - 10);
        vertex(location.x + 10, location.y - 10);
        vertex(location.x + 10, location.y - 5);
        vertex(location.x + 20, location.y - 5);
        vertex(location.x + 20, location.y + 0);
        vertex(location.x + 10, location.y + 0);
        vertex(location.x + 10, location.y + 10);
        vertex(location.x + 5, location.y + 10);
        vertex(location.x + 5, location.y + 5);
        vertex(location.x + 0, location.y + 5);
        vertex(location.x + 0, location.y + 10);
        vertex(location.x - 5, location.y + 10);
        vertex(location.x - 5, location.y + 0);
        vertex(location.x - 10, location.y + 0);
        vertex(location.x - 10, location.y - 5);
        vertex(location.x + 0, location.y - 5);
        endShape();
    }
}
