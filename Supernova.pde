// arraylists
ArrayList<Entity> objects = new ArrayList<Entity>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<UFO> ufos = new ArrayList<UFO>();
ArrayList<Ship> ships = new ArrayList<Ship>();
ArrayList<Shield> shields = new ArrayList<Shield>();
ArrayList<EarthDamage> damages = new ArrayList<EarthDamage>();

// constants
int PLAYING = 0;
int MAIN_MENU = 1;
int GAME_OVER = 2;

// globals
int gameState;
int i;

// audio
import ddf.minim.*;
AudioPlayer player;
Minim sfx;
Minim gameMusic;

void setup() 
{
    size(1024, 768);
  
    gameInit();
}

void draw()
{
    switch(gameState) {
        case 0: {
            background(0);
            strokeWeight(2);
          
            for (i = 0; i < objects.size(); i ++) {
                objects.get(i).update();
                objects.get(i).move();
                objects.get(i).shoot();
                objects.get(i).display();
                objects.get(i).die();
              } 
          
            for (i = 0; i < ships.size(); i++) {
                ships.get(i).update();
                ships.get(i).move();
                ships.get(i).shoot();
                ships.get(i).display();
                ships.get(i).die();
            }
          
            for (i = 0; i < bullets.size(); i++) {
                bullets.get(i).update();
                bullets.get(i).move();
                bullets.get(i).display();
                bullets.get(i).die();
            }
        
            for (i = 0; i < asteroids.size(); i++) {
                asteroids.get(i).update();
                asteroids.get(i).move();
                asteroids.get(i).display();
                asteroids.get(i).die();
            }
        
            for (i = 0; i < ufos.size(); i++) {
                ufos.get(i).update();
                ufos.get(i).move();
                ufos.get(i).shoot();
                ufos.get(i).display();
                ufos.get(i).die();
            }
        
            for (i = 0; i < shields.size(); i++) {
                shields.get(i).update();
                shields.get(i).move();
                shields.get(i).display();
                shields.get(i).die();
            }
            
            for (i = 0; i < damages.size(); i++) {
                damages.get(i).update();
                damages.get(i).move();
                damages.get(i).display();
                damages.get(i).die();
            }
            break;
        }
        
        case 1: {
            break;
        }
        
        case 2: {
        }
    }
}

void gameInit()
{
    // obejct initialization
    ships.add(new Ship(100, 100)); 
    ufos.add(new UFO());
    objects.add(new Planet());
    //objects.add(new Blackhole());
    while (i < 10) {
        asteroids.add(new Asteroid());
        i++;
    }
  
    // music initialization
    sfx = new Minim(this);
    gameMusic = new Minim(this);
    player = gameMusic.loadFile("gameMusic.mp3", 2048);
    player.play();  
  
    gameState = 0;  
}

void stop()
{
    // loop music
    player.close();
    gameMusic.stop();
    super.stop();
}

void keyPressed() 
{
    // pause game
    if (key == 'p') {
        if (looping) {
          noLoop();
      } else { 
        loop();
      }
    }
} // end keyPressed()
