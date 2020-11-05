Particle[] Maya = new Particle [200];
void setup()
{
  size(500, 500);
  for (int i = 0; i < Maya.length; i++)
  {
    Maya[i] = new Particle();
  }
  Maya[0] = new OddballParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i <Maya.length; i++)
  {
    Maya[i].show();
    Maya[i].move();
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    for (int i = 0; i < Maya.length; i++)
    {
      Maya[i] = new Particle();
    }
    Maya[0] = new OddballParticle();
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
    myX = 250;
    myY = 250;
    myColor = color(255, 255, 0);
    myAngle = (double)(Math.random() * 2*Math.PI);
    mySpeed = (Math.random()*3);
  }
  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void show()
  {
    stroke(myColor);
    fill(myColor);
    triangle((float)myX, (float)myY, (float)(myX + 16), (float)myY, (float)(myX + 8), (float)(myY+8));
    triangle((float)myX, (float)myY + 4, (float)(myX + 16), (float)(myY + 4), (float)(myX + 8), (float)(myY-4));
  }
  //your code here
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle()
  {
    myX = 400;
    myY = 100;
    myColor = color(255, 255, 255);
    myAngle = (double)(Math.random() * 2*Math.PI);
    mySpeed = Math.random()*3;
  }
  void move()
  {
    myX = myX + (int)(Math.random() * 3) -1;
    myY = myY + (int)(Math.random() * 3) - 1;
  }
  void show()
  {
    stroke(myColor);
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)50, (float)50);
  }
}
