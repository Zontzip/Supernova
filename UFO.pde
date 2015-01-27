class UFO extends Entity 
{
    // firerate variables
    float timeDelta = 1.0f/60.0f;
    float fireRate = 2.0f;
    float ellapsed = 0.0f;
    float toPass = 1.0f/fireRate;

    UFO() 
    {
        location = new PVector(random(0, width), random(0, height));
        direction = new PVector(0, 0);
        
        this.theta = random (0, 6); 
    }

    void update()
    {
        ellapsed += timeDelta;

        direction.set(sin(theta), -cos(theta));
        location.add(direction);

        hitboxX = location.x - 30;
        hitboxY = location.y - 40;
        hitboxW = location.x + 30;
        hitboxH = location.y + 30;
    }

    void move()
    {
        if (location.x < 0) {
            location.x = width; 
            theta = random (0, 6);
        }
        if (location.x > width) {
            location.x = 0; 
            theta = random (0, 6);
        }
        if (location.y < 0) {
            location.y = height; 
            theta = random (0, 6);
        }
        if (location.y > height) {
            location.y = 0; 
            theta = random (0, 6);
        }
    }

    void shoot() 
    {
        if (ellapsed > toPass) {
            // sound effect
            player = sfx.loadFile("ufo_laser.wav", 2048);
            player.play();
            // generate new bullet with random trajectory
            float thetaRandom = random (0, 6);
            bullets.add(new Bullet(location.x, location.y, thetaRandom, 1000, 0, 10.0f, #F2FA14));
            ellapsed = 0.0f;
        }
    }

    void display()
    {
        stroke(#33CC33);
        fill(#85FFFF);

        pushMatrix();
        ellipse(location.x, location.y, 60, 20);
        line(location.x - 15, location.y + 10, location.x - 20, location.y + 25);
        line(location.x + 15, location.y + 10, location.x + 20, location.y + 25);
        bezier(location.x - 10, location.y - 10, location.x - 10, location.y - 50, location.x + 10, location.y - 50, location.x + 10, location.y - 10);
        popMatrix();
    }

    void die()
    {
        for (int i = 0; i < bullets.size(); i++) {
            Bullet bullet = (Bullet) bullets.get(i);
            // check x, y coordinate and colour
            if ( (bullet.location.x > hitboxX && bullet.location.x < hitboxW) && (bullet.location.y > hitboxY && bullet.location.y < hitboxH) && (bullet.colour == #CE0C0C) ) {
                println("UFO destroyed");
                ufos.remove(this);
                bullets.remove(i);
                
                score += 50;    
                powerUp();
                // sound effect
                player = sfx.loadFile("ufo_explosion.wav", 2048);
                player.play();
            }
        } // end for()
    }
    
    void powerUp() 
    {
        int randNum = int(random(0, 10));
        
        // add shield or powerup
        if (randNum % 2 == 0) {
            shields.add(new Shield(location.x, location.y, #00FF00));
        } else {
            Ship ship = ships.get(0);
            ship.powerUp = true;
        }
        ufos.add(new UFO());
    }
}
