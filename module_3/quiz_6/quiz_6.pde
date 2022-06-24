void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
    
  PVector mouse = mousePos();
  
  // Red Outer Glow
  strokeWeight(15);
  stroke(255, 0, 0);
  mouse.normalize();
  mouse.mult(350);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // White Inner Glow
  strokeWeight(10);
  stroke(255);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // print magnitude of one side of the lightsaber
  println(mouse.mag());
  
  // Black Handle
  strokeWeight(16);
  stroke(0);
  mouse.normalize();
  mouse.mult(85);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
