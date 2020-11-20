// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {
Segment(int x2, int y2){
  x1 = x2;
  y1 = y2;
fill(0,255,0);
rect(x1,y1,25,25);
}
//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x1;
int y1;

// Add a constructor with parameters to initialize each variable.
}





//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
ArrayList<Segment> body = new ArrayList<Segment>();
ArrayList<Segment> food = new ArrayList<Segment>();
ArrayList<Segment> head = new ArrayList<Segment>();
    float foodX;
    float foodY;
   int fX = int(foodX);
   int fY = int(foodY);
int snakeX = 500;
int snakeY = 500;
int direct = UP;
int stomach = 0;
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(1000,1000);
frameRate(20);
drawSnake();
dropFood();
head.add(new Segment(snakeX, snakeY));
}

void dropFood() {
  //Set the food in a new random location
   if(food.size()>0){
     food.remove(0);
   }
    foodX = (int)random(40)*25;
     foodY = (int)random(40)*25;
    fX = int(foodX);
    fY = int(foodY);
    food.add(new Segment(fX, fY));
     print(fX, fY);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
 move();
 checkBoundaries();
 drawSnake();
 eat();
 drawFood();
manageTail();

}

void drawFood() {
  //Draw the food
  fill(255,0,0);
    food.add(new Segment(food.get(0).x1, food.get(0).y1));
    food.remove(0);
     foodX = random(500);
     foodY = random(500);
    fX = int(foodX);
    fY = int(foodY);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
if(head.size()>0){
rect(head.get(0).x1, head.get(0).y1, 25,25);
if(body.size() > 0){
drawTail();
}
else if(body.size()== 0){
body.add(new Segment(head.get(0).x1, head.get(0).y1+25));
}
}
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int g=0; g <body.size(); g++){
rect(body.get(g).x1, body.get(g).y1, 25, 25);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
if(body.size()-1 >0){
checkTailCollision();
}
drawTail();
body.add(new Segment(head.get(0).x1, head.get(0).y1));
body.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i = 0; i< body.size()-2; i++){
if((head.get(0).x1 == body.get(i).x1)&& (head.get(0).y1 == body.get(i).y1)){
 for(int x = body.size()-1; x >1; x--){
   body.remove(x);
 }
}
}


}

    
 




//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*


  //Set the direction of the snake according to the arrow keys pressed
 void keyPressed(){
   if(key== CODED){
     if ((keyCode == UP )&& (direct != DOWN)){
       direct = (UP);
     }
     else if ((keyCode == DOWN)&& (direct != UP)){
      direct = (DOWN);
     }
     else if ((keyCode == LEFT)&& (direct != RIGHT)){
       direct = (LEFT);
     }
     else if ((keyCode == RIGHT)&& (direct != LEFT)){
       direct = (RIGHT);
     }
 }
 }


void move() {
  //Change the location of the Snake head based on the direction it is moving. 
  switch(direct) {
  case UP:
    head.add(new Segment(head.get(0).x1,head.get(0).y1-25));
    head.remove(0);
    break;
  case DOWN:
    head.add(new Segment(head.get(0).x1, head.get(0).y1+25));
    head.remove(0);
    break;
  case LEFT:
  head.add(new Segment(head.get(0).x1-25, head.get(0).y1));
    head.remove(0);
   break;
  case RIGHT:
     head.add(new Segment(head.get(0).x1+25, head.get(0).y1));
    head.remove(0);
    break;
 
 }
 
 
 
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if((head.get(0).x1)<0){
   
   head.add(new Segment (1000,(head.get(0).y1)));
   head.remove(0);
 }
 else if((head.get(0).x1)>1000){
  
  head.add(new Segment(1,(head.get(0).y1)));
  head.remove(0);
 }
 if((head.get(0).y1)<0){
   
   head.add(new Segment((head.get(0).x1), 1000));
   head.remove(0);
 }
 else if ((head.get(0).y1)>1000){
  
  head.add(new Segment((head.get(0).x1),0));
  head.remove(0); 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
   if((head.get(0).x1 == food.get(0).x1)&&(head.get(0).y1 == food.get(0).y1)){
  
  
    body.add(new Segment(body.get(0).x1, body.get(0).y1));
   dropFood();
   stomach++;
  
 }

}
