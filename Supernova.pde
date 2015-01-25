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
int HIGH_SCORE = 2;
int OPTIONS = 3;
int QUIT = 4;
int GAME_OVER = 5;
int PAUSED = 6;

// globals
int score;
int gameState;
int i;

// audio
import ddf.minim.*;
AudioPlayer player;
Minim sfx;
Minim gameMusic;

// font
PFont font;

void setup() 
{
    size(1024, 768);
  
    gameInit();
    
    // music initialization
    sfx = new Minim(this);
    gameMusic = new Minim(this);
    player = gameMusic.loadFile("gameMusic.mp3", 2048);
    player.play(); 
   
    // font
    font = loadFont("8BITWONDERNominal-32.vlw");
    textFont(font, 32); 
}

void draw()
{
    background(0);
    
    switch(gameState) {
        // play game
        case 0: {
            strokeWeight(2);
            
            fill(#FFFFFF);
            textSize(20);
            text("Score: " + score, width * .9, height * .1);
          
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
        
        // menu
        case 1: {
            fill(#FFFFFF);
            textAlign(CENTER);
            
            fill(#FFFFFF);
            text("Play Game", width/2, height * .2);
           
            fill(#FFFFFF);
            text("High scores", width/2, height * .4);
            
            fill(#FFFFFF);
            text("Options", width/2, height * .6);
            
            fill(#FFFFFF);
            text("Exit", width/2, height * .8);
            
            break;
        }
        
        // high scores
        case 2: {
            textAlign(CENTER);
            text("Highscores", width/2, height * 0.1);
            
            break;
        }
        
        // options
        case 3: {
            
            break;
        }
        
        // exit
        case 4: {
            exit();
        }
        
        // game over
        case 5: {
           
        }
    }
}

void gameInit()
{
    score = 0;
    // obejct initialization
    ships.add(new Ship(100, 100)); 
    ufos.add(new UFO());
    objects.add(new Planet());
    while (i < 10) {
        asteroids.add(new Asteroid());
        i++;
    }
  
    gameState = MAIN_MENU;  
}

void purge()
{
    for (i = objects.size() - 1; i >= 0; i--) {
        objects.remove(i);
    }
    
    for (i = ships.size() - 1; i >= 0; i--) {
        ships.remove(i);
    }
    
    for (i = bullets.size() - 1; i >= 0; i--) {
        asteroids.remove(i);
    }
    
    for (i = asteroids.size() - 1; i >= 0; i--) {
        asteroids.remove(i);
    }
    
    for (i = ufos.size() - 1; i >= 0; i--) {
        ufos.remove(i);
    }
    
    for (i = shields.size() - 1; i >= 0; i--) {
        shields.remove(i);
    }
    
    for (i = damages.size() - 1; i >= 0; i--) {
        damages.remove(i);
    }
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
    if (key == 'p' && gameState == PLAYING || gameState == PAUSED) {
        if (looping) {
            gameState = PAUSED;
            noLoop();
            fill(#FFFFFF);
            text("Game paused", width/2, height * .4);
            text("Main menu", width/2, height * .65);   
            } else { 
                gameState = PLAYING;
                loop();
            }
    }
} // end keyPressed()

void mouseClicked() 
{
    switch (gameState) {
        // main menu mouse clicks
        case 1: {
            if ((mouseX > width * .3) && (mouseX < width * .7) && (mouseY > height * .1) && (mouseY < height * .2) ) {
                gameState = PLAYING;
            }
            
            if ((mouseX > width * .3) && (mouseX < width * .7) && (mouseY > height * .3) && (mouseY < height * .4) ) {
                gameState = HIGH_SCORE;
            }
            
            if ((mouseX > width * .3) && (mouseX < width * .7) && (mouseY > height * .5) && (mouseY < height * .6) ) {
                gameState = OPTIONS;
            }
            
            if ((mouseX > width * .3) && (mouseX < width * .7) && (mouseY > height * .7) && (mouseY < height * .8) ) {
                gameState = QUIT;
            }
        }
        
        // pause game mouse clicks
        case 6: {
            if ((mouseX > width * .3) && (mouseX < width * .7) && (mouseY > height * .6) && (mouseY < height * .8) ) {
                gameState = MAIN_MENU;
                purge();
                gameInit();
                loop();
            }
        }
    }
}
