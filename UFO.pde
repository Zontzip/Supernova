class UFO extends GameObject 
{
  UFO() 
  {
    this.x = random(0, width);
    this.y = random(0, height);
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
    stroke(#18B0EA);
    fill(0);
    
    pushMatrix();
    ellipse(x, y, 60, 20);
    line(x - 15, y + 10, x - 20, y + 25);
    line(x + 15, y + 10, x + 20, y + 25);
    curve(x - 10, y + 50, x - 10, y - 10, x + 10, y - 10, x + 10, y + 50);
    popMatrix();
  }
}
