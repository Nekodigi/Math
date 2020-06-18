float resolution = 100;
float relim = 16;
float scale=1000;
double xoff = 0;
double yoff = 0;
double oldMouseX;
double oldMouseY;
boolean render = false;
boolean julia = false;
int pixelSize = 10;
//press r > render
//press j > toggle julia

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw(){
  if(mousePressed){
    xoff+=(oldMouseX-mouseX)/scale;
    yoff+=(oldMouseY-mouseY)/scale;
  }
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  double ca = map(mouseX, 0, width, -1, 1);
  double cb = map(mouseY, 0, height, -1, 1);
  noStroke();
  for(int q = 0; q < width; q+=pixelSize){
    for(int w = 0; w < height; w+=pixelSize){
      double x = ((double)q-width/2)/scale+xoff;
      double y = ((double)w-height/2)/scale+yoff;
      int i = 0;
      if(!julia){
        ca = ((double)q-width/2)/scale+xoff;
        cb = ((double)w-height/2)/scale+yoff;
      }
      while(i < resolution){
        double xx = x*x;
        double yy = y*y;
        double twoxy = 2*x*y;
        x = xx - yy + ca;
        y = twoxy + cb;
        if(xx + yy > relim){
          break;
        }
        i++;
      }
      if(i == resolution){
        fill(0);
      }
      else{
        fill(sqrt(float(i)/resolution)*360, 100, 100);
      }
      rect(q, w, pixelSize, pixelSize);
    }
  }
}

void keyPressed(){
    if(key=='r'){
      render = !render;
      if(render){
        pixelSize = 1;
      }
      else{
        pixelSize = 10;
      }
    }
    if(key=='j'){
      julia = !julia;
    }
    if(keyCode==UP){
      scale *= 1.1;
    }
    else if(keyCode==DOWN){
      scale *= 0.9;
    }
}
void mouseWheel(MouseEvent e ){
  if( e.getAmount() < 0 ){
    scale *= 1.1;
  } else {
    scale *= 0.9;
  }
}