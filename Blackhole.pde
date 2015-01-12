class Blackhole extends GameObject
{
  Blackhole()
  {
    this.x = random(0, width);
    this.y = random(0, height);
  }
  
  void display()
  {
    fill(#FFFFFF);
    stroke(#FFFFFF);
    
    ellipse(x, y, 40, 40);
  }
}
