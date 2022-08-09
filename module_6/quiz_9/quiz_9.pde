Walker[] walker = new Walker[8];
PVector acceleration = new PVector(0.2, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize walkers
  initializeWalkers();
}

void draw()
{
  background(255);
  drawMiddleLine();
  
  for (int i = 0; i < walker.length; i++)
  {
    // Friction = -1 * mew * N * v
    float mew = 0.01f; // initial coefficient of friction
    float normal = 1;
    
    if (walker[i].position.x >= 0) // increase mew after going beyond the middle of the screen
    {
      mew = 0.4f;
    }
    
    float frictionMagnitude = mew * normal;
    PVector friction = walker[i].velocity.copy(); // copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    walker[i].applyForce(friction);
    walker[i].applyForce(acceleration);
    walker[i].render();
    walker[i].update();
    
    // safeguarding position
    if (walker[i].position.x >= Window.right)
    {
      walker[i].position.x = Window.right;
      walker[i].velocity.x *= -1;
    }
    
    if (walker[i].position.y <= Window.bottom)
    {
      walker[i].position.y = Window.bottom;
      walker[i].velocity.y *= -1;
    }
  }
}

void drawMiddleLine()
{
  strokeWeight(2);
  color black = color(0, 0, 0);
  stroke(black);
  fill(black);
  line(0, -Window.windowHeight/2, 0, Window.windowHeight/2);
}

void initializeWalkers()
{
  int posY = 0;
  for (int i = 0; i < walker.length; i++)
  {
    posY = 1 * (Window.windowHeight / walker.length) * (i - (walker.length/2)); // position from top to bottom
    walker[i] = new Walker();
    walker[i].randomizeColor(); // random colors
    walker[i].mass = 11 - i; // increasing mass and scale
    walker[i].scale = walker[i].mass * 9; // scale depending on the mass
    walker[i].position = new PVector(-500, posY); // initial position to the left of the screen
  }
}

void mouseClicked()
{
  initializeWalkers(); // reset everything when the mouse is clicked
}
