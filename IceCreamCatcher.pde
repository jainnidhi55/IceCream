PImage BackImage;
PImage ConeImage;

PImage BeigeScoop;
PImage BlueScoop;
PImage GreenScoop;
PImage RedScoop;
PImage PinkScoop;

Scoop myScoop1;
Scoop myScoop2; // Two objects!
Scoop myScoop3;
Scoop myScoop4;
Scoop myScoop5;
int x;
int c;

PImage [] array = new PImage[10];
int [] goal = new int[3];
int value = 0;
int score = 0;

void setup()
{
  size(1080, 542);
  BackImage = loadImage("background.jpg");
  ConeImage = loadImage("cone.png");
  
  BeigeScoop = loadImage("scoop/beige.png");
  BlueScoop = loadImage("scoop/blue.png");
  GreenScoop = loadImage("scoop/green.png");
  RedScoop = loadImage("scoop/red.png");
  PinkScoop = loadImage("scoop/pink.png");
  
  myScoop1 = new Scoop(1,randomX(),100,3); 
  myScoop2 = new Scoop(2,randomX(),10,2);
  myScoop3 = new Scoop(3,randomX(),15,3);
  myScoop4 = new Scoop(4,randomX(),30,2);
  myScoop5 = new Scoop(5,randomX(), 50, 3);
  background(255);
  
  for (int i = 0; i < 3; i++) {
    goal[i] = (int) random(1,5);
  //  System.out.println(goal[i]);
  }
//  frameRate(1500);
}  

int randomX(){
  x = (0+(int)(Math.random()*1080));
  return x;
}

 
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Scoop { 
  int c;
  float xpos;
  float ypos;
  float yspeed;
 
  // The Constructor is defined with arguments.
  Scoop(int tempC,float tempXpos, float tempYpos, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;//0 + (int)(Math.random()*1080);
    ypos = tempYpos;
    yspeed = tempYspeed;
  }
 
  void display() {
    stroke(0);
  //  fill(c);
  //  rectMode(CENTER);
   // rect(xpos,ypos,20,10);
   if (c == 1){
     image(BeigeScoop, xpos,ypos);
   }
   else if (c == 2){
     image(BlueScoop, xpos,ypos);
   }
   else if (c == 3){
     image(GreenScoop, xpos,ypos);
   }
   else if (c == 4){
     image(RedScoop, xpos,ypos);
   }
   else if (c == 5){
     image(PinkScoop, xpos,ypos);
   }   
  }
 
  void drive() {
    ypos = ypos + yspeed;
    if (ypos > width) {
      ypos = 0;
      xpos = randomX();
    }
    if(value < 10 && ((xpos > mouseX-50)&&(xpos < mouseX + 50))&&((ypos > 328 - value * 30)&&(ypos< 428  - value * 30))){
           if (c == 1){
            // tint(0,0);
             image(BeigeScoop, mouseX,375);
             if (goal[value % 3] == c) {
               array[value] = loadImage("scoop/beige.png");
               value++; 
             } else if (value > 0){
               value--;
             }
             
           }
           if (c == 2){
            // tint(0,0);
             image(BlueScoop, mouseX,375);
             if (goal[value % 3] == c) {
             array[value] = loadImage("scoop/blue.png");
             value++;
             } else if (value > 0){
               value--;
             }
           }
           else if (c == 3){
            // tint(0,0);
             image(GreenScoop, mouseX,375);
             if (goal[value % 3] == c) {
             array[value] = loadImage("scoop/green.png");
             value++;
             } else if (value > 0) {
               value--;
             }
           }
           else if (c == 4){
            // tint(0,0);
             image(RedScoop, mouseX,375);
             if (goal[value % 3] == c) {
             array[value] = loadImage("scoop/red.png");
             value++;
             } else  if (value > 0) {
               value--;
             }
           }
           else if (c == 5){
            // tint(0,0);
            if (goal[value % 3] == c) {
              image(PinkScoop, mouseX,375);
              array[value] = loadImage("scoop/pink.png");
             value++;
             } else if (value > 0){
               value--;
             }
           }
          ypos = 600; 

     }
     
     if(value == 10){
       value = 0;
       for (int i = 0; i < 3; i++) {
         goal[i] = (int) random(1,5);
         //  System.out.println(goal[i]);
       }
       score++;
     }
  }
}


void draw() {
 image(BackImage,0,0); 
 
 image(ConeImage, mouseX, 400);
// rect(mouseX,400,30,30);
 fill(255,255,0);
  myScoop1.drive();
  myScoop1.display();
  myScoop2.drive();
  myScoop2.display();
  myScoop3.drive();
  myScoop3.display();
  myScoop4.drive();
  myScoop4.display();
  myScoop5.drive();
  myScoop5.display();
  for (int i = 0; i < value; i++) {
    image(array[i], mouseX,375 - i * 30);
  }
  
  for (int i = 0; i < 3; i++) {
       fill(0,0,0);
      textSize(20);
           if (goal[i] == 1){
             text("Beige",50,50 + i*30);
           } 
           else if (goal[i] == 2){
             text("Blue",50,50 + i*30); 
           }
           else if (goal[i] == 3){
             text("Green",50,50 + i*30);
           }
           else if (goal[i] == 4){
             text("Red",50,50 + i*30);
           }
           else if (goal[i] == 5){
             text("Pink",50, 50 + i*30);
           }
           text("Points: " + score,500,50);

  }
  
 text("Follow the pattern to get more ice cream.  Get 10 scoops to get a point.", 50,500);
}


