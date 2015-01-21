class Asteroid
{
  float x, y;
  float theta;
  float lx, ly;

  float hitboxX, hitboxY, hitboxW, hitboxH;

  Asteroid()
  {
    x = width;
    y = random(0, height);
    theta = random (0, 6);
  }

  void update()
  {
    lx = sin(theta);
    ly = -cos(theta);

    x += lx;
    y += ly;
    
    hitboxX = x - 10;
    hitboxY = y - 5;
    hitboxW = hitboxX + 30;
    hitboxH = hitboxY + 25;
  }

    void move()
    {
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
      }
    }

  void display()
  {
    stroke(#C2C2D6);
    noFill();

    pushMatrix();
    line(x, y, x - 10, y + 20);
    line(x - 10, y + 20, x, y + 20);
    line(x, y + 20, x + 5, y + 15);
    line(x + 5, y + 15, x + 15, y + 20);
    line(x + 15, y + 20, x + 20, y + 20);
    line(x + 20, y + 20, x + 15, y + 10);
    line(x + 15, y + 10, x + 20, y + 20);
    line(x + 15, y + 10, x + 20, y);
    line(x + 20, y, x + 15, y - 5);
    line(x + 15, y - 5, x + 10, y);
    line(x + 10, y, x, y);
    quad(hitboxX, hitboxY, hitboxW, hitboxY, hitboxW, hitboxH, hitboxX, hitboxH);
    popMatrix();
  }

  void die()
  {
    for (int i = bullets.size() - 1; i >= 0; i--) 
    {
      Bullet bullet = (Bullet) bullets.get(i);
      
      if ( (bullet.x > x - 5 && bullet.x < x + 30) && (bullet.y > y && bullet.y < y + 30) )
      {
        println("Asteroid destroyed");
        asteroids.remove(this);
        bullets.remove(i);
        asteroids.add(new Asteroid());
        
        player = minim.loadFile("asteroid_explosion.wav", 2048);
        player.play();
      }
    } // end for()
  }
} // end class

