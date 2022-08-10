Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    walker[i].randomizeColor(); // random colors
    walker[i].mass = random(2, 12); // random mass
    walker[i].scale = walker[i].mass * 10; // scaled out according to mass
    walker[i].randomizePosition(); // random initial position
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < walker.length; i++)
  {
    for (int j = 0; j <walker.length; j++)
    {
      if (i != j)
      {
        walker[i].applyForce(walker[j].calculateAttraction(walker[i]));
      }
    }
    
    walker[i].render();
    walker[i].update();
  }
}
