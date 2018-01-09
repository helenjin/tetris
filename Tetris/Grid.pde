class Grid{
  int x_cor, y_cor;
  int wid, hit;
  int rows, cols;
  int[][] colors;
  
  Grid(int x, int y, int wid, int hit, int rows, int cols){
    this.x-cor = x;
    this.y-cor = y;
    this.wid = wid;
    this.hit = hit;
    this.rows = rows;
    this.cols = cols;
    colors = new int[rows][cols];
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        colors[i][j] = 0;
      }
    }
  }
  
  void clear(){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        colors[i][j] = 0;
      }
    }
  }

  boolean isValid(int row, int col){
    if (col < 0 || col >= cols || row < 0 || row >= rows){
      return false;
    }
    else{
      return true;
    }
  }

  void colorSquare(int row, int col, color c){
    if (!isValid(row, col)){
      return;
    }
    noStroke();
    fill(c);
    rect(x_cor + col*(wid/cols), y + row*(hit/rows), wid/cols, hit/rows);
  }
  
  

    
  
  
}
