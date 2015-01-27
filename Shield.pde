class Shield extends Entity
{
    boolean pickup;
    boolean alive;

    float hitboxX, hitboxY, hitboxW, hitboxH;

    int health;
    
    PVector location;
    PVector direction;

    Shield(float x, float y, color colour) 
    {
        location = new PVector(x, y);
        direction = new PVector(0, 0);
        
        this.colour = colour;
        health = 10;
        pickup = false;
    }

    void update()
    {
        hitboxX = location.x - 25;
        hitboxY = location.y - 25;
        hitboxW = location.x + 25;
        hitboxH = location.y + 25;
    }

    void move()
    {
        // ship has not aquired shield
        if (pickup == false) {
            for (int i = ships.size() - 1; i >= 0; i--) {
                Ship ship = (Ship) ships.get(i);

                if ( (ship.location.x > hitboxX && ship.location.x < hitboxW) && (ship.location.y > hitboxY && ship.location.y < hitboxH) ) {
                    println("Shield activated");
                    ufos.add(new UFO());
                    
                    // play sound
                    player = sfx.loadFile("shield_pickup.wav", 2048);
                    player.play();

                    pickup = true;
                }
            } // end for()
        } // end if()

        // ship has aquired shield
        if (pickup == true) {
            for (int i = 0; i < ships.size(); i++) 
            {
                Ship ship = (Ship) ships.get(i);

                location.x = ship.location.x;
                location.y = ship.location.y;
            }
        }
    } // end move()

    void display()
    {
        noFill();
        stroke(colour);

        if (pickup == false) {
            fill(#99FF99,127);
            ellipse(location.x, location.y, 30, 30);
        }

        if (pickup == true) {
            fill(#99FF99,127);
            
            Ship ship = ships.get(0);

            pushMatrix();
            translate(location.x, location.y);   
            rotate(ship.theta);
            ellipse(0, 7, 40, 60);
            popMatrix();
        }
    }

    void die()
    {
        if (pickup == true) 
        {
            if (health == 0)
            {
                alive = false;
                shields.remove(this);
            }

            for (int i = 0; i < asteroids.size(); i++) {
                Asteroid asteroid = (Asteroid) asteroids.get(i);

                if ( (asteroid.hitboxW > hitboxX) && (asteroid.hitboxX < hitboxW) && (asteroid.hitboxH > hitboxY) && (asteroid.hitboxY < hitboxH) ) {
                    asteroids.remove(i);
                    health--;
                    asteroids.add(new Asteroid());
                    // sound effect
                    player = sfx.loadFile("shield_explosion.wav", 2048);
                    player.play();

                    println("Shield damaged");
                    println("Shield health: " + health);
                } // end if()
            } // end for()


            for (int i = 0; i < bullets.size(); i++) 
            {
                Bullet bullet = (Bullet) bullets.get(i);

                if ( (bullet.location.x > hitboxX && bullet.location.x < hitboxW) && (bullet.location.y > hitboxY && bullet.location.y < hitboxH) && (bullet.colour != #CE0C0C) ) {
                    bullets.remove(i);
                    health--;
                    asteroids.add(new Asteroid());
                    // sound effect
                    player = sfx.loadFile("shield_explosion.wav", 2048);
                    player.play();

                    println("Shield damaged");
                    println("Shield health: " + health);
                } // end if()
            } // end for()
        } // end if()
    } // end die()
} // end shield
