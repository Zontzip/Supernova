class Ship extends GameObject
{
  float w, h;

  // firerate variables
  float timeDelta = 1.0f/60.0f;
  float fireRate = 5.0f;
  float ellapsed = 0.0f;
  float toPass = 1.0f/fireRate;

  Ship(float x, float y)
  {
    this.x = x;
    this.y = y;
    h = 20;
    w = 20;
    colour = color(255);
    theta = 0;
  }

  void display()
  {
    pushMatrix();
    translate(x, y);   
    rotate(theta);

    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;

    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth, halfHeight, 0, 0);
    line(0, 0, - halfWidth, halfHeight);
    popMatrix();
  }

  void move()
  {
    ellapsed += timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    if (keyPressed)
    {
      switch (key)
      {
      case 'w':
        x = (x + lx);
        y = (y + ly);
        break;
      case 's':
        y = y + 1;
        break;
      case 'a':
        theta -= 0.2f;
        break;
      case 'd':
        theta += 0.2f;
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
    }
  }
}

