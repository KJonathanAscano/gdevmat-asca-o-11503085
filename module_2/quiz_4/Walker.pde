public class Walker
{
  public float x;
  public float y;
  public float scale;
  public float r, g, b;
  public float tx = 0, ty = 10000, tscale = 5, tred = 255, tgreen = 255, tblue = 255;
  
  void render()
  {
    r = map(noise(tred), 0, 1, 0, 255);
    g = map(noise(tgreen), 0, 1, 0, 255);
    b = map(noise(tblue), 0, 1, 0, 255);
    fill(r, g, b, 100);
    noStroke();
    circle(x, y, scale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    scale = map(noise(tscale), 0, 1, 5, 150);
    
    tx += 0.01f;
    ty += 0.01f;
    tscale += 0.01f;
    tred += 0.01f;
    tgreen += 0.21f;
    tblue += 0.051f;
  }
} 
