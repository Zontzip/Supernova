class Asteroid extends GameObject
{
  float hitBoxX;
  float hitBoxY;
  
  Asteroid()
  {
    this.x = random(0, width);
    this.y = 0;
  }
  
  void move()
  {
    x = x - 1;
    y = y + 1;
    
    if (y > height || x < 0) 
    {
      y = 0;
      x = random(0, width);
    }
  }
  
  void display()
  {
    pushMatrix();
    stroke(#FF1515);
    rect(x - 5, y - 5, 30, 30);
    stroke(#18B0EA);
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
      }
    }
  }
}
