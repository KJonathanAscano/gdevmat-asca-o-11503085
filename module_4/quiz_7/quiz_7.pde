Walker[] myWalker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize walkers
  for (int i = 0; i < myWalker.length - 1; i++)
  {
    myWalker[i] = new Walker();
    myWalker[i].randomizePosition(); // random position
    myWalker[i].scale = random(15, 25); // random scale
  }
}

/* Vector Motion 101

  1. Add velocity to position
  2. Draw object at position
*/

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(60);
  
  // Draw walkers
  for (int i = 0; i < myWalker.length - 1; i++)
  {
    PVector direction = PVector.sub(mousePos(), myWalker[i].position);
    direction.normalize();
    myWalker[i].acceleration = direction;
    myWalker[i].acceleration.mult(0.2);
    
    myWalker[i].update();
    myWalker[i].render();
    myWalker[i].checkEdges();
  }
}
