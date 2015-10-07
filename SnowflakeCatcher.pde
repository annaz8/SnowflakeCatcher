Snowflake[] flakes;
void setup()
{
  background(0);
  size(500,500);
  flakes = new Snowflake[200];
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new Snowflake();
  }
}
void draw()
{
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i].lookDown();
    flakes[i].erase();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}
void mouseDragged()
{
  fill(255,255,255);
  if(mousePressed)
  {
    ellipse(mouseX,mouseY,10,10);
  }

}

class Snowflake
{
  int x,y, myClr1, myClr2;
  int myClr3;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    myClr1 = (int)(Math.random()*255);
    myClr2 = (int)(Math.random()*255);
    myClr3 = (int)(Math.random()*255);
    isMoving = true;
  }
  void show()
  {
    fill(myClr1,myClr2,myClr3);
    ellipse(x, y, 10,10);
  }
  void lookDown()
  {
      if ((y >= 0) && (y <= 489) && (get(x, y+10) != color(0,0,0)))
      {
        isMoving = false;
      }
      else
      {
        isMoving = true;
      }
  }  

  void erase()
  {
    fill(0);
    ellipse(x, y, 15,15);
  }
  void move()
  {
    if (isMoving == true)
    {
      y = y + 5;
    }
    else 
    {
      y = y;
    }
    
  }
  void wrap()
  {
    if (y > 500) 
    {
        y = 0;
        x = (int)(Math.random()*500);
    }
  }
}


