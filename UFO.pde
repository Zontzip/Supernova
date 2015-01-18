class UFO extends Entity 
{
  // firerate variables
  float timeDelta = 1.0f/60.0f;
  float fireRate = .5f;
  float ellapsed = 0.0f;
  float toPass = 1.0f/fireRate;
  
  UFO() 
  {
    this.x = random(0, width);
    this.y = random(0, height);
    this.theta = random (0, 6); 
  }
  
  void move()
  {
    ellapsed += timeDelta;
    
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    
    x += lx;
    y += ly;
    
    if (x < 0) {
      x = width; 
      theta = random (0, 6);
    }
    if (x > width) {
      x = 0; 
      theta = random (0, 6);
    }
    if (y < 0) {
      y = height; 
      theta = random (0, 6);
    }
    if (y > height) {
      y = 0; 
      theta = random (0, 6);
    }
  }
  
  void shoot() 
  {
    if (ellapsed > toPass) {
        // Sound effect
        player = minim.loadFile("ufo_laser.wav", 2048);
        player.play();
        // Generate new bullet with random trajectory
        float thetaRandom = random (0, 6);
        bullets.add(new Bullet(x, y, thetaRandom, 1000, #F2FA14));
        ellapsed = 0.0f;
      }
  }
    
  void display()
  {
    stroke(#33CC33);
    fill(0);
    
    pushMatrix();
    ellipse(x, y, 60, 20);
    line(x - 15, y + 10, x - 20, y + 25);
    line(x + 15, y + 10, x + 20, y + 25);
    bezier(x - 10, y - 10, x - 10, y - 50, x + 10, y - 50, x + 10, y - 10);
    popMatrix();
  }
  
  void die()
  {
    for (int i = 0; i < bullets.size(); i++) 
    {
      Bullet bullet = (Bullet) bullets.get(i);
      // Check x, y coordinate and colour
      if ( (bullet.x > x - 30 && bullet.x < x + 30) && (bullet.y > y - 30 && bullet.y < y + 20) && (bullet.colour == #CE0C0C) ) 
      {
         println("UFO destroyed");
         objects.remove(this);
         bullets.remove(i);
         //objects.add(new Shieldedsd(x, y));
         // Sound effect
         player = minim.loadFile("ufo_explosion.wav", 2048);
         player.play();
      }
    } // end for()
  }
} // end class
