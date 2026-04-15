void setup(){
  size(300,300);
}

int xpos = width/2;
int ypos = 300;

void draw(){
  background(255);
  
  
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
  fill(255,20,0);
  ellipse(0,-100,40,40);
  ellipse(0,-160,40,40);
  ellipse(30,-130,40,40);
  ellipse(-30,-130,40,40);
  
  //Center Fill
  fill(237,200,14);
  ellipse(0,-130,40,40);
}
