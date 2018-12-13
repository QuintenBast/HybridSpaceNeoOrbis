import processing.net.*;

float distance = 0.0;
float speed = 3;
float objStep = 100;


int millisecs;
color c1, c2;
boolean useRect;

int xPosition = 0; 
int yPosition = 0; 

Client myClient;
int val = 0;

  
import processing.sound.*;
SoundFile file;
  

void setup(){

  file = new SoundFile(this, "wind1.wav");
  file.play();
      

  frameRate(60);
  fullScreen(P3D);
  rectMode(CENTER);
  mousePressed();
  //cursor(CROSS);
  noCursor();
  
    myClient = new Client(this, "127.0.0.1", 5205); 

  
}

 
void draw(){
  scene0();
  
  
  
 
/////////////////////////////////
  if(millis() >= 6700){
    background(random(50, 500), random(50, 500), random(50, 500));}
  if(millis() >= 7000){
/////////////////////////////////
  
  
  
  scene1();
  
  
  
  
/////////////////////////////////
  if(millis() >= 30000){
    background(random(50, 500), random(50, 500), random(50, 500));}
  if(millis() >= 30400){
/////////////////////////////////
    
    
    
  scene2();
  
 
  
    }
  }
}
  
