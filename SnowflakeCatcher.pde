snowFlake [] flakes;
void setup()
{
  frameRate(200);
  flakes = new snowFlake[75];
  size(600, 620);
  background(0);
  fill(0);
  rect(-50,-50,1000,1000);
  for (int i=0; i< flakes.length; i++)
  {
  int cordX= (int)(Math.random()*600);
  int cordY= (int)(Math.random()*500);
  flakes [i]=new snowFlake(cordX, cordY);
  }
}

void draw()
{
  for (int i=0; i< flakes.length; i++)
  {
  flakes[i].stopMotion();
  flakes[i].show();
  flakes[i].move();
  flakes[i].wrap();
  
  
  }
  if (mousePressed==true)
  {
  fill(50, 100, 145);
  ellipse(mouseX, mouseY, 10, 10);
  }
}

class snowFlake
{
  int flakeX, flakeY, oldFlakeX, oldFlakeY;
  boolean isMoving;
  snowFlake(int x, int y)
  {
  flakeX=x;
  flakeY=y;
  oldFlakeX=x;
  oldFlakeY=y;
  isMoving=true;
  }
  void show()
  { //creates ellipses
  fill(0);
  ellipse(flakeX, oldFlakeY, 9, 9);
  fill(255);
  ellipse(flakeX, flakeY, 6, 6);
  }
  void move()
  {
  if (isMoving==true)
  {
    oldFlakeY+=flakeY-oldFlakeY;
    flakeY+=1;
  }
  }
  void wrap()
  {
  if (flakeY ==596)
  {
    fill(0);
    ellipse(flakeX, flakeY, 10, 10);
    flakeY=0;
    oldFlakeY=-1;
    flakeX= (int)(Math.random()*600);
  }
  }

void stopMotion()
{
  if (get (flakeX, flakeY+4) != color(0) )
  {
  isMoving=false;
  }
}
}

