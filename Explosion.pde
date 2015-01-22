class Explosion extends Entity
{
  float randX, randY;
  
  Explosion(float x, float y)
  {
    randX = random(x - 30, x + 30);
    randY = random(y - 30, y + 30);
  }
  
  void display()
  {
    beginShape();
    stroke(#000000);
    fill(#E68A5C);
    curveVertex(randX - 2, randY + 10);
    curveVertex(randX - 2, randY + 10);
    curveVertex(randX + 2, randY + 11);
    curveVertex(randX + 6, randY + 10);
    curveVertex(randX + 4, randY + 14);
    curveVertex(randX + 2, randY + 15);
    curveVertex(randX + 2, randY + 16);
    curveVertex(randX - 2, randY + 15);
    curveVertex(randX - 6, randY + 14);
    curveVertex(randX - 2, randY + 10);
    curveVertex(randX - 2, randY + 10);
    endShape(); 
  }
}
