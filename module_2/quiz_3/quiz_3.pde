void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  // x position
  float xGaussian = randomGaussian();
  float xStandardDeviation = 150; // variance; how scattered the values are
  float xMean = 0; // where the most values are being displayed
  
  // scale
  float scaleGaussian = randomGaussian();
  float scaleStandardDeviation = 20;
  float scaleMean = 30;
  
  // circle parameters
  float x = xStandardDeviation * xGaussian + xMean;
  float y = random(-720/2, 720/2); // random
  float scale = scaleStandardDeviation * scaleGaussian + scaleMean;
  
  // random color
  noStroke();
  fill(random(256), random(256), random(256), random(101));
  
  circle(x, y, scale);
}
