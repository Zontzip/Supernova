class Star extends GameObject 
{ 
  Star()
  {
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
    pushMatrix();
    
    fill(#F58207);
    stroke(#F6FF0D);
    
    ellipse(width/2, height/2, 50, 50);
    
    popMatrix();
  }
  
}
