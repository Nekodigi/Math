class Cell{
  Cell(int iv){
    //b = ib;
    v = iv;
  }
  
  Cell(Cell cell){
    v = cell.v;
  }
  //float b;
  float v;
}