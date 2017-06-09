int num = 2;
int step = 10;
float centx, centy;
Partic[] pArr;


//_valor_predet.
void setup() {
  fullScreen();
  frameRate(12);
  clearBackground();
  smooth();
  
  centx = width/2;
  centy = height/2;
  
  pArr = new Partic[num];
  for (int i=0;i<num;i++) {
    pArr[i] = new Partic(i);
  }
}

void clearBackground() {
  background(255);
  //_fondo_papel
  int gap = 10;
  strokeWeight(1);
  stroke(140, 40);
  for (int x=0;x<width;x+=gap) {
     line(x, 0, x, height);
  }
  for (int y=0;y<height;y+=gap) {
    line(0, y, width, y);
  } 
}

//_Loop

void draw() {
  // nuevo_back
  for (int i=0;i<num;i++) {
    pArr[i].update();
  }
}

//_Intrr.

void mousePressed() { 
  clearBackground();
  centx = mouseX;
  centy = mouseY;
  for (int i=0;i<num;i++) {
    pArr[i].init();
  }
}

//_Obje

class Partic {
  int id;
  int count, life, step;
  float origx, origy;
  float x1, y1, x2, y2;
  int rd, gr, bl, alph;
  float angle, radius;
  
  Partic (int num) {
    id = num;
    init();
  }
  
  void trace(String str) {
    println("Partic " + id + ": " + str);
  }
  
  void init() {
    trace("init");
    count = 0;
    step = 10;
    life = 720;
    radius = random(width * 2) + 50;
    
    origx = centx + (radius * cos(angle));
    origy = centy + (radius * sin(angle));
    x1 = origx;
    y1 = origy;
    
    rd = int(random(255));
     gr = int(random(255));
     bl = int(random(255));
    bl = gr = rd;  // grey
  }
  
  void update() {
    count += step;
    angle = count; 
    // _dibujar2_nuevo
    x2 = centx + (radius * cos(angle));
    y2 = centy + (radius * sin(angle));
    //_dibujar
    strokeWeight(1);
    stroke(rd, gr, bl);
    line(x1, y1, x2, y2);
    //reinicio
    x1 = x2; y1 = y2;   
    if (count >= life) { init(); }
  }
  
}