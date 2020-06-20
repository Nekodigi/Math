float s = 10;//scale

void setup(){
  //size(500, 500);
  fullScreen();
  strokeWeight(5);
  noFill();
  
}

void draw(){
  background(255);
  s = map(mouseX, 0, width, 0.1, 10);
  translate(width/2, height/2);
  PVector npos = rectArcAt(new PVector(), 0, 1, 3);
  int a = 0, b = 1, c = 1;
  for(int i = 0; i < 20; i++){
    npos = rectArcAt(npos, a, b, i%4);
    c = a + b;
    a = b;
    b = c;
  }
}

PVector rectArcAt(PVector pos, int a, int b, int dir){
  PVector npos = new PVector();//(x, y)=pos, z = c
  int c = a + b;
  switch(dir){
    case 0:
      npos = pos.add(b, 0);
      rect(npos.x*s, npos.y*s, c*s, c*s);
      arc(npos.x*s, (npos.y+c)*s, c*s*2, c*s*2, HALF_PI*3, TWO_PI);
      break;
    case 1:
      npos = pos.add(-a, b);
      rect(npos.x*s, npos.y*s, c*s, c*s);
      arc(npos.x*s, npos.y*s, c*s*2, c*s*2, 0, HALF_PI);
      break;
    case 2:
      npos = pos.add(-c, -a);
      rect(npos.x*s, npos.y*s, c*s, c*s);
      arc((npos.x+c)*s, npos.y*s, c*s*2, c*s*2, HALF_PI, PI);
      break;
    case 3:
      npos = pos.add(0, -c);
      rect(npos.x*s, npos.y*s, c*s, c*s);
      arc((npos.x+c)*s, (npos.y+c)*s, c*s*2, c*s*2, PI, HALF_PI*3);
      break;
  }
  return npos;
}
