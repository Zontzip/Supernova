ArrayList<Entity> objects = new ArrayList<Entity>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int i = 0;

import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() 
{
  size(1000, 800);
  //objects.add(new Ship(100, 100)); 
  objects.add(new UFO());
  objects.add(new Planet());
  //objects.add(new Blackhole());
  while (i < 10) 
  {
    objects.add(new Asteroid());
    i++;
  }
  
  minim = new Minim(this);
}

void draw()
{
  /*switch(currentScreen) {
    case 0: playgame();
    case 1: options();
    case 2: exit();
  }*/
  background(0);
  strokeWeight(2);
  
  for (int i = 0; i < objects.size() - 1; i ++)
  {
    objects.get(i).move();
    objects.get(i).display();
    objects.get(i).die();
    objects.get(i).shoot();
  } 
  
  for (int i = 0; i < bullets.size(); i++)
  {
    bullets.get(i).move();
    bullets.get(i).display();
    bullets.get(i).die();
  }
}

void keyPressed() {
  
  if (keyCode == 'p') 
  {
    if (looping) {
      noLoop();
    }
    else { 
      loop();
    }
  } // end if()
} // end keyPressed()
