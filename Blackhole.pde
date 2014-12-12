class Blackhole extends GameObject
{
  float x, y;
  
  Blackhole(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
    pushMatrix();
    
    popMatrix();
  }
}
