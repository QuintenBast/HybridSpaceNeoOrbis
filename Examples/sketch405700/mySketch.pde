size(1300,700);
strokeWeight(5);
 
void draw()
{
  noFill();
  stroke(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,random(500),random(500));
}