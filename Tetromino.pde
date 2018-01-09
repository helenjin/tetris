class Tetromino{
  Shape shape;
  int x_cor, y_cor;
  int fin;
  
  
  Tetromino(Shape shape){
    this.shape = new Shape(shape);
    x_cor = 3;
    y_cor = -2;
    fin = getFin();
  }
  
  color getColor() {
    return shape.c;
  }
  
  void goLeft() {
    if (isValid(shape.spaces, x_cor-1, y_cor)) {
      x_cor--;
    }
    else if (isValid(shape.spaces, x_cor - 2, y_cor)){
      x_cor = x_cor - 2;
    }
    update();
  }
  
  void goRight() {
    if (isValid(shape.spaces, x_cor+1, y_cor)) {
      x_cor++;
    }
    else if (isValid(shape.spaces, x_cor + 2, y_cor)){
      x_cor = x_cor + 2;
    }
    update();
  }
  
  void goDown() {
   if (y_cor >= fin) {
     playfield.turnOver();
   }
   else {
     stepDown();
    }
  }
  
  void stepDown() {
    if (y_cor >= fin) {
      playfield.turnOver();
    }
    else {
     y_cor++;
    }
  }
  
  void holdOnThereBud(){
    y_cor = fin;
    playfield.turnOver();
  }
  
  void update() {
    fin = getFin();
  }
  
  int getFin() {
     for (int i = max(0, y_cor); i <= playfield.rows; i++) {
       if (!isValid(shape.spaces, x_cor, i)) {
         return i-1;
       }
     }
   return -1;  
  }
 
  boolean isValid(boolean[][] spaces, int c, int r) {
    for (int i=0; i < spaces.length; i++) {
      for (int j=0; j < spaces.length; j++) {
        if ( spaces[i][j] && playfield.isFilled(c + i, r + j)){
          return false;
        }
      }
    }
    return true;
  }
  
  void rotation(){
    boolean[][] rotShape = new boolean[shape.spaces.length][shape.spaces.length];
    for (int i = 0; i < rotShape.length; i++){
      for (int j = 0; j < rotShape.length; j++){
        rotShape[i][j] = shape.spaces[j][rotShape.length - 1 - i]; //clockwise rotation
      }
    }
    if (isValid(rotShape, x_cor, y_cor)){
      shape.spaces = rotShape;
      update();
    }
    else if (isValid(rotShape, x_cor + 1, y_cor) || isValid(rotShape, x_cor + 2, y_cor)){ //if rotated shape is out of bounds, move it back in bounds
      shape.spaces = rotShape;
      goRight();
    }
    else if (isValid(rotShape, x_cor - 1, y_cor) || isValid(rotShape, x_cor - 2, y_cor)){ //if rotated shape is out of bounds, move it back in bounds
      shape.spaces = rotShape;
      goLeft();
    }
  }
  
  void draw(){
    for (int i = 0; i < shape.spaces.length; i++){
      for (int j = 0; j < shape.spaces.length; j++){
        if (shape.spaces[i][j]){
          playfield.colorSquare(x_cor + i, y_cor + j, shape.c);
        }
      }
    }
  }
}
