Tetris Remix
Helen Jin and Peter Strbik
Spring 2015

This is a modified version of the classic game Tetris. We have two different modes of play: levels and infinite. In Levels mode, there are twenty successive levels you can play. To reach the next level, you must clear a certain number of Tetrominos. The required number increases as the level increases. In Infinite mode, you can play forever and ever. 
There are four storage spaces for four pieces, a preview box with the next incoming piece, and a general playing field where pieces are ultimately placed.

There are seven different pieces, all four squares but each with a unique color and shape. Each piece may randomly show up during the game. 
The goal of the game is to clear as many rows as possible and attain a higher score. In order to clear a row, all the spaces of a particular row must be filled with parts of pieces. 

Tetris Remix implements queues quite heavily. All of the pieces for a specific 'level' are generated beforehand and stored in a queue prior to the start. We also implement a storage queue for the player instead of single piece storage, which will also uses a queue.


