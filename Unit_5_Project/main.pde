void setup(){
  size(700,700);
}

Flower f1 = new Flower(70,550,0);
Flower f2 = new Flower(370,550,0);
Flower f3 = new Flower(220,650,0);
Flower f4 = new Flower(520,650,0);
Bee b1 = new Bee(600,380,-2,2,1);
Bee b2 = new Bee(600,380,-2,-2,int(random(1,5)));
Bee b3 = new Bee(600,380,-1,-1,int(random(1,5)));
Bee b4 = new Bee(600,380,1,1,int(random(1,5)));

void draw(){
  background(255);
  
  //Code for day/night switcher
  daynight();

  //Creates all images on screen except for day/night background
  sketch();
}
