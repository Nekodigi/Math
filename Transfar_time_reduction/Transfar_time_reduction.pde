//parameter
float carS = 10;//km/h
float humanS = 40;//km/h
float t = 550./60;//h Humans depart t hours before the car arrives
float h = 0;//accumrated time
float dt = 0.001;//h

float carX = 0;//km
float humanX = 0;//km
float car2X = 0;//km
float human2X = 0;//km
int stage = 0;//before meet or after meet or arrived.
boolean meet = false;//case humans wait until the coming car.
boolean finish = false;
float t1, t2;

void setup(){
  size(1000, 500);
  humanX = width;
  human2X = width;
}

void draw(){
  background(0);
  for(int i = 0; i < 100; i++){
    h += dt;
    
    //case both people and cars move.(case 1)
    switch(stage){
      case 0:
        carX += carS*dt;
        if(carX > width-carS*t){
          humanX += -humanS*dt;
        }
        if(carX > humanX){//whether or not they met
          println(round(h*60)+"min (case 1 meet)");
          stage = 1;
        }
        break;
      case 1:
        carX += -carS*dt;
        humanX += -carS*dt;
        if(carX < 0){
          t2 = round(h*60);
          println(int(t2)+"min (case 1 finish)");
          stage = 2;
        }
    }
    
    //case humans wait until the coming car.(case 2)
    if(meet == false){
      car2X += carS*dt;
      if(car2X > human2X){//whether or not they met
        println(round(h*60)+"min (case 2 meet)");
        meet = true;
      }
    }else{
      car2X += -carS*dt;
      human2X += -carS*dt;
      if(car2X < 0){
        t1 = round(h*60);
        println(int(t1)+"min (case 2 finish)");
        finish = true;
      }
    }
    
    if(finish){
      //estimate reduction
      float te = t + t*(humanS - carS)/(carS + humanS);
      te *= 60;//convert to min
      println(int(te)+"min reduction(estimated)");
      
      println(int(t1-t2)+"min reduction");
      stop();
      break;
    }
    
    //display
    ellipse(carX, height/2+100, 50, 50);
    ellipse(humanX, height/2+100, 50, 50);
    ellipse(car2X, height/2-100, 50, 50);
    ellipse(human2X, height/2-100, 50, 50);
  }
}
