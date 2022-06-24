public class Walker
{
  public PVector position = new PVector();
  public float scale = 15;
  
  void render()
  {
    fill(55, 205, 255, 100);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
