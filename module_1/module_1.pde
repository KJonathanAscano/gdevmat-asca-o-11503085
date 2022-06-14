float time = 0;
float frequency = 15;
float amplitude = 20;
// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D); // set window size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // set origin at the middle
}

// the function that gets called every frame
void draw()
{
  background(0); // sets the background of the whole window
  
  //circle(0, 0, 15); // draws a circle at x, y with thickness
  
  //strokeWeight(2); // change the thickness of the line below it
  //color white = color(255, 255, 255); // declare a color variable
  //fill(white); // fills it with the color selected
  //stroke(white); // all the strokes will be the color selected
  //line(-75, -75, 75, 75); // draw a line x1, y1, x2, y2
  if (keyPressed)
  {
    if (key == 'w')
    {
      amplitude += 10;
    }
    
    else if (key == 's')
    {
      amplitude -= 10;
    }
    
    if (key == 'd')
    {
      frequency -= 10;
    }
    
    else if (key =='a')
    {
      frequency += 10;
    }
  }
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave(amplitude, frequency, time);
  
  time++;
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i+=10)
  {
    line(i, -2, i, 2); // x-axis
    line(-2, i, 2, i); // y-axis
  }
}

void drawLinearFunction()
{
  // f(x) = 5x + 30
  
  color purple = color(200, 0, 255);
  fill(purple);
  noStroke();
  
  for (float x = -200; x <= 200; x += 0.1f)
  {
    circle(x, (-5 * x) + 30, 5);
  }
}

void drawQuadraticFunction()
{
  // f(x) = x^2 - 15x - 3
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x += 0.09f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x * 15) - 3), 5);
  }
}

void drawCircle()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawSineWave(float _amplitude, float _frequency, float _time)
{
  color cyan = color(0, 255, 255);
  fill(cyan);
  stroke(cyan);
  
  for (float x = -250; x <= 250; x+= 0.5f)
  {
    circle(x, _amplitude * (float)Math.sin(x/_frequency+(_time/2)), 5);
  }
}
