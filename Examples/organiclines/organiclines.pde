
int n=1500;
float [] cx=new float[n];
float [] cy=new float[n];
float [] cx1=new float[n];
float [] cy1=new float[n];
float theta=0;
color col;
void setup() {
 
  fullScreen();
  background(0);
  col = color (int(random (255)), int(random (255)), int(random (255)));
  for (int i=0;i<n;i++) {
    cx[i]=random(width);
  
    cy[i]=random(height);
    smooth();
  }
}
 
void draw() {
  theta+=0.6;
  strokeWeight(.03);
  
  for (int i=1;i<n;i++) {
    stroke(col);
    cy[i]+=(sin(TWO_PI*noise(0.01*cx[i], 0.01*cy[i])));
    cx[i]+=(cos(TWO_PI*noise(mouseX*cx[i], mouseY*cy[i])));
    point(cx[i], cy[i]);
   
    
  }
  
 
  if (frameCount>250) {
    frameCount= 0;
    for (int i=0;i<n;i++) {
      cx[i]=random(width+100);
      cy[i]=random(height+100);
    }
  }
}