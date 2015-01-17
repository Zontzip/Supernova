class Planet extends Entity 
{ 
  Planet()
  {
    this.x = width/2;
    this.y = height/2;
  }
  
  void display()
  {
    stroke(#70EDF7);
    fill(#2BA6DE);
    ellipse(x, y, 100, 100);
    
    beginShape();
    fill(#007A29);
    curveVertex(x - 10, y - 45);
    curveVertex(x - 10, y - 45);
    curveVertex(x - 5, y - 35);
    curveVertex(x - 10, y - 20);
    curveVertex(x - 15, y - 10);
    curveVertex(x - 15, y);
    curveVertex(x - 15, y + 10);
    curveVertex(x - 15, y + 20);
    curveVertex(x - 20, y + 30);
    curveVertex(x - 30, y + 30);
    curveVertex(x - 40, y + 10);
    curveVertex(x - 45, y - 10);
    curveVertex(x - 35, y - 25);
    curveVertex(x - 25, y - 40);
    curveVertex(x - 10, y - 45);
    curveVertex(x - 10, y - 45);
    endShape();
    
    beginShape();
    fill(#007A29);
    curveVertex(x + 20, y - 30);
    curveVertex(x + 20, y - 30);
    curveVertex(x + 25, y - 25);
    curveVertex(x + 30, y - 20);
    curveVertex(x + 35, y - 10);
    curveVertex(x + 35, y);
    curveVertex(x + 30, y + 5);
    curveVertex(x + 20, y + 10);
    curveVertex(x + 15, y + 5);
    curveVertex(x + 15, y - 5);
    curveVertex(x + 10, y - 20);
    curveVertex(x + 10, y - 30);
    curveVertex(x + 20, y - 30);
    curveVertex(x + 20, y - 30);
    endShape();
    
    beginShape();
    fill(#FFFFFF);
    curveVertex(x - 5, y + 35);
    curveVertex(x - 5, y + 35);
    curveVertex(x + 5, y + 38);
    curveVertex(x + 15, y + 35);
    curveVertex(x + 18, y + 40);
    curveVertex(x + 10, y + 45);
    curveVertex(x + 5, y + 48);
    curveVertex(x - 5, y + 45);
    curveVertex(x - 15, y + 40);
    curveVertex(x - 5, y + 35);
    curveVertex(x - 5, y + 35);
    endShape();
  }
} // end class
