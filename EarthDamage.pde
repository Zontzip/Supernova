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
        curveVertex(location.x - 4, location.y + 20);
        curveVertex(location.x - 4, location.y + 20);
        curveVertex(location.x + 4, location.y + 22);
        curveVertex(location.x + 12, location.y + 20);
        curveVertex(location.x + 8, location.y + 28);
        curveVertex(location.x + 4, location.y + 30);
        curveVertex(location.x + 4, location.y + 32);
        curveVertex(location.x - 4, location.y + 30);
        curveVertex(location.x - 12, location.y + 28);
        curveVertex(location.x - 4, location.y + 20);
        curveVertex(location.x - 4, location.y + 20);
        endShape(); 
    }
}
