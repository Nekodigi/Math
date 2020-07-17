float a, b, c;
float r1, r2;
float d;//distance to circle
PVector A, B, C, C2;
float min;//minimum d

void setup(){
  size(1000, 1000);
  strokeWeight(5);
  strokeJoin(ROUND);
  noFill();
  
  r1 = 100;
  r2 = 150;
  A = new PVector(400, 700);
  B = new PVector(600, 500);
}

void draw(){
  background(255);
  r1 = map(mouseY, 0, height, 0, 200);
  //show A, B
  ellipse(A.x, A.y, r1*2, r1*2);
  ellipse(B.x, B.y, r2*2, r2*2);
  //show Apollonius graph
  apolloniusGraph(r1, r2, A, B);
  //show point on apollonius graph for visualization
  d = pow(map(mouseX, 0, width, 0, 50), 2) + min;
  
  b = r1 + d;
  a = r2 + d;
  float c = A.dist(B);
  PVector u = PVector.sub(B, A).normalize();
  PVector v = new PVector(-u.y, u.x);
  float cosA = (b*b + c*c - a*a)/(2*b*c);//using law of cosine
  float sinA = sqrt(1-cosA*cosA);
  C = UVmap(u, v, cosA*b, sinA*b).add(A);
  C2 = UVmap(u, v, cosA*b, -sinA*b).add(A);
  
  //to show point is eqidistant to circle
  ellipse(C2.x, C2.y, 10, 10);
  float cosB = (a*a + c*c - b*b)/(2*a*c);//using law of cosine
  float sinB = sqrt(1-cosB*cosB);
  PVector ca1 = UVmap(u, v, cosA*r1, -sinA*r1).add(A);
  PVector cb1 = UVmap(u, v, -cosB*r2, -sinB*r2).add(B);
  ellipse(ca1.x, ca1.y, 10, 10);
  ellipse(cb1.x, cb1.y, 10, 10);
  triangle(A.x, A.y, B.x, B.y, C2.x, C2.y);
  stroke(255, 0, 0);
  line(C2.x, C2.y, ca1.x, ca1.y);
  line(C2.x, C2.y, cb1.x, cb1.y);
  stroke(0);
  //point(C2.x, C2.y);
}

PVector UVmap(PVector ua, PVector va, float ux, float vx){//u axis, v axis, u value, x value
  return PVector.mult(ua, ux).add(PVector.mult(va, vx));
}

void apolloniusGraph(float r1, float r2, PVector A, PVector B){
  int res = 20;
  
  float c = A.dist(B);
  PVector u = PVector.sub(B, A).normalize();
  PVector v = new PVector(-u.y, u.x);
  float min = (c - (r1 + r2))/2;
  
  beginShape();
  for(int i=0; i<=res; i++){
    float d = pow((res-i)*2, 2) + min;
    
    float b = r1 + d;
    float a = r2 + d;
    
    float cosA = (b*b + c*c - a*a)/(2*b*c);//using law of cosine
    float sinA = sqrt(1-cosA*cosA);
    PVector C = UVmap(u, v, cosA*b, sinA*b).add(A);
    vertex(C.x, C.y);
  }
  
  for(int i=0; i<=res; i++){
    float d = pow(i*2, 2) + min;
    
    float b = r1 + d;
    float a = r2 + d;
    
    float cosA = (b*b + c*c - a*a)/(2*b*c);//using law of cosine
    float sinA = sqrt(1-cosA*cosA);
    
    PVector C = UVmap(u, v, cosA*b, -sinA*b).add(A);
    vertex(C.x, C.y);
  }
  endShape();
}
