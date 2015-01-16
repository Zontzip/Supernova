class Star extends Entity 
{ 
  Star()
  {
    this.x = width/2;
    this.y = height/2;
  }
  
  void display()
  {
    fill(#F58207);
    stroke(#F6FF0D);
    
    pushMatrix();
    ellipse(x, y, 50, 50);
    popMatrix();
  }
} // end class
