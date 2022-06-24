Walker blackHole = new Walker();
Walker[] matter = new Walker[150];
int time;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Set black hole scale
  blackHole.scale = 50;
  
  // Initialize matter
  for (int i = 0; i < matter.length - 1; i++)
  {
    matter[i] = new Walker();
  }
  
  // Store current time
  time = millis();
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  // Set black hole to follow mouse position
  blackHole.position = mousePos();
  
  if (millis() > time + 2000) // timer for spawning matter
  {
    // Go through matter[] and set random position, scale, and color
    for (int i = 0; i < matter.length - 1; i++)
    {
      matter[i].GaussianSpawn(); // position and scale
      matter[i].randomizeColor(); // color
    }
    
    time = millis();
  }
  
  // flush the screen
  background(0);
  
  for (int i = 0; i < matter.length - 1; i++)
  {
    // Calculate direction and move matter towards black hole
    PVector direction = PVector.sub(blackHole.position, matter[i].position);
    direction.normalize();
    direction.mult(10); // speed
    matter[i].position.add(direction);
    
    matter[i].render();
  }
  
  blackHole.render();
}
