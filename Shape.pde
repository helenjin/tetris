class Shape{
  int c;
  boolean[][] spaces;
  
  Shape(color c, int n, int[] b) {
    this.c = c;
    spaces = new boolean[n][n];
    for (int i=0; i < n; i++) {
      for (int j=0; j < n; j++) {
         spaces[i][j] = false;
      }
    }
    for (int k=0; k < b.length; k++) {
      spaces[b[k]%n][b[k]/n] = true;
    }   
  }
  
  Shape(Shape clone) {
    this.c = clone.c;
    spaces = new boolean[clone.spaces.length][clone.spaces.length];
    for (int i=0; i < spaces.length; i++) {
      for (int j=0; j < spaces.length; j++) {
        spaces[i][j] = clone.spaces[i][j];
      }
    }
  }
  
  void view(){
    if (spaces.length == 2){
      nextPiece.colorSquare(1,1,c);
      nextPiece.colorSquare(1,2,c);
      nextPiece.colorSquare(2,1,c);    
      nextPiece.colorSquare(2,2,c);
    }
    else if (spaces.length == 3){
      for (int i = 1; i < 4; i++){
        for (int j = 1; j < 4; j++){
          if (spaces[i-1][j-1]){
            nextPiece.colorSquare(i,j,c);
          }
        }
      }
    }
    else if (spaces.length == 4){
      for(int i = 0; i < 4; i++){
        for (int j = 0; j < 4; j++){
          if (spaces[i][j]){
            nextPiece.colorSquare(i,j,c);
          }
        }
      }
    }
  }
  
  void storage(int n){
    Grid meep = new Grid(0,0,1,1,1,1);
    if (n == 1){
      meep = storDisplay1;
    }
    else if (n == 2){
      meep = storDisplay2;
    }
    else if (n == 3){
      meep = storDisplay3;
    }
    else if (n == 4){
      meep = storDisplay4;
    }
    if (spaces.length == 2){
      meep.colorSquare(1,1,c);
      meep.colorSquare(1,2,c);
      meep.colorSquare(2,1,c);    
      meep.colorSquare(2,2,c);
    }
    else if (spaces.length == 3){
      for (int i = 1; i < 4; i++){
        for (int j = 1; j < 4; j++){
          if (spaces[i-1][j-1]){
            meep.colorSquare(i,j,c);
          }
        }
      }
    }
    else if (spaces.length == 4){
      for(int i = 0; i < 4; i++){
        for (int j = 0; j < 4; j++){
          if (spaces[i][j]){
            meep.colorSquare(i,j,c);
          }
        }
      }
    }
  }    
}
