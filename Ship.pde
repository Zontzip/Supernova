class Ship extends GameObject
{
  float w, h;
  float speed;
  
  float halfWidth;
  float halfHeight;

  // firerate variables
  float timeDelta = 1.0f/60.0f;
  float fireRate = 5.0f;
  float ellapsed = 0.0f;
  float toPass = 1.0f/fireRate;

  Ship(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.x += 10;
    this.y += 10;
    h = 20;
    w = 20;
    halfWidth = w / 2;
    halfHeight = h / 2;
    colour = color(255);
    theta = 0;
  }
  
  void move()
  {
    ellapsed += timeDelta;
    speed = 5;
    
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    
    if (keyPressed)
    {
      switch (key)
      {
      case 'w':
        x += lx * speed;
        y += ly * speed;
        break;
      case 's':
        y = y + speed;
        break;
      case 'a':
        theta -= 0.15f;
        break;
      case 'd':
        theta += 0.15f;
        break;  
      case ' ':
        if (ellapsed > toPass) {
          Bullet bullet = new Bullet();
          bullet.x = x;
          bullet.y = y;
          bullet.theta = theta;
          objects.add(bullet);
          ellapsed = 0.0f;
        }
      }
    
    // Screen boundry
    if (x < 0) {x = width; }
    if (x > width) {x = 0; }
    if (y < 0) {y = height; }
    if (y > height) {y = 0; }
    }
  }

  void display()
  {
    stroke(colour);
    
    // Ship
    pushMatrix();
    translate(x, y);   
    rotate(theta);
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth, halfHeight, 0, 0);
    line(0, 0, - halfWidth, halfHeight);
    popMatrix();
  }
}

