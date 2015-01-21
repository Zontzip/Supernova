class UFO extends Entity 
{
  // firerate variables
  float timeDelta = 1.0f/60.0f;
  float fireRate = .5f;
  float ellapsed = 0.0f;
  float toPass = 1.0f/fireRate;
  
  float lx, ly;
  float hitboxX, hitboxY, hitboxW, hitboxH;
  
  UFO() 
  {
    this.x = random(0, width);
    this.y = random(0, height);
    this.theta = random (0, 6); 
  }
  
  void update()
  {
    ellapsed += timeDelta;
   
    lx = sin(theta);
    ly = -cos(theta);
    
    hitboxX = x - 30;
    hitboxY = y - 40;
    hitboxW = x + 30;
    hitboxH = y + 30;
    
    x += lx;
    y += ly;
  }
  
  void move()
  {
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
        player = sfx.loadFile("ufo_laser.wav", 2048);
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
    noFill();
    
    pushMatrix();
    ellipse(x, y, 60, 20);
    line(x - 15, y + 10, x - 20, y + 25);
    line(x + 15, y + 10, x + 20, y + 25);
    bezier(x - 10, y - 10, x - 10, y - 50, x + 10, y - 50, x + 10, y - 10);
    rect(hitboxX, hitboxY, 60, 60);
    popMatrix();
  }
  
  void die()
  {
    for (int i = 0; i < bullets.size(); i++) 
    {
      Bullet bullet = (Bullet) bullets.get(i);
      // Check x, y coordinate and colour
      if ( (bullet.x > hitboxX && bullet.x < hitboxW) && (bullet.y > hitboxY && bullet.y < hitboxH) && (bullet.colour == #CE0C0C) ) 
      {
         println("UFO destroyed");
         ufos.remove(this);
         bullets.remove(i);
         objects.add(new Shield(x, y, #00FF00));
         // Sound effect
         player = sfx.loadFile("ufo_explosion.wav", 2048);
         player.play();
      }
    } // end for()
  }
} // end class
