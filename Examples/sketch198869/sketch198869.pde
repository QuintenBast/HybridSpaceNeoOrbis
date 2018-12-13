int num = 500;
float[] allX = new float[num];
float[] allY = new float[num];
float _dist=0;

ball[] myball = new ball[num];
//ball myball;

void setup() {
  size(900, 500);
  smooth();
  
  //myball = new ball(50, 50);
  for(int i=0; i<num; i++){
    allX[i] = random(width);
    allY[i] = random(height);
    //println("x: " +  allX[i] + " y: " + allY[i]);
  }
  for(int i=0; i<myball.length; i++){
    myball[i] = new ball(allX[i], allY[i]);    
  }
}


void draw() {
  background(0);
  
  float tmp = map(mouseX,0, width, 0, 100);
  println(tmp);
  
  
  for(int i=0; i<myball.length-1; i++){
     myball[i].display();
    for(int j=0; j<myball.length-1; j++){
        
      if(dist(allX[i], allY[i], allX[j], allY[j])<tmp){
        beginShape();
        vertex(allX[i], allY[i]);
        vertex(allX[j], allY[j]);
        endShape();
      }
    }
  }
  
  /*if(mouseButton == LEFT){
    println("範圍: " + _dist);
    _dist++;
  } else if(mouseButton == RIGHT){
    println("範圍: " + _dist);
    _dist--;
  }*/
  
}
void keyPressed(){
  background(0);
  for(int i=0; i<num; i++){
    allX[i] = 0;
    allY[i] = 0;
    //println("x: " +  allX[i] + " y: " + allY[i]);
  }
  
 for(int i=0; i<num; i++){
    allX[i] = random(width);
    allY[i] = random(height);
    //println("x: " +  allX[i] + " y: " + allY[i]);
  }
   for(int i=0; i<myball.length; i++){
    myball[i] = new ball(allX[i], allY[i]);    
  }
}

class ball
{
  PVector pos = new PVector(0, 0); 
  ball(float tx, float ty) {
    pos.x = tx;
    pos.y = ty;
  }
  void display() {
    stroke(255);
    point(pos.x, pos.y);
  }
  
}
