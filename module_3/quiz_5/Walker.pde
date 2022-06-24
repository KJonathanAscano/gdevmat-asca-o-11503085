public class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector(5, 8); // for bouncing ball
  public float scale = 50;
  
  void render()
  {
    fill(55, 205, 255, 100);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  void moveAndBounce()
  {
    // add speed to the current position
    position.add(speed);
  
    // conditions for bouncing
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
} 
