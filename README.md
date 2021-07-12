7/9/2021
What is the problem?
To build a Tic Tac Toe game that can be played by two people in the command line. 

Will the be an interface? No, there will only be a representation of the current game printed to the cmd.

WHat are the inputs? User or program submited? The inputs will come from the user(s). 

What is the desired output? For the program to register the user(s) moves.

Given

Idea : Use a two dimenstional array. One array contain three others, representing the rows and columns of a tic tac toe game. Display to the cmd a grid like layout of which numbers to enter for a certain spot on the grid, for example :  1 2 3
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

7/10/2021
Find out a way to determine the winner
I think the easiest thing to do first is to let the program know what the winning positions are. There are 8 possible winning aligments, and possible ties.
Those being : Top Row([0][0], [0][1], [0][2]), Left Column([0][0], [1][0], [2][0]), Left Diagonal([0][0], [1][1], [2][2]), Right Diagonal([0][2], [1][1], [2][0])
Middle Row([1][0], [1][1], [1][2]), Middle Column([0][1], [1][1], [2][1]), Bottom Row([2][0], [2][1], [2][1]), Right Column([0][2], [1][2], [2][2])

Is a 2d array the best idea? This can all be converted to a single array. A bit of work will be lost, but calling a win will be much easier and programming with a single array would be simplier. 
Where to start?
First set up the classes. The GridPosition class idea was very cool, so I'll keep that
Classes : TicTacToe, Player, GameBoard, GridPosition
What are the class purposes? What will do they specfically?
TicTacToe: The TicTacToe class is facilitate the entire playing experience. From starting the game to creating objects for other classes to recording the previous games played.
Player: The Player class will record the player's wins and loses, as well as storing the players symbol, i.e. X or O.
GameBoard: The GameBoard class will create instances that have an array(grid array) of 9 GridPosition objects, representing the 3x3 grid that tic tac toe is played on. It will have methods to check rather or not winning aligns have been formed. These positions(arrays of three integers) will be held within an array that is looped through each round. If the aligns are filled, but arent all matching characters then it will be removed from the array. Winning aligns are : [1, 2, 3], [1, 4, 7], [1, 5, 9], [3, 5, 7], [4, 5, 6], [2, 5, 8], [7, 8, 9], [3, 6, 9]
The GameBoard will prevent reuse of the same grid positions and display the grid array to the cmd.
GridPosition: The GridPosition class will create objects that are both meant for visiualing what positions are still avaliable to fill, but also provide functionality such as recording which grid positions are taken by who.

7/11/2021
Solve for the TicTacToe class. As I build out the tic tac toe class, make placeholder methods in other classes that will be built later.