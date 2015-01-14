class Asteroid extends GameObject
{
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
    line(x, y, x + 10, y - 10);
  }
}
