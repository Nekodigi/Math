//based on this site https://ja.wikipedia.org/wiki/%E9%AD%94%E6%96%B9%E9%99%A3

int n = 201;//n have to be odd number
float w;//cell width

void setup(){
  //size(500, 500);
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  textAlign(LEFT, TOP);
}

void draw(){
  background(360);
  n = 2*(int)map(mouseX, 0, width, 1, 50)+1;
  w = float(height)/(n+n-1);
  textSize(w/2);
  noStroke();
  for(int i=0; i<n; i++){
    for(int j=0; j<n; j++){
      PVector pos = new PVector(width/2+i*w-j*w-w/2, i*w+j*w);
      //move protruding part
      if(mousePressed){
        if(i+j<n/2)pos.add(0, float(height)/(n+n-1)*(n));
        if(i-j>n/2)pos.add(-float(height)/(n+n-1)*(n), 0);
        if(i+j>=n+n/2)pos.add(0, -float(height)/(n+n-1)*(n));
        if(i-j<-n/2)pos.add(float(height)/(n+n-1)*(n), 0);
      }
      
      int num = i+j*n+1;
      float hue = map(num, 1, n*n, 0, 360);
      fill(hue, 100, 100);
      rect(pos.x, pos.y, w, w);
      fill(360);
      text(num, pos.x, pos.y);
    }
  }
}
