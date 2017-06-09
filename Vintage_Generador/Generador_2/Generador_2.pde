
int _num = 12;    
Cir[] pArr = new Cir[_num];

//_Valor_predet.

void setup() {
  fullScreen();
  smooth(); 

  restart();
}

void restart() {
  
  clearBackground();
  
  for (int i=0;i<_num;i++) {
    pArr[i] = new Cir(i);
    pArr[i].init(width/2, height + 250, random(height/2));
  }
  
}

void clearBackground() {
  background(255);
}
//_Loop

void draw() {
  for (int i=0;i<_num;i++) {
    pArr[i].update();
  }
}



//_Intrr.

void mousePressed() { 
  restart();
}


//_Obj


class Cir {
  int id;
  float angnoise, radiusnoise;
  float widnoise, heinoise;
  float angle = 180;
  float radius = 100;
  float centreX = width/2;
  float centreY = height/2;
  color strokeCol = color(255);
  float lastX = 9999;
  float lastY, lastAng;
  float swFactor = 1;
  float angle2;
  int cap = ROUND;
  float maxwid, maxrad;
  
  Cir (int num) {
    id = num;
  }
  
  void trace(String str) {
    println("Particle " + id + ": " + str);
  }
  
  void init(float ex, float why, float r) {
    trace("init");
    centreX = ex;
    centreY = why;
    radius = r;
     
    angle = 180;
    lastX = 9999;
    swFactor = 1;
    lastx = -999;
    
    angle2 = random(360);
  
    angnoise = random(10);
    radiusnoise = random(10);
    widnoise = random(10);
    heinoise = random(10);
    
      if (strokeCol != color(255)) { 
          strokeCol = color(255);
          cap = PROJECT;
          maxwid = 60;
      } else { 
          cap = ROUND;
          maxwid = 22;
          strokeCol = color(0);
          noStroke();
          fill(255,30);
          rect(0,0,width,height);
      }
    
  }
  
  void update() {
    radiusnoise += 0.005;
    radius = (noise(radiusnoise) * (width * 2));
    
    angle += 0.1;
    if (angle > 320) { 
      init(width/2, height + 50, random(height/2));
    } else {
      
      if (maxwid < 50) {
        swFactor -= 0.001;
      }
        
        centreY -= random(0.3) - 0.1;
        centreX += random(0.8) - 0.25;
        
        widnoise += 0.05;
        float wid = (noise(widnoise) * maxwid);
      
        float rad = radians(angle);
        float x1 = centreX + (radius * cos(rad));
        float y1 = centreY + (radius * sin(rad));
       
        stroke(strokeCol, 200);
        strokeCap(cap);
        
        if (swFactor > 0) {
          strokeWeight(wid * swFactor);
          if (lastX != 9999) {
            line(x1, y1, lastX, lastY);
          }
          lastX = x1;
          lastY = y1;
          lastAng = angle;
        }
        
        // bg
        if (int(angle * 100) % 1000 == 0) {
  
        strokeCap(PROJECT);
        int alphie = int(320 - angle);
          
        if (strokeCol == color(0)) {
          stroke(strokeCol, alphie*2);
          strokeWeight(0.4);
        } else {
          
            strokeWeight(100);
            
          if (strokeCol != color(255)) {
            stroke(200, alphie/4);
          } else {
            stroke(0,0,130, alphie/20);
          }
        }
        float rad2 = radians(angle);
      int numMultiples = int(random(12));
      float radVariance = swFactor * 340.0; 
      for (int i =0; i < numMultiples; i++) {
        radVariance *= sin(rad2);
      }
      float thisRadius = radius + radVariance;
      ex = centreX + (thisRadius * cos(rad));
      ey = centreY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(ex,ey,lastx,lasty);
      }
      lastx = ex;
      lasty = ey; 
        }
    }
    
  }
  
float lastx = -999;
float lasty = -999;
float ex, ey;
  
}