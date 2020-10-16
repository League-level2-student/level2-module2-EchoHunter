//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x1;
int y1;

// Add a constructor with parameters to initialize each variable.
x1 = 0;
y1 = 0;


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

    float foodX =(500);
    float foody = (500);
    


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {

}

void dropFood() {
  //Set the food in a new random location
    
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  
}

void drawFood() {
  //Draw the food
  fill(255,0,0);
    rect (foodX, foody, 45,45);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
fill(0,255,0);
rect(25,0,45,45);
rect(70,0,180,45);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
rect(mouseX,mouseY,180,45);
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  rect(250,0,180,45);
  background(0,0,0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    /*
  switch(direction) {
  case UP:
    // move head up here 
    break;
  case DOWN:
    // move head down here 
    break;
  case LEFT:
   //figure it out 
   break;
  case RIGHT:
    // mystery code goes here 
    break;
 }
  */
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear

}
