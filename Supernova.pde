 void setup() 
{
   size(1000, 800);
   objects.add(new Ship(100, 100)); 
}

ArrayList<GameObject> objects = new ArrayList<GameObject>();

void draw()
{
  /*switch(currentScreen) {
    case 0: playgame();
    case 1: options();
    case 2: exit();
  }*/
  background(0);
  for (int i = 0; i < objects.size(); i ++)
  {
    objects.get(i).move();
    objects.get(i).display();
  } 
}
