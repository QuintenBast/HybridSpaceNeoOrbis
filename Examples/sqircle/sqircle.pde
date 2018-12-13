/**
* morphing between circle and square 
*
* @author aa_debdeb
* @date 2016/12/03
*/

float radius = 400;
int pointNum = 200;
PVector[] circlePoints;
PVector[] rectPoints;
float shapeRate = 0.0;
float shapeRateSpeed = -0.020;
color circleColor = color(20);
color rectColor = color(200);

void setup(){
  fullScreen();
  noFill();
  strokeWeight(50);
  circlePoints = new PVector[pointNum];
  for(int i = 0; i < pointNum; i++){
    float angle = TWO_PI / pointNum * i;
    circlePoints[i] = new PVector(radius * cos(angle), radius * sin(angle));
  }
  rectPoints = new PVector[pointNum];
  PVector[] vertices = {new PVector(radius, 0),
                            new PVector(0, radius),
                            new PVector(-radius, 0),
                            new PVector(0, -radius)};
  for(int i = 0; i < pointNum; i++){
    int vi = int((float(i) / pointNum) * 4);
    int vj = vi != 3 ? vi + 1: 0; 
    float rate = (i - (pointNum / 4.0 * vi)) / (pointNum / 4.0);
    float x = lerp(vertices[vi].x, vertices[vj].x, rate);
    float y = lerp(vertices[vi].y, vertices[vj].y, rate);
    rectPoints[i] = new PVector(x, y);
  }
}

void draw(){
  background(0);
  translate(width / 2, height / 2);
  rotate(frameCount * 0.01);
  float v = mapToQuart(shapeRate);
  stroke(lerpColor(circleColor, rectColor, v));
  beginShape();
  for(int i = 0; i < pointNum; i++){
    float x = lerp(circlePoints[i].x, rectPoints[i].x, v);
    float y = lerp(circlePoints[i].y, rectPoints[i].y, v);
    vertex(x, y);
  }
  endShape(CLOSE);
  shapeRate = constrain(shapeRate + shapeRateSpeed, 0, 1);
}

float mapToQuart(float v){
  if(v < 0.5){
    return 8 * v * v * v * v;
  } else {
    return -8.0 * (v - 1.0) * (v - 1.0) * (v - 1.0) * (v - 1.0) + 1.0;
  }
}

void mousePressed(){
  shapeRateSpeed *= -1;
}