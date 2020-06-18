Cell[][] cells;
int cellSize = 10;
//const
int arraySizeX;
int arraySizeY;
boolean play = false;
boolean nowSpacePress = false;


void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  arraySizeX = width/cellSize;
  arraySizeY = height/cellSize;
  cells = new Cell[arraySizeX + 2][arraySizeY + 2];
  for(int y = 0; y < arraySizeY + 2; y++){
    for(int x = 0; x < arraySizeX + 2; x++){
      cells[x][y] = new Cell(0);
    }
  }
  drawCell(play);
  frameRate(1000);
}

void draw(){
  if(mousePressed){
    cells[int(mouseX/cellSize + 1)][int(mouseY/cellSize + 1)].v = 1;
    drawCell(false);
  }
  if(play){
    drawCell(true);
  }
  else{
    if(nowSpacePress){
      drawCell(true);
      nowSpacePress = false;
    }
  }
  
}

void keyPressed(){
  if(key == 'p'){
    play = !play;
  }
  if(key == ' '){
    nowSpacePress = true;
  }
}