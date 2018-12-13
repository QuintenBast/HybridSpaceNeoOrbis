void scene1() {
  background(0);
  
  translate(width / 2, height / 2);
  float camX = map(xPosition+200, 0, width, -30, 30);
  float camY = map(yPosition+200, 0, height, -30, 30);
  camera(camX, camY, 0, 0, 0, -100, 0, 1, 0);
  stroke(255);
  strokeWeight(2); 
 
  noFill();
  for(float depth = 0; depth > -1500; depth -= objStep){
    pushMatrix();
    translate(0, 0, depth + distance % objStep);
    if(useRect){
      rect(0, 0, xPosition/3+400, 200);
    } else {
      ellipse(0, 0, yPosition+400, 200);
    }
  
    popMatrix();
  }
  
  distance += speed;
  if(distance > objStep){
    distance -= objStep;
  }
  
   if (myClient.available() > 0) { 
        
     String dataString = myClient.readString(); 
     
     if(dataString != "") {
     
       String[] list = split(dataString, ':');
     
       xPosition = Integer.parseInt(list[0]);
       yPosition = Integer.parseInt(list[1]);

     }
  }
}
