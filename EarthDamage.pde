class EarthDamage extends Entity
{
    EarthDamage(float x, float y)
    {
        location = new PVector(random(x - 30, x + 30), random(y - 30, y + 30));
    }

    void display()
    {
        stroke(#000000);
        fill(#E68A5C);
        
        beginShape();
        curveVertex(location.x - 2, location.y + 10);
        curveVertex(location.x - 2, location.y + 10);
        curveVertex(location.x + 2, location.y + 11);
        curveVertex(location.x + 6, location.y + 10);
        curveVertex(location.x + 4, location.y + 14);
        curveVertex(location.x + 2, location.y + 15);
        curveVertex(location.x + 2, location.y + 16);
        curveVertex(location.x - 2, location.y + 15);
        curveVertex(location.x - 6, location.y + 14);
        curveVertex(location.x - 2, location.y + 10);
        curveVertex(location.x - 2, location.y + 10);
        endShape(); 
    }
}
