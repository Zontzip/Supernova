class Asteroid
{
    float theta;

    float hitboxX, hitboxY, hitboxW, hitboxH;
    
    PVector location;
    PVector direction;
    
    Asteroid()
    {
        location = new PVector(width, random(0, height));
        direction = new PVector(0, 0);
        theta = random (0, 6);
    }

    void update()
    {
        direction.set(sin(theta), -cos(theta), 0);
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
        stroke(#C2C2D6);
        strokeWeight(2);
        noFill();
        
        pushMatrix();
        line(location.x, location.y, location.x - 10, location.y + 20);
        line(location.x - 10, location.y + 20, location.x, location.y + 20);
        line(location.x, location.y + 20, location.x + 5, location.y + 15);
        line(location.x + 5, location.y + 15, location.x + 15, location.y + 20);
        line(location.x + 15, location.y + 20, location.x + 20, location.y + 20);
        line(location.x + 20, location.y + 20, location.x + 15, location.y + 10);
        line(location.x + 15, location.y + 10, location.x + 20, location.y + 20);
        line(location.x + 15, location.y + 10,location. x + 20, location.y);
        line(location.x + 20, location.y, location.x + 15, location.y - 5);
        line(location.x + 15, location.y - 5, location.x + 10, location.y);
        line(location.x + 10, location.y, location.x, location.y);
        popMatrix();
    }

    void die()
    {
        hitboxX = location.x - 10;
        hitboxY = location.y - 5;
        hitboxW = hitboxX + 30;
        hitboxH = hitboxY + 25;

        for (int i = bullets.size() - 1; i >= 0; i--) {
            Bullet bullet = (Bullet) bullets.get(i);

            if ( (bullet.location.x > hitboxX && bullet.location.x < hitboxW) && (bullet.location.y > hitboxY && bullet.location.y < hitboxH) ) {
                println("Asteroid destroyed");
                asteroids.remove(this);
                bullets.remove(i);
                
                asteroids.add(new Asteroid());
                
                // add more asteroids based on score
                int rand = int(random(0, 100));
                if (score > 200 && rand % 7 == 0) {
                    asteroids.add(new Asteroid());
                }
                
                player = sfx.loadFile("asteroid_explosion.wav", 2048);
                player.play();
                
                if (bullet.colour == #CE0C0C) {
                    score += 10;
                }
                
                println("Score: " + score);
            }
        } 
    }
} // end class

