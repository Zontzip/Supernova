class Bullet
{
  float x, y;
  float theta;
  int alive = millis();
  
  Bullet(float x, float y, float theta)
  {
    this.x = x;
    this.y = y;
    this.theta = theta;
  }
  
  void move()
  {
    float lx = sin(theta);
    float ly = -cos(theta);
    float speed = 10.0f;
    x += lx * speed;
    y += ly * speed;
    
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
    stroke(#CE0C0C);
    
    pushMatrix();
    translate(x, y);
    rotate(theta);
    line(0, - 5, 0, 5);
    popMatrix();
  }
  
  void die() 
  {
    if (millis() - alive >= 5000) 
    {
      println("Laser offline");
      bullets.remove(this);
      alive = millis();
    }
  }
}
