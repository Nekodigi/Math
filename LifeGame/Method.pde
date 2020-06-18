void drawCell(boolean update){
  Cell[][] tcells = new Cell[arraySizeX+2][arraySizeY+2];
  for(int y = 0; y < arraySizeY + 2; y++){
    for(int x = 0; x < arraySizeX + 2; x++){
      tcells[x][y] = new Cell(cells[x][y]);
    }
  }
  for(int y = 1; y < arraySizeY + 1; y++){
    for(int x = 1; x < arraySizeX + 1; x++){
      if(update){
        int liveCell = 0;
        liveCell += cells[x - 1][y - 1].v;
        liveCell += cells[x - 1][y].v;
        liveCell += cells[x - 1][y + 1].v;
        liveCell += cells[x][y - 1].v;
        //liveCell += cells[x][y].v;
        liveCell += cells[x][y + 1].v;
        liveCell += cells[x + 1][y - 1].v;
        liveCell += cells[x + 1][y].v;
        liveCell += cells[x + 1][y + 1].v;
        if(liveCell == 3 && cells[x][y].v == 0){
          tcells[x][y].v = 1;
        }
        else if((liveCell == 2 || liveCell == 3) && cells[x][y].v == 1){}
        else{
          tcells[x][y].v = 0;
        }
      }
      fill(360 - cells[x][y].v*360);
      rect(x*cellSize - cellSize, y*cellSize - cellSize, cellSize, cellSize);
    }
  }
  cells = tcells;
}