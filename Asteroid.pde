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
}
