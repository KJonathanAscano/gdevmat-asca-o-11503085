public class Walker
{
  public PVector position = new PVector();
  public float scale;
  public color shapeColor = color(255, 255, 255, 200);
  
  void render()
  {
    fill(shapeColor);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  void randomizeColor()
  {
    float r = random(0, 256);
    float g = random(0, 256);
    float b = random(0, 256);
    float a = random(50, 150);
    
    shapeColor = color(r, g, b, a);
  }
  
  void randomizePosition() // for black hole
  {
    position.x = random(-1080/2, (1080/2) + 1);
    position.y = random(-720/2, (720/2) + 1);
  }
  
  void GaussianSpawn() // for other matter
  {
      // randomize position
      float xGaussian = randomGaussian();
      float yGaussian = randomGaussian();
      float standardDeviation = 250; // variance; how scattered the values are
      float mean = 0; // where the most values are being displayed
      
      // randomize scale
      float scaleGaussian = randomGaussian();
      float scaleStandardDeviation = 20;
      float scaleMean = 10;
      
      // Calculate circle() parameters & shape color
      position.x = standardDeviation * xGaussian + mean;
      position.y = standardDeviation * yGaussian + mean;
      scale = scaleStandardDeviation * scaleGaussian + scaleMean;
  }
}
