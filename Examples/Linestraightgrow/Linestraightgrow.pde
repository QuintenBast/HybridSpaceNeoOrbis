
float sides = 6;
float delay = 20;

color bg = color(0);
color fg = color(230);

float targetFps = 30;


void setup() {
  fullScreen();
  strokeWeight(6);
  frameRate(targetFps);
}

int[] primes = {2, 3, 5, 7, 11, 13};

float nowSide = 0;
float remain = 0;
float[] xs = new float[500];
float[] ys = new float[500];

float x = 0, y = 0;
float ptx = x, pty = y, tx = x, ty = y;
float number = 0;
float rot = 0;
float zoom = 0;
void draw() {
  if(mousePressed)  {
    zoom+=(0.6-zoom)/16;
  } else  {
    zoom+=(1-zoom)/16;
  }
  ptx+=(x-ptx)/64;
  pty+=(y-pty)/64;  
  tx+=(ptx-tx)/64;
  ty+=(pty-ty)/64;
  background(bg);
  rot+=0.0010;

  translate(width/2, height/2);
  rotate(rot);
  scale(zoom);

  translate(-tx, -ty);
  number += ((float)xs.length - number)/30;
  stroke(lerpColor(bg, fg, 0.8));
  for (int i = 0; i<xs.length-1; i++) {
    line(xs[i], ys[i], xs[i+1], ys[i+1]);
  }

  stroke(fg);
  int last = xs.length-1;
  if (last>=0) {
    float v = 1-remain/delay;
    line(xs[last], ys[last], 
      lerp(xs[last], x, v), 
      lerp(ys[last], y, v));
  }
  
  remain--;
  if (remain<=0) {
    delay += (5-delay)/32; 
    
    for(int i = 0; i<xs.length-1; i++)  {
      xs[i] = xs[i+1];
      ys[i] = ys[i+1];
    }

    xs[xs.length-1] = x;
    ys[ys.length-1] = y;
    int magnitude = primes[(int)random(primes.length)] * 20;
    nowSide = (nowSide+1)%sides;
    if(nowSide<0.1)  {
      magnitude+=30;
    }
    x+=cos(TWO_PI*(float)nowSide/sides)*magnitude;
    y+=sin(TWO_PI*(float)nowSide/sides)*magnitude;
    remain = delay;
  }
}