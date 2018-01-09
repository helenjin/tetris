/* 
  Tetris Remix
  Helen Jin
  Peter Stribk
*/
import java.util.*;
import java.io.*;

Grid playfield, storage, nextPiece;
Queue currLevel;
Stack storage;
Tetromino curr;
Shape next;
int speed;

final int cyan = color(0,255,255);
final int blue = color(0,0,255);
final int orange = color(255,165,0);
final int yellow = color(255,255,0);
final int lime = color(0,255,0);
final int purple = color(148, 0, 211);
final int red = color(255,0,0);
