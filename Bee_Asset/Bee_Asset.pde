
void setup(){
    size(300,300);
}

void draw(){
    background(255);

    push();
    translate(width/2, height/2);

    //Blue fill
    push();
    fill(120,217,242,150);
    strokeWeight(1);
    translate(5,-20);
    rotate(radians(315));
    ellipse(0,0,30,15);
    translate(0,10);
    rotate(radians(30));
    ellipse(0,0,30,15);
    pop();

    //Yellow fill
    strokeWeight(1);
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
