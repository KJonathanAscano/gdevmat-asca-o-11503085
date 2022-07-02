public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  void randomizePosition() // for black hole
  {
    position.x = random(-Window.windowWidth/2, (Window.windowWidth/2) + 1);
    position.y = random(-Window.windowHeight/2, (Window.windowHeight/2) + 1);
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    stroke(75, 0, 130, 200);
    fill(0, 200);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
    
    
  }
}
