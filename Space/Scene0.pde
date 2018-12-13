void scene0() {
  useRect = true;
  
  noStroke();
  fill(255);
  background(random(50, 500), random(50, 500), random(50, 500));

  if(millis() >= 1000){
    
    background(0);
  
  for (int j=60; j<1200; j=j+24) {
    for (int i=24; i<1200; i=i+24) {
    rect(random(j/2)+cos(frameCount*6*j)*(j+i), j-i, 50, 1);
      }
    }
  }
}
