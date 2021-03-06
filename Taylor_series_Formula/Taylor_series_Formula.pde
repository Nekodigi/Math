float[] coeff;//coefficient x^2+x+c 
//float[] coeffs = {1, 2, 1, 3};
float a = 5;
float minS = -6, maxS = 6;

void setup(){
  size(500, 500);
  //fullScreen();
}

void draw(){
  background(255);
  a = map(mouseX, 0, width, minS, maxS);
  textSize(20);
  textAlign(LEFT, TOP);
  fill(0);
  text("a="+a, 0, 0);
  coeff = solveCoeff(10, a);
  //視覚化
  noFill();
  strokeWeight(10);
  //本当のSinX
  stroke(200);
  beginShape();
  for(int i = 0; i < width; i++){
    float x = map(i, 0, width, minS, maxS);
    float val = sin(x);
    vertex(i, height/2-val*height/6);
  }
  endShape();
  //推定したSinX
  stroke(0);
  beginShape();
  for(int i = 0; i < width; i++){
    float x = map(i, 0, width, minS, maxS);
    float val = polyValue(x, coeff);
    vertex(i, height/2-val*height/6);
  }
  endShape();
}

float[] solveCoeff(int n, float a){
  float[] coeff = new float[n+1];//0<=k<=nだから
  for(int k=0; k<=n; k++){
    float N = factorial(k);
    coeff[n-k] = Xsin(k,a)/N;
    
  }
  return coeff;
}


float polyValue(float x, float[] coeff){//多項式に数値を代入した結果を求めます。
  float sum = 0;
  float k = x-a;
  for(int i = 0; i<coeff.length; i++){
    int p = coeff.length - i - 1;
    sum += coeff[i] * pow(k, p);
  }
  return sum;
}

long factorial(int a){//
  int result = 1;
  for(int i = 1; i <= a; i++){
    result *= i;
  }
  return result;
}

float Xsin(int n,float x){//x sin differential
  return sin((float)n/2*PI+x);
}
