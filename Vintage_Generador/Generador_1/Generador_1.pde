float t;
float col = 255;
static final int lin = 20;

void setup(){
background (20);
size(700,700);
strokeWeight(6);
}
void draw(){
background(0);
stroke(255);
translate(width/2, height/2);
for(int i = 0; i < lin; i++){
  float r =random(col);
  stroke (r);
line(x1(t+i), y1(t+i),x2(t+i), y2(t+i)); }
t += 0.4;
}

float x1(float t) {
return sin(t/10)*100 +sin(t/5)*20;
}

float y1(float t) {
return cos (t/10) * 100;
}

float x2(float t) {
return sin(t/10)*200 +sin(t)*2;
}

float y2(float t) {
return cos (t/20) * 200 +cos(t/12)*20;
}