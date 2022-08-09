public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  
  public color shapeColor;
  
  void randomizeColor()
  {
    float r = random(0, 256);
    float g = random(0, 256);
    float b = random(0, 256);
    float a = random(50, 150);
    
    shapeColor = color(r, g, b, a);
  }
  
  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }
  
  public void render()
  {
    stroke(shapeColor);
    fill(shapeColor);
    circle(position.x, position.y, scale);
  }
  
  // Newton's Third Law of Motion
  public void bounceOffEdges()
  {
    if (this.position.x + this.scale/2 >= Window.right ||
      this.position.x - this.scale/2 <= Window.left)
    {
      this.velocity.x *= -1;
    }
    
    if (this.position.y + this.scale/2 >= Window.top ||
      this.position.y - this.scale/2 <= Window.bottom)
    {
      this.velocity.y *= -1;
    }
  }
}
