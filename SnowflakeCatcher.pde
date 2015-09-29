int eSize=5;
Snowflake [] storm;
int screenSize = 500;
color back=color(149,228,214);
color paint=color(192,151,237);
int caught = 0;
void setup()
{
  size(500,500);
  background(back);
  storm = new Snowflake [300];
  for (int i=0; i<storm.length; i++)
  {
    storm[i] = new Snowflake();
  }
}
void draw()
{
    for (int i=0; i<storm.length; i++)
  {
    storm[i].erase();
    storm[i].lookDown();
    storm[i].move();
    storm[i].wrap();
    storm[i].show();
  }
}
void mouseDragged()
{
  fill(paint);
  noStroke();
  ellipse(mouseX, mouseY,10,10);
}

class Snowflake
{
  int myX,myY;
  boolean isMoving;
  Snowflake()
  {
    myX=(int)(Math.random()*501);
    myY=(int)(Math.random()*501);
    isMoving=true;
  }
  void show()
  {
    fill(255);
    //noStroke();
    stroke(0);
    ellipse(myX, myY, eSize,eSize);
  }
  void lookDown()
  {
    
      if(myY>0 && myY<screenSize && (get(myX,myY+6)==color(0) || get(myX,myY+6)==color(paint) || get(myX,myY+6)==color(255)))
        {
          isMoving=false;
          caught++;
        }
    
      else
      {
        isMoving=true;
      }
  }
  void erase()
  {
    fill(back);
    noStroke();
    ellipse(myX, myY, 8, 8);
  }
  void move()
  {
    if (isMoving==true)
    {
      myY+=1;
    }
  }
  void wrap()
  {
    if(myY>screenSize-10)
    {
      myY=0;
      myX=(int)(Math.random()*501);
    }
  }
}
void keyPressed()
{
  if (key=='r' || key == 'R')
    background(back);
}


