class Bullet extends GameObject
{
  int alive = millis();
  
  Bullet()
  {
    x = width / 2;
    y = height / 2;
  }
  
  void move()
  {
    float lx = sin(theta);
    float ly = -cos(theta);
    float speed = 10.0f;
    x += lx * speed;
    y += ly * speed;
    if (x < 0) {x = width; }
    if (x > width) {x = 0; }
    if (y < 0) {y = height; }
    if (y > height) {y = 0; }
    
  }
  
  void display()
  {
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
      println("Lazerz offline");
      objects.remove(this);
      alive = millis();
    }
  }
}
