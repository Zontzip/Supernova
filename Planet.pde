class Planet extends Entity 
{ 
    Planet()
    {
        location = new PVector(width/2, height/2);

        health = 2;
    }

    void display()
    {
        stroke(#70EDF7);
        fill(#2BA6DE);
        ellipse(location.x, location.y, 100, 100);

        // Left continent
        beginShape();
        fill(#007A29);
        curveVertex(location.x - 10, location.y - 45);
        curveVertex(location.x - 10, location.y - 45);
        curveVertex(location.x - 5, location.y - 35);
        curveVertex(location.x - 10, location.y - 20);
        curveVertex(location.x - 15, location.y - 10);
        curveVertex(location.x - 15, location.y);
        curveVertex(location.x - 15, location.y + 10);
        curveVertex(location.x - 15, location.y + 20);
        curveVertex(location.x - 20, location.y + 30);
        curveVertex(location.x - 30, location.y + 30);
        curveVertex(location.x - 40, location.y + 10);
        curveVertex(location.x - 45, location.y - 10);
        curveVertex(location.x - 35, location.y - 25);
        curveVertex(location.x - 25, location.y - 40);
        curveVertex(location.x - 10, location.y - 45);
        curveVertex(location.x - 10, location.y - 45);
        endShape();

        // Right Continent
        beginShape();
        fill(#007A29);
        curveVertex(location.x + 20, location.y - 30);
        curveVertex(location.x + 20, location.y - 30);
        curveVertex(location.x + 25, location.y - 25);
        curveVertex(location.x + 30, location.y - 20);
        curveVertex(location.x + 35, location.y - 10);
        curveVertex(location.x + 35, location.y);
        curveVertex(location.x + 30, location.y + 5);
        curveVertex(location.x + 20, location.y + 10);
        curveVertex(location.x + 15, location.y + 5);
        curveVertex(location.x + 15, location.y - 5);
        curveVertex(location.x + 10, location.y - 20);
        curveVertex(location.x + 10, location.y - 30);
        curveVertex(location.x + 20, location.y - 30);
        curveVertex(location.x + 20, location.y - 30);
        endShape();

        // Antarctic circle
        beginShape();
        fill(#FFFFFF);
        curveVertex(location.x - 5, location.y + 35);
        curveVertex(location.x - 5, location.y + 35);
        curveVertex(location.x + 5, location.y + 38);
        curveVertex(location.x + 15, location.y + 35);
        curveVertex(location.x + 18, location.y + 40);
        curveVertex(location.x + 10, location.y + 45);
        curveVertex(location.x + 5, location.y + 48);
        curveVertex(location.x - 5, location.y + 45);
        curveVertex(location.x - 15, location.y + 40);
        curveVertex(location.x - 5, location.y + 35);
        curveVertex(location.x - 5, location.y + 35);
        endShape();
    }

    void die()
    {
        hitboxX = location.x - 40;
        hitboxY = location.y - 40;
        hitboxW = location.x + 40;
        hitboxH = location.y + 40;

        if (health == 0) {
            // remove Earth damage
            for (int i = damages.size() - 1; i >= 0; i --) {
                damages.remove(i);
            }
            // add explosions
            for (int i = 0; i < 5; i ++) {
                objects.add(new Explosion(location.x, location.y));
            }
            objects.remove(this);
        }

        for (int i = 0; i < asteroids.size(); i++) {
            Asteroid asteroid = (Asteroid) asteroids.get(i);

            if ( (asteroid.hitboxW > hitboxX) && (asteroid.hitboxX < hitboxW) && (asteroid.hitboxH > hitboxY) && (asteroid.hitboxY < hitboxH) ) {
                asteroids.remove(i);
                asteroids.add(new Asteroid());
                
                // reduce Earth health
                health--;

                // generate new impact site
                damages.add(new EarthDamage(location.x, location.y));

                // sound effect
                player = sfx.loadFile("earth_explosion.wav", 2048);
                player.play();

                println("Earth hit");
                println("Earth health: " + health);
            } 
        }
    } // end die()
} // end class
