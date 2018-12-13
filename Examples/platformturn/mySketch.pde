//glitching is intentional!

PImage screen;
PImage circleMask;
PImage blackCircle;

float circleScale;

float counter = 0.0;

float increment = 1.0;

//These timer numbers were chosen becauase they have a high lowest common multiple of 267477578823
//So the movements they control are all at slightly different frequencies and they shouldn't sync up again for 267,477,578,823 frames
float timeR = 553.0;
float timeRY = 507.0;
float timeRX = 469.0;
float timeTX = 377.0;
float timeTY = 491.0;

float amplitudeRY = 0.49;
float amplitudeRX = 0.49;

void setup() {
	size(1600, 900, P3D);
	background(0);

	circleMask = loadImage("WhiteCircle.jpg");
  blackCircle = loadImage("BlackCircle.png");

  counter = 0.0;

  circleScale = height * 0.9;
	
}

void draw() {
	
	screen  = get();
	
	noStroke();
	fill(255, 255, 255);

	//circleMask doesn't load until after the first few iterations of draw(), so this if() structure prevents errors when trying to use it as a mask
	if (circleMask.height == 900){


								background(128);
		
								screen.mask(circleMask);

								translate(width/2, height/2, -width/2);
								translate(((width/2.5) * pow(sin((counter/timeTX)*TWO_PI), 3)), ((height/12)  * pow(sin((counter/timeTY)*TWO_PI), 3)));
								rotate(PI * pow(sin(counter/timeR), 11));
								
								//This type of function makes the object rotate continuously but more slowly when it's straight on, at 0, pi, 2pi etc.
								//y(t) = slope*t + 0.5*sin(slope*2*t+PI)
								rotateY(((TWO_PI/timeRY) * counter) + (amplitudeRY * sin((counter * ((TWO_PI/timeRY)*2)) + PI)));
								rotateX(((TWO_PI/timeRX) * counter) + (amplitudeRX * sin((counter * ((TWO_PI/timeRX)*2)) + PI)));

								texture(blackCircle);

								beginShape();

									vertex(-1 * int(circleScale * (width / height) * 1.05), -1 * int(circleScale * 1.05), 0, 0, 0);
									vertex(int(circleScale * (width / height) * 1.05), -1 * int(circleScale * 1.05), 0, 1920, 0);
									vertex( int(circleScale * (width / height) * 1.05), int(circleScale * 1.05), 0, 1920, 1080);
									vertex(-1 * int(circleScale * (width / height) * 1.05), int(circleScale * 1.05), 0, 0, 1080);
								endShape(CLOSE);

								texture(screen);

								beginShape();

									vertex(-1 * int(circleScale * (width / height)), -1 * int(circleScale), 0, 0, 0);
									vertex( int(circleScale * (width / height)), -1 * int(circleScale), 0, width, 0);
									vertex( int(circleScale * (width / height)), int(circleScale), 0, width, height);
									vertex(-1 * int(circleScale * (width / height)), int(circleScale), 0, 0, height);
								endShape(CLOSE);

								counter += increment;
	}
}