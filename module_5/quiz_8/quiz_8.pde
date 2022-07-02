Walker[] walker = new Walker[10];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize walkers
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    walker[i].mass = random(1, 11); // mass values from 1 to 10
    walker[i].scale = walker[i].mass * 15; // scale depending on the mass
    walker[i].randomizeColor(); // random color
    walker[i].position = new PVector(-500, 200); // starting position
  }
}


void draw()
{
  background(80);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update();
    walker[i].applyForce(gravity);
    walker[i].applyForce(wind);
    walker[i].bounceOffEdges();
  }
}
