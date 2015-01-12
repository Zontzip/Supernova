class Ship extends GameObject
{
  float w, h;
  float speed;

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
        
        print("theta: " + theta + "\n" );
        print("lx  =  " + lx + "  ly  =  " + ly + "\n");
        print("x  =  " + x + "  y  =  " + y + "\n\n");
        
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
      
    if (x < 0) {x = width; }
    if (x > width) {x = 0; }
    if (y < 0) {y = height; }
    if (y > height) {y = 0; }
    }
  }

  void display()
  {
    pushMatrix();
    translate(x, y);   
    rotate(theta);

    stroke(colour);
    float halfWidth = w / 2;
    float halfHeight = h / 2;

    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth, halfHeight, 0, 0);
    line(0, 0, - halfWidth, halfHeight);
    
    popMatrix();
  }
}

