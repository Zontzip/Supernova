class Ship extends Entity
{
  float w, h;
  float speed;
  
  float halfWidth;
  float halfHeight;

  // firerate variables
  float timeDelta = 1.0f/60.0f;
  float fireRate = 5.0f;
  float ellapsed = 0.0f;
  float toPass = 1.0f/fireRate;
  
  int health;
  
  float lx, ly;
  
  float hitboxX, hitboxY, hitboxW, hitboxH;

  Ship(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.x += 10;
    this.y += 10;
    
    h = 20;
    w = 20;
    halfWidth = w / 2;
    halfHeight = h / 2;
    
    colour = color(255);
    
    theta = 0;
    
    health = 10;
  }
  
  void update()
  {
    ellapsed += timeDelta;
    speed = 5;
    
    lx = sin(theta);
    ly = -cos(theta);
    
    hitboxX = x - 10;
    hitboxY = y - 10;
    hitboxW = hitboxX + 20;
    hitboxH = hitboxY + 20;
  }
  
  void move()
  {
    if (keyPressed)
    {
      switch (key)
      {
      case 'w':
        x += lx * speed;
        y += ly * speed;
        break;
      case 's':
        y = y + speed;
        break;
      case 'a':
        theta -= 0.15f;
        break;
      case 'd':
        theta += 0.15f;
        break;  
      case ' ':
        if (ellapsed > toPass) {
          // Generate new bullet
          bullets.add(new Bullet(x, y, theta, 5000, #CE0C0C));
          ellapsed = 0.0f;
          // Sound effect
          player = minim.loadFile("ship_laser.wav", 2048);
          player.play();
        }
      } // end switch()
    
    // Screen boundry
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
      } // end if()
    } // end keypressed 
  } // end move()

  void display()
  {
    stroke(colour);
    
    // Ship
    pushMatrix();
    translate(x, y);   
    rotate(theta);
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth, halfHeight, 0, 0);
    line(0, 0, - halfWidth, halfHeight);
    popMatrix();
    
    //rect(hitboxX, hitboxY, 20, 20);
  }
  
  void die()
  {
    for (int i = 0; i < asteroids.size(); i++) 
    {
      Asteroid asteroid = (Asteroid) asteroids.get(i);
      
      if ( (asteroid.hitboxW > hitboxX) && (asteroid.hitboxX < hitboxW) && (asteroid.hitboxH > hitboxY) && (asteroid.hitboxY < hitboxH) ) 
      {
        asteroids.remove(i);
        health--;
        asteroids.add(new Asteroid());
        //objects.add(new Shield(x, y));
        // Sound effect
        player = minim.loadFile("ship_explosion.wav", 2048);
        player.play();
         
        println("Ship damaged");
        println("Health: " + health);
      } // end if()
    } // end for()
  }
} // end class

