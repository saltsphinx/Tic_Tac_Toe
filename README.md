What is the problem?
To build a Tic Tac Toe game that can be played by two people in the command line. 

Will the be an interface? No, there will only be a representation of the current game printed to the cmd.

WHat are the inputs? User or program submited? The inputs will come from the user(s). 

What is the desired output? For the program to register the user(s) moves.

Given

Idea : Use a two dimenstional array. One array contain three others, representing the rows and columns of a tic tac toe game. Display to the cmd a grid like layout of which numbers to enter for a certain spot on the grid, for example : 1 2 3
                                4 5 6
                                7 8 9

To try to incorparate OOP, make each tic tac toe game an instance of the TicTacToe class that can record the results of each game played, and a new object made each game. 

Where to start first?
First find out how the game will be started.
The TicTacToe class is the simplest thing to start with
In the initialize instance method, have two instance variables
named player_one and player_two. 
player_one decides rather they want to play as nought or cross, and
their decision decides player_two's character

There should be a Player class that records the players wins and loses.

The players will be able to enter a number between 1 and 9, representing position on the grid. There needs to be a way to convert this into array indexes. (n = the users entered grid position, i is indexes in the containing array, and j is indexes the column array) First 1 needs to be subtracted from n (if 1 is n, it would be equal to 0. if 9 is n, it would be 8). Every multiple of three equals i+1, with i+2 being the highest possible. Any remainder will added to j. For example :
n = 7, 2 multiples of three so i = 2, [2][0]
7 - 6, 1 remainder so j = 1, [2][1]
