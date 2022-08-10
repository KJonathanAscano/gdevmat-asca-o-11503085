Walker[] walker = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f); // implement liquid
PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int posX = 0;
  for (int i = 0; i < walker.length; i++)
  {
    posX = 1 * (Window.windowWidth / walker.length) * (i - (walker.length/2)); // spaced out equally side by side
    walker[i] = new Walker();
    walker[i].randomizeColor(); // random colors
    walker[i].mass = random(2, 12); // random mass
    walker[i].scale = walker[i].mass * 9; // scaled out according to mass
    walker[i].position = new PVector(posX + 70, 300); // positioned slightly above the screen
  }
}

void draw()
{
  background(255);
  ocean.render(); 
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update();
    
    PVector gravity = new PVector(0, -0.15f * walker[i].mass);
    walker[i].applyForce(gravity); // applying gravity to walker according to mass
    walker[i].applyForce(wind); // apply wind
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = walker[i].velocity.copy();
    // F = -uNv
    walker[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction to walker
    
    // apply drag force upon hitting the liquid
    if (ocean.isCollidingWith(walker[i]))
    {
      PVector dragForce = ocean.calculateDragForce(walker[i]);
      walker[i].applyForce(dragForce);
    }
        
    if (walker[i].position.y <= Window.bottom)
    {
      walker[i].position.y = Window.bottom;
      walker[i].velocity.y *= -1;
    }
    
    if (walker[i].position.x >= Window.right)
    {
      walker[i].position.x = Window.right;
      walker[i].velocity.x *= -1;
    }
  }
}
