//Draws items + calls "display" for objects to bring them on screen
void sketch(){

  //Draw the grass
  rectMode(CORNER);
  fill(80,200,60);
  rect(0,450,width,300);

  //Draw the tree
  //Trunk
  strokeWeight(50);
  stroke(97,63,24);
  line(width,500,width,300);
  //Leaves
  strokeWeight(100);
  stroke(120,214,105);
  point(width-70,250);
  point(width-90,300);
  point(width-20,200);
  point(width-20,300);
  point(width-20,250);

  //Draw the beehive
  beehive(width-100,380);
  
  //Draw the flowers
  f1.display();
  f2.display();
  f3.display();
  f4.display();

  //Draw the bees
  b1.display();
  b1.move();
  b1.collide();
  b1.target();
  b2.display();
  b2.move();
  b2.collide();
  b2.target();
  b3.display();
  b3.move();
  b3.collide();
  b3.target();
  b4.display();
  b4.move();
  b4.collide();
  b4.target();
}

//Class for Flowers
class Flower{
  int xpos;
  int ypos;
  int blue;
  Flower(int x_, int y_, int b_){
    xpos = x_;
    ypos = y_;
    blue = b_;
  }

  void display(){
    push();
    translate(xpos,ypos);
  
  //Stem Fill
  strokeWeight(15);
  stroke(19,142,46);
  fill(19,142,46);
  line(0,0,0,-100);
  
  push();
  translate(25,-25);
  rotate(radians(-45));
  ellipse(0,0,50,20);
  pop();

  push();
  translate(-25,-25);
  rotate(radians(45));
  ellipse(0,0,50,20);
  pop();
  
  stroke(0);
  strokeWeight(1);
  
  //Petal Fill
  colorMode(HSB,300);
  if(blue == 300){
    blue = 0;
  }
  fill(blue,250,250);
  ellipse(0,-100,40,40);
  ellipse(0,-160,40,40);
  ellipse(30,-130,40,40);
  ellipse(-30,-130,40,40);
  colorMode(RGB,255);
  
  //Center Fill
  fill(237,200,14);
  ellipse(0,-130,40,40);
  pop();
  }
}

//Class for Bees
class Bee{
    float xpos;
    float ypos;
    float xspeed;
    float yspeed;
    int target;
    int targx;
    int targy;
    Bee(float x_, float y_, float xs_, float ys_, int t_){
        xpos = x_;
        ypos = y_;
        xspeed = xs_;
        yspeed = ys_;
        target = t_;
        //Go to navigate, which will reroute to calc to determine x and y speed
        navigate(f1,f2,f3,f4);
    }
    
    void display(){
        push();
        translate(xpos, ypos);

        //Blue fill
        push();
        fill(120,217,242,150);
        strokeWeight(1);
        stroke(0);
        translate(5,-20);
        rotate(radians(315));
        ellipse(0,0,30,15);
        translate(0,10);
        rotate(radians(30));
        ellipse(0,0,30,15);
        pop();

        //Yellow fill
        strokeWeight(1);
        stroke(0);
        fill(237,200,14);
        ellipse(0,0,50,30);
    
        //Black fill
        stroke(0);
        strokeWeight(3);
        line(-10,-13,-10,13);
        line(10,-13,10,13);
        strokeWeight(5);
        point(-20,0);
        pop();
    }

    void move(){
        xpos+=xspeed;
        ypos+=yspeed;
    }

    void collide(){
      if(xpos+25 >= width){
        xspeed = xspeed*-1;
        xpos = width-25;
      }else if(xpos-25 <= 0){
        xspeed = xspeed*-1;
        xpos = 25;
      }

      if(ypos-30 <= 0){
        yspeed = yspeed*-1;
        ypos = 30;
      }else if(ypos+15 >= height){
        yspeed = yspeed*-1;
        ypos = height-15;
      }
    }

    void target(){
      //If the bee hits its target, reset it's speed, choose a new target, and adjust speed accordingly through nav
      if(((xpos >= targx-15 && xpos <= targx+15) && (ypos >= targy-5 && ypos <= targy+5))||(xpos == 600 && ypos == 380)){
        xspeed = 0;
        yspeed = 0;
        //Change the color of the flwoer you hit
        flowerColor();
        //Choose a new target
        target = int(random(1,5));
        //Adjust speed
        navigate(f1,f2,f3,f4);
      }
    }

    void flowerColor(){
      //Triggered only once the bee has hit the flower, this function adds a little to the color of watever flower you just hit
      if(target == 1){
      f1.blue += 5;
     }else if(target == 2){
      f2.blue += 5;
     }else if(target == 3){
      f3.blue += 5;
     }else if(target == 4){
      f4.blue += 5;
     }
    }

    void navigate(Flower other1, Flower other2, Flower other3, Flower other4){
     //Determine which flower is your target and then calculate what your speed should be
      if(target == 1){
      calc(other1);
     }else if(target == 2){
      calc(other2);
     }else if(target == 3){
      calc(other3);
     }else if(target == 4){
      calc(other4);
     }
    }

    void calc(Flower other){
      //Calculate the distance between the bee and the flower and divide by 75, then set it to x and y speed
      xspeed = ((other.xpos-xpos)/75);
      yspeed = (((other.ypos-130)-ypos)/75);
      //Set targx and targy to the coordinates of your new target so when you reach it, the program will recognize that
      targx = other.xpos;
      targy = other.ypos-130;
    }
}

void beehive(int xpos,int ypos){
    push();
    translate(xpos,ypos);
    rectMode(CENTER);
    strokeWeight(1);
    stroke(0);
    fill(0);
    
    //Stem
    fill(97,63,24);
    rect(0,-60,10,40,100);

    //Leaf
    fill(19,142,46);
    push();
    translate(15,-70);
    rotate(radians(-45));
    ellipse(0,0,30,10);
    pop();

    //Bee Hive
    fill(237,200,14);
    rect(0,-40,60,20,100);
    rect(0,-20,80,20,100);
    rect(0,0,100,20,100);
    rect(0,20,80,20,100);
    rect(0,40,60,20,100);

    //Black Dot
    fill(0);
    ellipse(0,0,30,30);

    pop();
}

