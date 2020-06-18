

void setup(){
  fullScreen();
  noStroke();
  //print(sin(PI));
  for(float i = 0; i < width; i++){
    fill(255);
    ellipse(i, sin(i / 100)*100 + height/2, 10, 10);
    for(int a = 0; a < 16; a+=5){
      fill(0+a*10);
      ellipse(i, appro(i / 100, a)*100 + height/2, 10, 10);
    }
  }
}

float appro(float x, int lv){
  float result = 0;
  for(int i = 1; i < lv; i++){
    result += sin((float)i/2*PI)*pow(x, i)/factorial(i);
  }
  return result;
}

float factorial(int x){
  int result = x;
  for(int i = x - 1; i > 0; i--){
    result *= i;
  }
  return result;
}