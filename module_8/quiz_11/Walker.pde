public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  
  public color shapeColor;
  
  public float g = 1; // gravitational constant
  
  void randomizePosition()
  {
    position.x = random(-Window.windowWidth, (Window.windowWidth) + 1);
    position.y = random(-Window.windowHeight, (Window.windowHeight/2) + 1);
  }
  
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
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // direction
    float distance = force.mag();
    force.normalize(); // normalize to accurately get direction
    
    distance = constrain(distance, 5, 25); // solves divide by 0, and divide by really tiny values
    
    float strength = (this.g * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
