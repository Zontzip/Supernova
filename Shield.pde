class Shield extends Entity
{
  boolean pickup;
  
  float hitboxX, hitboxY, hitboxW, hitboxH;
  
  Shield(float x, float y, color colour) 
  {
    this.x = x;
    this.y = y;
    this.colour = colour;
    
    pickup = false;
  }
  
  void update()
  {
    hitboxX = x - 15;
    hitboxY = y - 15;
    hitboxW = x + 15;
    hitboxH = y + 15;
  }
  
  void move()
  {
    if (pickup == false)
    {
      for (int i = ships.size() - 1; i >= 0; i--) 
      {
        Ship ship = (Ship) ships.get(i);
      
        if ( (ship.x > hitboxX && ship.x < hitboxW) && (ship.y > hitboxY && ship.y < hitboxH) )
        {
          println("Shield activated");
          ufos.add(new UFO());
          
          player = sfx.loadFile("shield_pickup.wav", 2048);
          player.play();
          
          pickup = true;
        }
      } // end for()
    } // end if()
      
    if (pickup == true)
    {
      for (int i = 0; i < ships.size(); i++) 
      {
        Ship ship = (Ship) ships.get(i);
        
        x = ship.x;
        y = ship.y;
      }
    }
  }
  
  void display()
  {
    noFill();
    stroke(colour);
    
    if (pickup == false) {
      ellipse(x, y, 30, 30);
    }
    
    if (pickup == true) {
      ellipse(x, y, 30, 30);
    }
  }
}
