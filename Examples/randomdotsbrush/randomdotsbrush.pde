float x;
float y;
float xSpeed=0;
float ySpeed=0;
float mRate=20;
float d=0;

void setup(){
	fullScreen();
	x=width/2;
	y=height/2;
	background(200);
}

void draw(){
	x=x+xSpeed;
	y=y+ySpeed;
	xSpeed=random(-mRate,mRate);
	ySpeed=random(-mRate,mRate);
	d=random(50);
	
	stroke(255);
	fill(0);
	ellipse(x,y,d,d);
	check();
}

void check(){
	if(x<d/2){
		x=width-d/2;
	}
	if(x>width-d/2){
		x=d/2;
	}
	if(y<d/2){
		y=height-d/2;
	}
	if(y>height-d/2){
		y=d/2;
	}
}






