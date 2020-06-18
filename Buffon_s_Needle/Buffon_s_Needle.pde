ArrayList<Stick> sticks = new ArrayList<Stick>();
ArrayList<Line> lines = new ArrayList<Line>();
float l = 50, d = 2*l;
float ntest, ninter;

void setup(){
  size(500, 500);
  //fullScreen();
  for(int i = 0; i <= height; i+=d){
    lines.add(new Line(i));
  }
  strokeWeight(10);
}

void draw(){
  background(255);
  //add stick
  for(int i = 0; i < 10; i++){
    Stick stick = new Stick();
    stick.ckInter();
    sticks.add(stick);
  }
  //visualize
  for(Stick stick : sticks){
    stick.show();
  }
  stroke(0);
  for(Line line : lines){
    line.show();
  }
  fill(255);
  noStroke();
  rect(0, 0, 500, 100);
  textSize(50);
  fill(0);
  textAlign(LEFT, TOP);
  text("1/PI="+(1/PI), 0, 0);
  text("P="+ninter/ntest, 0, 50);
}

class Stick{
  PVector spos, epos;
  boolean inter = false;//intersect
  
  Stick(){
    spos = new PVector(random(l, width-l), random(l, height-l));
    epos = PVector.fromAngle(random(TWO_PI)).mult(l).add(spos);
  }
  
  void ckInter(){//check intersect
    ntest++;
    for(Line line : lines){
      if(spos.y < line.y && epos.y > line.y || spos.y > line.y && epos.y < line.y){
        inter = true;
        ninter++;
      }
    }
  }
  
  void show(){
    if(inter)stroke(255, 0, 0);
    else stroke(0);
    line(spos.x, spos.y, epos.x, epos.y);
  }
}

class Line{
  float y;
  
  Line(float y){
    this.y = y;
  }
  
  void show(){
    line(0, y, width, y);
  }
}
