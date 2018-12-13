void scene2() {
  background(255);
  
  translate(width / 2, height / 2);
  float camX = map(xPosition+200, 0, width, -30, 30);
  float camY = map(yPosition+200, 0, height, -30, 30);
  camera(camX, camY, 0, 0, 0, -100, 0, 1, 0);
  stroke(0);
  strokeWeight(2);
  
  noFill();
  
  for(float depth = 0; depth > -1500; depth -= objStep){
    pushMatrix();
    translate(0, 0, depth + distance % objStep);
    if(useRect){
  //     beginShape();
  //     vertex(0, -50);
  //      vertex(14, -20);
  //      vertex(47, -15);
  //      vertex(23, 7);
  //      vertex(29, 40);
  //      vertex(0, 25);
  //      vertex(-29, 40);
  //      vertex(-23, 7);
  //      vertex(-47, -15);
  //      vertex(-14, -20);
  //endShape(CLOSE);
      
      rect(0, 0, xPosition+400, 400);
    } else {
      ellipse(0, 0, yPosition+400, 400);
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
