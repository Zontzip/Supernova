class Planet extends Entity 
{ 
    float hitboxX, hitboxY, hitboxW, hitboxH;

    int health;

    Planet()
    {
        this.x = width/2;
        this.y = height/2;

        health = 2;
    }

    void display()
    {
        stroke(#70EDF7);
        fill(#2BA6DE);
        ellipse(x, y, 100, 100);

        // Left continent
        beginShape();
        fill(#007A29);
        curveVertex(x - 10, y - 45);
        curveVertex(x - 10, y - 45);
        curveVertex(x - 5, y - 35);
        curveVertex(x - 10, y - 20);
        curveVertex(x - 15, y - 10);
        curveVertex(x - 15, y);
        curveVertex(x - 15, y + 10);
        curveVertex(x - 15, y + 20);
        curveVertex(x - 20, y + 30);
        curveVertex(x - 30, y + 30);
        curveVertex(x - 40, y + 10);
        curveVertex(x - 45, y - 10);
        curveVertex(x - 35, y - 25);
        curveVertex(x - 25, y - 40);
        curveVertex(x - 10, y - 45);
        curveVertex(x - 10, y - 45);
        endShape();

        // Right Continent
        beginShape();
        fill(#007A29);
        curveVertex(x + 20, y - 30);
        curveVertex(x + 20, y - 30);
        curveVertex(x + 25, y - 25);
        curveVertex(x + 30, y - 20);
        curveVertex(x + 35, y - 10);
        curveVertex(x + 35, y);
        curveVertex(x + 30, y + 5);
        curveVertex(x + 20, y + 10);
        curveVertex(x + 15, y + 5);
        curveVertex(x + 15, y - 5);
        curveVertex(x + 10, y - 20);
        curveVertex(x + 10, y - 30);
        curveVertex(x + 20, y - 30);
        curveVertex(x + 20, y - 30);
        endShape();

        // Antarctic circle
        beginShape();
        fill(#FFFFFF);
        curveVertex(x - 5, y + 35);
        curveVertex(x - 5, y + 35);
        curveVertex(x + 5, y + 38);
        curveVertex(x + 15, y + 35);
        curveVertex(x + 18, y + 40);
        curveVertex(x + 10, y + 45);
        curveVertex(x + 5, y + 48);
        curveVertex(x - 5, y + 45);
        curveVertex(x - 15, y + 40);
        curveVertex(x - 5, y + 35);
        curveVertex(x - 5, y + 35);
        endShape();
    }

    void die()
    {
        hitboxX = x - 40;
        hitboxY = y - 40;
        hitboxW = x + 40;
        hitboxH = y + 40;

        if (health == 0) {
            for (int i = 0; i < 5; i ++) {
                objects.add(new Explosion(x, y));
            }
            objects.remove(this);
        }

        for (int i = 0; i < asteroids.size(); i++) {
            Asteroid asteroid = (Asteroid) asteroids.get(i);

            if ( (asteroid.hitboxW > hitboxX) && (asteroid.hitboxX < hitboxW) && (asteroid.hitboxH > hitboxY) && (asteroid.hitboxY < hitboxH) ) {
                asteroids.remove(i);
                asteroids.add(new Asteroid());
                
                health--;

                // generate new impact site
                objects.add(new EarthDamage(x, y));

                // sound effect
                player = sfx.loadFile("earth_explosion.wav", 2048);
                player.play();

                println("Earth hit");
                println("Earth health: " + health);
            } 
        }
    } // end die()
} // end class
