# FinalProject
Annabelle and Mariya's Term 2 Final Project!


####Brief Description: 
Useful program that provides you with gadgets that will aid in computation and graphing of 
various mathematical equations. 
User will have three options:
- a standard calculator, 
- a matrix modifier (to return various functions on user-inputted matrices), 
- and a visual graphing device.

The goal is to attempt to mimic the key functions of a graphing calculator
with the addition of new abilities such as computation of matrices and tracing through graphs and their paths. 
Dealing with the various buttons can get tedious with the tiny buttons and incomprehensible abbreviations.
Our program will make math easier and enable you to clearly perceive graphs of not only functions, 
but parametric and polar equations as well. It will also be easier to 
input more complex equations, such as piecewise functions or circles/ellipses. 
In addition, the matrix calculator will go much further with matrices than conventional calculators do,
with the ability to calculate things such as rank, determinant, reduced echelon form, inverse, etc,
as well as basic matrix multiplication/addition.

####Potential Challenges:
Making the graph mutable, such as zooming in and out. 
Interpreting user input of equations   

####Minimum features:
- Overall:
  - Easy user interface
  - Having multiple windows for options and settings.
- Graphing:
  - User input of equation
  - Way to evaluate equation
  -Data structure to store points that need to be graphed
  - Computer output of graph
- Matrices:
  - User input of matrix
  - Methods to modify matrix
  - Output of modified matrix
- Expressions:
  - User input of expression
  - Evaluation of expression and output

####Roadmap:
1. Basic program to modify/evaluate expressions, equations, and matrices.
2. Interfaces to display output
3. Ways to take user input
4. Perfection 

####Development Log:
- before 5/22/15
  - figured out how to open new windows (!!)
  - basic graph functionality: creating graph layout, zooming in on origin
- 5/25/15
  - created "homepage" and "matrixStuff" branches
  - began working on algorithms for matrix stuff
  - created basic homepage that will eventually have buttons that lead to the different calculators
- 5/26/15
  - created "Graphing" branch
  - graph now zooms in AND out!
  - reduced echelon form now completely works (in java)
- 5/27/15
  - added typing stuff to Graphing (user can input equations)
  - attempted to make textboxes and stuff
  - transferred matrix stuff from java to processing
  - working on displaying matrices
- 5/28/15
  - fixed matrix display, ref stuff all works now (except for truncating numbers)
  - added way to open one file when you run another (but it doesn't run the newly opened file)
  - made settings menu for graph
- weekend of 5/29/15 - 5/31/15
  - big thing: merged all the stuff!!
  - linear equations are gucci, quadratic equations have begun but are super buggy
  - added homepage, it switches views based on what you click! woohoo
  - user now enters number of rows + columns they want for matrix
  - user can input linear equation + theoretically graph will output it (it worked in the past but the merge messed it up)  
- week of 6/1/15 - 6/5/15
  - figured out an easier way to toggle between screens, using an array of PApplets and an AppBase class. 
  - fixed evaluating fractions in equation. 
  - user can differentiate betweeen quadratic and linear inputs.
  - user can input up to 4 different funtions, each of which is graphed in a different color. 
- weekend of 6/6/15
  - opens new windows to display matrix and ref of matrix
  - need to create way to have user input matrix
- 6/8/15
  - matrix is displayed in a very nice-looking way, placed based on number of rows/cols
  - user can input values (but it doesn't store them yet lol oops)
  - rearranged homepage a little to look nicer/work more intuitively
  - ref displays values too! 
- 6/9/15
  - entry of equations works, just math is a little wacky
- 6/10/15
  - user entry of matrix values sticks!
  - ref calculates mostly correctly (truncating is a lil off, need to check matrix at the end)
  - the matrix changes when the ref does so need to disconnect those
  - basic polar graph display
- 6/11/15
  - disconnected REF of matrix and matrix so they no longer both change
  - ref doesn't calculate correctly so working on figuring that out
  - can almost graph polar functions (cosine automatically graphs but that will be gone in a bit)
- 6/13/15
  - working on functionality of close buttons
  - fixing REF
  - fixed bug where column # and row # were switched
  
  


#### THINGS TO DO
- entire expression calculator (probably not tho)
- more matrix functions (inverse, determinant etc)
- make "Close" buttons have functionality
- allow matrix to take doubles and negatives
- fix all the ref mistakes and stuff

#### THINGS ALREADY DONE
- display graph, zoom in and out
- basic display of matrix
- user entry of matrix values -- now the matrix keeps them!!
- scale matrix display based on dimensions
- reduced echelon form
- user input for size of matrix
- linear equation graphing
- quadratic equation graphing
- homepage looks pretty and works
- Toggling between sketch-screens.
- way to get back to homepage/switch between different functions (0,1,2)
- polar graphing!!! 
- buttons on homepage work when clicked
- matrix and REF of matrix are separate


#### WORKING DEMOS
6/1/15: Demo #1:
https://github.com/annabelleg/FinalProject.git

6/8/15: Demo #2:
https://github.com/annabelleg/FinalProject/tree/Demo6/8

