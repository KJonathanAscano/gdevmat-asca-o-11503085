class Walker
{
  float x;
  float y;
  
  void render()
  {
    color randomColor = color(random(256), random(256), random(256), random(50, 101));
    fill(randomColor);
    noStroke();
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) // up
    {
      y += 10;
    }
    
    else if (rng == 1) // down
    {
      y -= 10;
    }
    
    else if (rng == 2) // right
    {
      x += 10;
    }
    
    else if (rng == 3) // left
    {
      x -= 10;
    }
    
    else if (rng == 4) // upper right corner
    {
      y += 10;
      x += 10;
    }
    
    else if (rng == 5) // upper left corner
    {
      y += 10;
      x -= 10;
    }
    
    else if (rng == 6) // lower right corner
    {
      y -= 10;
      x += 10;
    }
    
    else if (rng == 7) // lower left corner
    {
      y -= 10;
      x -= 10;
    }
  }
  
  void randomWalkBiased()
  {
    float upProbability = 0.40; // 40 % chance of going up
    float downProbability = 0.20; // 20% chance of going down
    float rightProbability = 0.20; // 20% chance of going right
    
    float rng = random(1);
    
    if (rng < upProbability) // if random number is less than 0.40
    {
      y += 10;
    }
    
    else if (rng < upProbability + downProbability) // if random number is between 0.40 and 0.60
    {
      y -= 10;
    }
    
    else if (rng < upProbability + downProbability + rightProbability) // if random number is between 0.60 and 0.80
    {
      x += 10;
    }
    
    else // go left if random number is between 0.80 and 1.0
    {
      x -= 10;
    }
  }
}
