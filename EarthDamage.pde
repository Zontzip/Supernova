class EarthDamage extends Entity
{
    EarthDamage(float x, float y)
    {
        location = new PVector(random(x - 30, x + 30), random(y - 30, y + 30));
    }

    void display()
    {
        stroke(#000000);
        
        fill(#000000);
        beginShape();
        vertex(location.x + 0, location.y - 10);
        vertex(location.x + 10, location.y - 10);
        vertex(location.x + 10, location.y - 5);
        vertex(location.x + 20, location.y - 5);
        vertex(location.x + 20, location.y + 0);
        vertex(location.x + 10, location.y + 0);
        vertex(location.x + 10, location.y + 10);
        vertex(location.x + 5, location.y + 10);
        vertex(location.x + 5, location.y + 5);
        vertex(location.x + 0, location.y + 5);
        vertex(location.x + 0, location.y + 10);
        vertex(location.x - 5, location.y + 10);
        vertex(location.x - 5, location.y + 0);
        vertex(location.x - 10, location.y + 0);
        vertex(location.x - 10, location.y - 5);
        vertex(location.x + 0, location.y - 5);
        endShape();
    }
}
