/**
* morphing quad
*
* @author aa_debdeb 
* @date 2016/09/17
*/

float radious = 1000;
Particle[] particles;
color c1, c2;

void setup(){
  fullScreen();
  noStroke();
  particles = new Particle[4];
  for(int i = 0; i < 4; i++){
    particles[i] = new Particle();
  }
  c1 = color(255);
  c2 = color(255);
  background(0);
}

void mousePressed(){
  //c1 = color(random(255), random(255), random(255));
  //c2 = color(random(255), random(255), random(255));
}

void draw(){
  fill(0);
  rect(0, 0, width, height);
//  background(255);
  float aveMag = 0;
  for(Particle p: particles){
    aveMag += p.loc.mag();
  }
  aveMag /= particles.length;
  float r = map(aveMag, radious / 3, radious * 2.0 / 3, red(c1), red(c2));
  float g = map(aveMag, radious / 2, radious * 2.0 / 3, green(c1), green(c2));
  float b = map(aveMag, radious / 2, radious * 2.0 / 3, blue(c1), blue(c2));
  fill(r, g, b);
  translate(width / 2, height / 2);
  quad(particles[0].loc.x, particles[0].loc.y,
       particles[1].loc.x, particles[1].loc.y,
       particles[2].loc.x, particles[2].loc.y,
       particles[3].loc.x, particles[3].loc.y);
  for(Particle p: particles){
    p.update();
  }
}

class Particle{

  PVector loc, vel;
  
  Particle(){
    float locSize = map(sqrt(random(1)), 0, 1, 0, mouseY);
    float locAng = random(TWO_PI);
    loc = new PVector(locSize * cos(locAng), locSize * sin(locAng));
    float velSize = random(3, 7);
    float velAng = random(TWO_PI);
    vel = new PVector(velSize * cos(velAng), velSize * sin(velAng));
  }
  
  void update(){
    loc.add(vel);
    if(loc.mag() > radious){
      float locAng = atan2(loc.y, loc.x);
      float velAng = atan2(vel.y, vel.x);
      
      float velMag = vel.mag();
      vel.x = velMag * cos(2 * locAng - velAng - PI);
      vel.y = velMag * sin(2 * locAng - velAng - PI);       
    }
  }
  
}