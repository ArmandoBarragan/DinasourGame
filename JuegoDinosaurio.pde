Player player;
boolean jump;
boolean land;
boolean near;
float speed;
Obstacle obs [];
int oCount;
boolean crashed;
long startLoop;

void setup(){
  size(1000,600);
  player = new Player();
  jump = false;
  speed = 4;
  obs = new Obstacle[5];
  textSize(60);
  crashed = false;
  startLoop = 0;
}


void draw(){ 
  near = false;
  background(0,150,200);
  fill(0,100,50);
  stroke(0,100,50);
  rect(0,400,width, 300);
  player.draw();
  
  if(mousePressed && mouseY>400){
    player.duck();
  }
  
  if(millis()%10 ==0)
    genObs();
    
  showObs();
  
  if(millis()%100==0)
    speed+=speed*.04;
  
  collision();
  if(millis()-startLoop<6000){
  fill(0);
    text("Tap to jump",100,100);
    text("Tap to duck", 100,500);
  }
}

void restart(){
  player = new Player();
  jump = false;
  speed = 4;
  obs = new Obstacle[5];
  textSize(60);
  startLoop = millis();
  crashed = false;
  loop();
}

void genObs(){
  int chance = (int)random(3);
  
  for(int i=0;i<5;i++){
    if(i == oCount){
      continue;
    }
    try{
      if(obs[i].x > 600){
      near = true;
    }
    }
    catch(NullPointerException e){};
    
  }
  if(chance == 0 && !near){
    obs[oCount++] = new Obstacle();
  }
  if(oCount==5){
    oCount =0;
  }
}

void showObs(){
  for(int i = 0; i < 5; i++){
    try{
      obs[i].show(speed);
    }
    catch(NullPointerException e){}
  }
}

void mousePressed(){
  if(mouseY<400 && !crashed){
    player.y-=.1;
    player.jump();
  }
  else if(crashed){
    restart();
  }
}

void collision(){
  float disty2;
  float distx2;
  for(int i = 0; i < obs.length;i++){
    try{   
      distx2 = obs[i].x-player.x;
      disty2 = player.y - obs[i].y;
      if(distx2<30 && distx2>-10 &&
      disty2<100 && disty2>-10 &&
      !player.duck){
        fill(0);
        text("Baboso uwu", 100,200);
        crashed = true;
        noLoop();
        text("Tap to try again", 100,300);       
      }
      else if(distx2<30 && distx2>-10 &&
      disty2<40 && disty2>-10 &&
      player.duck){
        fill(0);
        text("Baboso uwu", 100,200);
        crashed = true;
        noLoop();
        text("Tap to try again", 100,300); 
      }
    }
    
    catch(NullPointerException e){};
  }
}
