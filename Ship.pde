class Ship extends Entity
{
    float speed;

    // firerate variables
    float timeDelta = 1.0f/60.0f;
    float fireRate = 5.0f;
    float ellapsed = 0.0f;
    float toPass = 1.0f/fireRate;

    int health;
    
    boolean move; 
    boolean powerUp;
    boolean shielded;

    Ship(float x, float y)
    {
        location = new PVector(x, y);
        direction = new PVector(0, 0);

        colour = color(255);
        theta = 0;
        health = 3;
        move = false;
        powerUp = false;
        shielded = false;
        speed = 5.0f;
    }

    void update()
    {
        ellapsed += timeDelta;
        
        direction.set(sin(theta) * speed, -cos(theta) * speed);

        hitboxX = location.x - 10;
        hitboxY = location.y - 10;
        hitboxW = hitboxX + 20;
        hitboxH = hitboxY + 20;
        
        move = false;
    }

    void move()
    {
        if (keyPressed) {
            switch (key) {
                case 'w':
                    location.add(direction);
                    move = true;
                    break;
                case 's':
                    location.y = location.y + speed;
                    break;
                case 'a':
                    theta -= 0.15f;
                    break;
                case 'd':
                    theta += 0.15f;
                    break;  
                case ' ':
                    if (ellapsed > toPass) {
                        // generate new bullet
                        if (powerUp == true) {
                            bullets.add(new Bullet(location.x, location.y, theta, 10000, 16, #66FF66));
                        }
                        bullets.add(new Bullet(location.x, location.y, theta, 5000, 0, #CE0C0C));
                        // set bullet timer
                        ellapsed = 0.0f;
                        // sound effect
                        player = sfx.loadFile("ship_laser.wav", 2048);
                        player.play();
                    }
              } // end switch()

            // screen boundraies
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
            } // end if()
        } // end keypressed 
    } // end move()

    void display()
    {
        pushMatrix();
        
        translate(location.x, location.y);   
        rotate(theta);
        
        // Ship
        stroke(#000000);
        strokeWeight(1);
        // hull
	fill(#FFFF66);
        beginShape();
	curveVertex(0, - 20);
	curveVertex(0, - 20);
	curveVertex(8, - 10);
	curveVertex(10, 0);
	curveVertex(8, 10);
	curveVertex(5, 20);
	curveVertex(- 5, 20);
	curveVertex(- 8, 10);
	curveVertex(- 10, 0);
	curveVertex(- 8, - 10);
	curveVertex(0, - 20);
	curveVertex(0, - 20);
	endShape();

		// windows
	fill(#33CCFF);
        ellipse(0, 0, 5, 5);
	ellipse(0, 0 - 8, 5, 5);
	ellipse(0, 0 + 8, 5, 5);

	// left wing
	fill(#FF5050);
        beginShape();
	curveVertex(- 8, 10);
	curveVertex(- 8, 10);
	curveVertex(- 13, 20);
	curveVertex(- 15, 30);
	curveVertex(- 10, 25);
	curveVertex(- 5, 20);
	curveVertex(- 8, 10);
	curveVertex(- 8, 10);
	endShape();

	// right wing
	beginShape();
	curveVertex(8, 10);
	curveVertex(8, 10);
	curveVertex(13, 20);
	curveVertex(15, 30);
	curveVertex(10, 25);
	curveVertex(5, 20);
	curveVertex(8, 10);
	curveVertex(8, 10);
	endShape();
        
        if (move == true) { 
            fill(#FFA971);
            beginShape();
            curveVertex(- 5, 20);
            curveVertex(- 5, 20);
            curveVertex(0, 30);
            curveVertex(5, 20);
            curveVertex(5, 20);
            endShape();
        }
        
        if (powerUp == true) {
            // right power
            fill(#33CC33);
            beginShape();
            vertex(10, -5);
            vertex(12, -5);
            vertex(12, -10);
            vertex(18, -10);
            vertex(18, 5);
            vertex(12, 5);
            vertex(12, 0);
            vertex(10, 0);
            endShape();
        }

        popMatrix();
    }

    void die()
    {
        if (health == 0) {
            ships.remove(this);
            println("Ship destroyed");
            gameState = GAME_OVER;
        }

        // asteroid collision
        for (int i = 0; i < asteroids.size(); i++) {
            Asteroid asteroid = (Asteroid) asteroids.get(i);

            if ( (asteroid.hitboxW > hitboxX) && (asteroid.hitboxX < hitboxW) && (asteroid.hitboxH > hitboxY) && (asteroid.hitboxY < hitboxH) ) {
                health--;
                asteroids.remove(i);
                asteroids.add(new Asteroid());
                // sound effect
                player = sfx.loadFile("ship_explosion.wav", 2048);
                player.play();
                println("Ship damaged");
                println("Health: " + health);
            } // end if()
        } // end for()

        // bullet collision
        for (int i = 0; i < bullets.size(); i++) 
        {
            Bullet bullet = (Bullet) bullets.get(i);
            // check x, y coordinate and colour
            if ( (bullet.location.x > hitboxX && bullet.location.x < hitboxW) && (bullet.location.y > hitboxY && bullet.location.y < hitboxH) && (bullet.colour == #F2FA14) ) {
                health--;
                bullets.remove(i);
                // sound effect
                player = sfx.loadFile("ship_explosion.wav", 2048);
                player.play();
                println("Ship damaged");
                println("Health: " + health);
            }
        }
    } // end die()
} // end class

