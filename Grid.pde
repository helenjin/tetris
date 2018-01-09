class Grid{
  int x_cor, y_cor;
  int wid, hit;
  int rows, cols;
  int[][] colors;
  ArrayList<Integer> cleared = new ArrayList<Integer>();
  
  
  
  Grid(int x, int y, int wid, int hit, int rows, int cols){
    this.x_cor = x;
    this.y_cor = y;
    this.wid = wid;
    this.hit = hit;
    this.rows = rows;
    this.cols = cols;
    colors = new int[cols][rows];
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        colors[i][j] = 0;
      }
    }
  }
  
  void clear(){
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        colors[i][j] = 0;
      }
    }
  }

  void colorSquare(int col, int row, color c){
    if (col < 0 || col >= cols || row < 0 || row >= rows){
      return;
    }
    noStroke();
    fill(c);
    rect(x_cor + col*(wid/cols), y_cor + row*(hit/rows), wid/cols, hit/rows);
  }
  
  boolean check(){
    cleared.clear();
    for (int j = 0; j < rows; j++) {
      int count = 0;
      for (int i = 0; i < cols; i++){
        if (isFilled(i, j)){
          count++;
        }
      }
      if (count >= cols){
        cleared.add(j);
      }
    }
    if (cleared.isEmpty()){
      return false;
    }
    int Nscore;
    if (cleared.size() == 1){
      Nscore = 100;
    }
    else if (cleared.size() == 2){
      Nscore = 300;
    }
    else if (cleared.size() == 3){
      Nscore = 600;
    }
    else{
      Nscore = 1000;
    }
    score += Nscore;
    return true;
  }
  
  boolean isFilled(int x, int y) {
    if (y < 0 && x < cols && x >= 0){
      return false;
    }
    return (x >= cols || x < 0 || y >= rows || colors[x][y] != 0);
  }
  
  void wait(int ms){
    try{
      Thread.sleep(ms);
    }
    catch(Exception e){
    }
  }
  
  void turnOver(){
   for (int i = 0; i < curr.shape.spaces.length; ++i)
      for (int j = 0; j < curr.shape.spaces.length; ++j)
        if (curr.shape.spaces[i][j] && j + curr.y_cor >= 0)
          colors[i + curr.x_cor][j + curr.y_cor] = curr.getColor();
    if (check()) {
      curr = null;
      for (int i : cleared){
        for(int j = 0; j < cols; j++){
          colorSquare(i, j, 255);
        }
      }
      wait(200);
      for (int i : cleared){
        for(int j = 0; j < cols; j++){
          colorSquare(i,j,0);
        }
      }
      erase();
      nextShape();
    } else
      nextShape();
  }
  
  void erase(){
    for (int i : cleared){
      for (int j = i - 1; j > 0; j--){
        int[] blah = new int[cols];
        for (int k = 0; k < cols; k++){
          blah[k] = colors[k][j];
        }
        for (int k = 0; k < cols; k++){
          colors[k][j+1] = blah[k];
        }
      }
    }
  }
  
  void draw(){
    stroke(255);
    strokeWeight(4);
    rect(x_cor, y_cor, wid, hit);
    for (int i = 0; i < cols; i++){
      for (int j = 0; j < rows; j++){
        colorSquare(i, j, colors[i][j]);
      }
    }
  }  
}
