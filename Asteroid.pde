class Asteroid extends Entity
{
  Asteroid()
  {
    this.x = width;
    this.y = random(0, height);
    this.theta = random (0, 6); 
  }
  
  void move()
  {
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    
    x += lx;
    y += ly;
    
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
    stroke(#18B0EA);
    
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
    popMatrix();
  }
  
  void die()
  {
    for (int i = 0; i < bullets.size(); i++) 
    {
      Bullet bullet = (Bullet) bullets.get(i);
      if ( (bullet.x > x - 5 && bullet.x < x + 30) && (bullet.y > y && bullet.y < y + 30) ) 
      {
         println("Asteroid destroyed");
         objects.remove(this);
         bullets.remove(i);
         objects.add(new Asteroid());
      }
    } // end for()
  }
} // end class
