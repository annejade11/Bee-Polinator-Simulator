  float angle = 0;
  float change = 0;
  float angleh = 0;
  float outerSpeed = 0.001;
  boolean trueMoon = false;
  int cloud1x = int(random(0,350));
  int cloud1y = -1*(int(random(0,350)));
  int cloud2x = -1*(int(random(0,350)));
  int cloud2y = -1*(int(random(0,350)));
  Star s1 = new Star(random(0,700),random(0, 350));
  Star s2 = new Star(-1*(random(0,700)),random(0, 350));
  Star s3 = new Star(random(0,700),random(0, 350));
  Star s4 = new Star(-1*(random(0,700)),random(0, 350));
  Star s5 = new Star(random(0,700),random(0, 350));
  Star s6 = new Star(random(0,700),random(0, 350));
  Star s7 = new Star(-1*(random(0,700)),random(0, 350));
  Star s8 = new Star(random(0,700),random(0, 350));
  Star s9 = new Star(-1*(random(0,700)),random(0, 350));
  Star s10 = new Star(random(0,700),random(0, 350));
  void daynight(){
  
  noStroke();
  rectMode(CENTER);
  push();
  translate(width/2,height/2+100);
  rotate(angle);
  //NIGHT
  fill(6,22,82);
  arc(0, 0, 2000, 2000, 0, PI);
  //Stars
  s1.update();
  s2.update();
  s3.update();
  s4.update();
  s5.update();
  s6.update();
  s7.update();
  s8.update();
  s9.update();
  s10.update();
  //DAY
  fill(156,213,234); 
  arc(0, 0, 2000, 2000, PI, TWO_PI);
  //RAYS
  stroke(255,199,77);
  strokeWeight(17);
  line(0,0,0,-5000);
  line(0,0,200,-5000);
  line(0,0,-200,-5000);
  
  line(0,0,-5000,-1000);
  line(0,0,-5000,-1200);
  line(0,0,-5000,-800);
  
  line(0,0,-5000,-3000);
  line(0,0,-5000,-3400);
  line(0,0,-4000,-2600);
  
  line(0,0,-5000,-6000);
  line(0,0,-5000,-6300);
  line(0,0,-5000,-5700);
  
  line(0,0,-5000,-12000);
  line(0,0,-4800,-12400);
  line(0,0,-5200,-11600);
  
  line(0,0,5000,-12000);
  line(0,0,4800,-12400);
  line(0,0,5200,-11600);
  
  line(0,0,5000,-6000);
  line(0,0,5000,-6300);
  line(0,0,5000,-5700);
  
  line(0,0,5000,-3000);
  line(0,0,5000,-3200);
  line(0,0,5000,-2800);
  
  line(0,0,5000,-1000);
  line(0,0,5000,-1200);
  line(0,0,5000,-800);
  //SUN
  noStroke();
  fill(225,229,77);
  arc(0, 0, 100, 100, PI, TWO_PI);
  //CLOUDS
  fill(255);
  arc(cloud1x,cloud1y,60,60,PI,TWO_PI);
  arc(cloud1x+60,cloud1y,97.5,97.5,PI,TWO_PI);
  
  arc(cloud2x+50,cloud2y,50,50,PI,TWO_PI);
  arc(cloud2x,cloud2y,87.5,87.5,PI,TWO_PI);
  arc(cloud2x-50,cloud2y,50,50,PI,TWO_PI);
  //MOON
  fill(220);
  arc(0, 0, 100, 100, 0, PI);

  angle+= change;
  pop();
  
  if(degrees(angle) > 180){
    angle = radians(180);
  change = 0;
  }else if(degrees(angle) < 0){
    angle = radians(0);
    change = 0;
  }
  
  if(!trueMoon && (angle == radians(0) || angle == radians(180))){
    s1.xpos = random(0,700);
    s1.ypos = random(0, 350);
    s3.xpos = random(0,700);
    s3.ypos = random(0, 350);
    s5.xpos = random(0,700);
    s5.ypos = random(0, 350);
    s6.xpos = random(0,700);
    s6.ypos = random(0, 350);
    s8.xpos = random(0,700);
    s8.ypos = random(0, 350);
    s10.xpos = random(0,700);
    s10.ypos = random(0, 350);
    s2.xpos = -1*(random(0,700));
    s2.ypos = random(0, 350);
    s4.xpos = -1*(random(0,700));
    s4.ypos = random(0, 350);
    s7.xpos = -1*(random(0,700));
    s7.ypos = random(0, 350);
    s9.xpos = -1*(random(0,700));
    s9.ypos = random(0, 350);
  }else if(trueMoon && (angle == radians(0) || angle == radians(180))){
    cloud1x = int(random(0,350));
    cloud1y = -1*(int(random(0,350)));
    cloud2x = -1*(int(random(0,350)));
    cloud2y = -1*(int(random(0,350)));
  }
}


void mousePressed(){
  if(trueMoon == false){
  change = 0.03;
  trueMoon = true;
  }else{
    change = -0.03;
    trueMoon = false;
  }
}

class Star{
  //Class requirements
  float xpos, ypos;
  Star(float x, float y){
    xpos = x;
    ypos = y;
    
    }
    void update(){
      fill(230);
      ellipse(xpos,ypos,30,30);

    }
}
