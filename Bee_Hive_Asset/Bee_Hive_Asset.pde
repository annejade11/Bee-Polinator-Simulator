void setup(){
    size(400,400);
}
int xpos = 200;
int ypos = 200;

void draw(){
    background(255);

    push();
    translate(xpos,ypos);
    rectMode(CENTER);
    
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