/* 
  Tetris Reloaded
  Helen Jin
  Peter Strbik
*/
import java.util.*;
import java.io.*;

Grid playfield, storDisplay1, storDisplay2, storDisplay3, storDisplay4, nextPiece;
Queue<Shape> storage = new Queue<Shape>();
LNodeStack<Shape> Level = new LNodeStack<Shape>();
Tetromino curr;
Shape next;
Shape[] all = new Shape[7];
int stage;
int currentLevel = 1;
int numPieces;
int score = 0;
boolean beginning;
int counter = 0;


final int cyan = color(0,255,255);
final int blue = color(0,0,255);
final int orange = color(255,165,0);
final int yellow = color(255,255,0);
final int lime = color(0,255,0);
final int purple = color(148, 0, 211);
final int red = color(255,0,0);

void setup() {
  size(600, 850, P2D);
  all[0] = new Shape(lime, 4, new int[] {5,6,8,9});
  all[1] = new Shape(cyan, 4, new int[] {4,5,6,7});
  all[2] = new Shape(red, 4, new int[] {4,5,9,10});
  all[3] = new Shape(purple, 3, new int[] {1,3,4,5});
  all[4] = new Shape(blue, 3, new int[] {0,3,4,5});
  all[5] = new Shape(orange, 3, new int[] {2,3,4,5});
  all[6] = new Shape(yellow, 2, new int[] {0,1,2,3});
  int stage = 0;
  for (int i = 1; i < 21; i++){
    for (int j = 0; j < i * 10; j++){
      Level.push(all[(int)random(7)]);
    }
  }
  for (int j = 0; j < 4; j++){
    storage.enQueue(all[(int)random(7)]);
  }
  next = all[(int)random(7)];
  beginning = true;
  frameRate(60);
}

void draw() {
  background(31, 179,181);
  if (stage == 0){ //Main menu
    stroke(0);
    strokeWeight(3);
    score = 0;
    fill(red); //T
    rect(24, 24, 24, 24);
    rect(48, 24, 24, 24);
    rect(72, 24, 24, 24);
    rect(48, 48, 24, 24);
    rect(48, 72, 24, 24);
    rect(48, 96, 24, 24);
    rect(48, 120, 24, 24);
    fill(orange); //E
    rect(120, 24, 24, 24);
    rect(120, 48, 24, 24);
    rect(120, 72, 24, 24);
    rect(120, 96, 24, 24);
    rect(120, 120, 24, 24);
    rect(144, 24, 24, 24);
    rect(144, 72, 24, 24);
    rect(144, 120, 24, 24);
    rect(168, 24, 24, 24);
    rect(168, 72, 24, 24);
    rect(168, 120, 24, 24);
    fill(yellow); //T
    rect(216, 24, 24, 24);
    rect(240, 24, 24, 24);
    rect(264, 24, 24, 24);
    rect(240, 48, 24, 24);
    rect(240, 72, 24, 24);
    rect(240, 96, 24, 24);
    rect(240, 120, 24, 24);
    fill(lime); //R
    rect(312, 24, 24, 24);
    rect(312, 48, 24, 24);
    rect(312, 72, 24, 24);
    rect(312, 96, 24, 24);
    rect(312, 120, 24, 24);
    rect(336, 24, 24, 24);
    rect(336, 72, 24, 24);
    rect(348, 96, 24, 24);
    rect(360, 24, 24, 24);
    rect(360, 48, 24, 24);
    rect(360, 72, 24, 24);
    rect(360, 120, 24, 24);
    fill(cyan); //I
    rect(408, 24, 24, 24);
    rect(408, 120, 24, 24);
    rect(432, 24, 24, 24);
    rect(432, 48, 24, 24);
    rect(432, 72, 24, 24);
    rect(432, 96, 24, 24);
    rect(432, 120, 24, 24);
    rect(456, 24, 24, 24);
    rect(456, 120, 24, 24);
    fill(purple); //S
    rect(504, 24, 24, 24);
    rect(504, 48, 24, 24);
    rect(504, 72, 24, 24);
    rect(504, 120, 24, 24);
    rect(528, 24, 24, 24);
    rect(528, 72, 24, 24);
    rect(528, 120, 24, 24);
    rect(552, 24, 24, 24);
    rect(552, 72, 24, 24);
    rect(552, 96, 24, 24);
    rect(552, 120, 24, 24);
    textSize(40);
    textAlign(CENTER);
    text("RELOADED", 300, 200);
    text("Choose your Mode", 300, 400);
    fill(39,174,204);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 575 && mouseY >= 450){
      textSize(20);
      fill(0);
      text("Try your best to beat 20 levels \nthat progressively get more difficult", 300, 300);
      fill(245,250,18);
    }
    rect(100,450,400,125); //Levels
    fill(39,174,204);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 750 && mouseY >= 625){
      textSize(20);
      fill(0);
      text("See how long you can last in infinite Tetris", 300, 300);
      fill(245,250,18);
    }
    rect(100,625,400,125); //Infinite
    textSize(30);
    fill(0);
    text("Levels", 300, 520);
    text("Infinite", 300, 695); 
  }
  else if(stage == 1){ //Levels
    fill(255);
    textSize(40);
    if (currentLevel % 2 == 0){
      fill(255,31,31);
    }
    else{  
    fill(200,0,255);
    }
    text("TETRIS", 181, 45);
    fill(255);
    textSize(30);
    textAlign(LEFT);
    text("SCORE:" + score,25, 755);
    textAlign(CENTER);
    text("LEVEL:" + currentLevel, 285, 755);
    textSize(20);
    text("Next Piece", 479, 55);
    text("Storage Queue", 479, 250);
    textSize(15);
    text("Controls: UP↑ - Rotate | DOWN↓ - Move down | RIGHT→ - Move right | LEFT← - Move left\nS - Store current piece | SPACE - Drop", 0, 780, 400, 70);
    stroke(0);
    fill(143,255,31);
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 780 && mouseY >= 730){
      fill(245,250,18);
    }
    rect(425,730,150,50);
    fill(143,255,31);
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 840 && mouseY >= 790){
      fill(245,250,18);
    }
    rect(425,790,150,50);
    fill(0);
    text("Return to Menu", 500, 755);
    text("Pause", 500,815); 
    
    if (beginning){
      makeGrids();
      nextShape();
      beginning = false;
    }
    counter++;
    playfield.draw();
    storDisplay1.draw();
    storDisplay2.draw();
    storDisplay3.draw();
    storDisplay4.draw();
    nextPiece.draw();
    if (curr != null){
      curr.draw();
    }
    if (counter % (40 - (currentLevel - 1)*2) == 0){
      curr.stepDown();
    }
    next.view();
    updateStorage();
  }
  else if (stage == 2){ //Infinite
    fill(255);
    textSize(40);
    fill(200,0,255);
    text("TETRIS", 181, 45);
    fill(255);
    textSize(30);
    textAlign(LEFT);
    text("SCORE:" + score, 25, 755);
    textAlign(CENTER);
    textSize(20);
    text("Next Piece", 479, 55);
    text("Storage Queue", 479, 250);
    textSize(15);
    text("Controls: UP↑ - Rotate | DOWN↓ - Move down | RIGHT→ - Move right | LEFT← - Move left\nS - Store current piece | SPACE - Drop", 0, 780, 400, 70);
    stroke(0);
    fill(143,255,31);
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 780 && mouseY >= 730){
      fill(245,250,18);
    }
    rect(425,730,150,50);
    fill(143,255,31);
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 840 && mouseY >= 790){
      fill(245,250,18);
    }
    rect(425,790,150,50);
    fill(0);
    text("Return to Menu", 500, 755);
    text("Pause", 500,815); 
    if (beginning){
      makeGrids();
      nextShape();
      beginning = false;
    }
    counter++;
    playfield.draw();
    storDisplay1.draw();
    storDisplay2.draw();
    storDisplay3.draw();
    storDisplay4.draw();
    nextPiece.draw();
    if (curr != null){
      curr.draw();
    }
    if (counter % 15 == 0){
      curr.stepDown();
    }
    next.view();
    updateStorage();
    fill(255);
  }
  else if(stage == 3){ //GAME OVER
    beginning = true;
    strokeWeight(3);
    stroke(0);
    fill(200,0,255);
    textSize(50);
    text("GAME OVER", 300, 300);
    textSize(35);
    text("SCORE:" + score, 300,400);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      fill(245,250,18);
    }
    rect(100,500,400,125);
    fill(0);
    
    text("Return to Menu", 300, 570);
  }
  else if(stage == 4){ //WINNER
    beginning = true;
    strokeWeight(3);
    stroke(0);
    fill(200,0,255);
    textSize(50);
    text("YOU WIN!", 300, 300);
    textSize(35);
    text("SCORE:" + score, 300,400);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      fill(245,250,18);
    }
    rect(100,500,400,125);
    fill(0);
    
    text("Return to Menu", 300, 570);
  }
  else if(stage == 5){
    strokeWeight(3);
    stroke(0);
    fill(200,0,255);
    textSize(50);
    text("GAME PAUSED", 300, 300);
    textSize(35);
    text("SCORE:" + score, 300,400);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      fill(245,250,18);
    }
    rect(100,500,400,125);
    fill(0);
    
    text("Return to Game", 300, 570);
  }
  else if(stage == 6){
    strokeWeight(3);
    stroke(0);
    fill(200,0,255);
    textSize(50);
    text("GAME PAUSED", 300, 300);
    textSize(35);
    text("SCORE:" + score, 300,400);
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      fill(245,250,18);
    }
    rect(100,500,400,125);
    fill(0);
    
    text("Return to Game", 300, 570);
  }
  
}

void makeGrids(){
  playfield = new Grid(20, 75, 321, 642, 20, 10);
  nextPiece = new Grid(425, 75, 108, 108, 4, 4);
  storDisplay1 = new Grid(425, 285, 108, 108, 4, 4);
  storDisplay2 = new Grid(425, 393, 108, 108, 4, 4);
  storDisplay3 = new Grid(425, 501, 108, 108, 4, 4);
  storDisplay4 = new Grid(425, 609, 108, 108, 4, 4);
}

void storePiece(){
  storage.enQueue(curr.shape);
  curr = new Tetromino(storage.deQueue());
  updateStorage();
}

void updateStorage(){
  Queue<Shape> copy = new Queue<Shape>();
  for (int i = 0; i < 4; i++){
    copy.enQueue(storage.peek());
    storage.deQueue().storage(i+1);
  }
  storage = copy;
}

void nextShape(){
  if (stage == 1){
    curr = new Tetromino(Level.pop());
    numPieces++;
    if (numPieces / currentLevel == 10){
      currentLevel++;
      numPieces = 0;
    }
    
      
    if ( Level.peek() == null){
      stage = 4;
    }
    next = Level.peek();
    if (!curr.isValid(curr.shape.spaces, 3, -1)){
        stage = 3;
    }
  }
  else if(stage == 2){
    curr = new Tetromino(next);
    next = all[(int)random(7)];
    if (!curr.isValid(curr.shape.spaces, 3, -1)){
        stage = 3;
    }
  }
}

void resetLevel(){
  playfield.clear();
  currentLevel = 1;
  LNodeStack<Shape> uWotM8 = new LNodeStack<Shape>();
  Level = uWotM8;
  Queue<Shape> rekt = new Queue<Shape>();
  storage = rekt;
  for (int i = 1; i < 21; i++){
    for (int j = 0; j < i * 10; j++){
      Level.push(all[(int)random(7)]);
    }
  }
  for (int j = 0; j < 4; j++){
    storage.enQueue(all[(int)random(7)]);
  }
  nextShape();
}
    

void mouseClicked(){
  if (stage == 0){
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 575 && mouseY >= 450){
      stage = 1;
    }
    else if(mouseX <= 500 && mouseX >= 100 && mouseY <= 750 && mouseY >= 625){
      stage = 2;
    }
  }
  else if(stage == 1){
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 780 && mouseY >= 730){
      resetLevel();
      stage = 0;
    }
    else if (mouseX <= 575 && mouseX >= 425 && mouseY <= 840 && mouseY >= 790){
      stage = 5;
    }
  }
  else if(stage == 2){
    if (mouseX <= 575 && mouseX >= 425 && mouseY <= 780 && mouseY >= 730){
      resetLevel();
      stage = 0;
    }
    else if (mouseX <= 575 && mouseX >= 425 && mouseY <= 840 && mouseY >= 790){
      stage = 6;
    }
  }
  else if(stage == 3 || stage == 4){
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      resetLevel();
      stage = 0;
    }
  }
  else if(stage == 5){
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      stage = 1;
    }
  }
  else if(stage == 6){
    if (mouseX <= 500 && mouseX >= 100 && mouseY <= 625 && mouseY >= 500){
      stage = 2;
    }
  }
}

void keyPressed(){
  if (stage == 3 || stage == 0){
    return;
  }
  else if (key == CODED){
    if (keyCode == RIGHT){
      curr.goRight();
    }
    else if(keyCode == LEFT){
      curr.goLeft();
    }
    else if(keyCode == UP){
      curr.rotation();
    }
    else if(keyCode == DOWN){
      curr.stepDown();
    }
  }
  else if (key == 's'){
    storePiece();
  }
  else if (key == ' '){
    curr.holdOnThereBud();
  }  
}
      
