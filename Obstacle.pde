class Obstacle{
  float x;
  float y;
  float width;
  float height;
  float speed;
 
  Obstacle(){
    x = 1000;
    width = 20;
    height = 48;
    
    float chance = random(0,3);
    if(chance < 1){
      y = 350;
    }
    else if(chance < 2 && chance>1 ){
      y = 380;
    }
    else{
      y = 300;
    }
  }
  
  void show(float speed){
    fill(0);
    fill(100,60,50);
    stroke(100,30,80);
    rect(x,y,width,height);
    x -= speed;
  }
}
