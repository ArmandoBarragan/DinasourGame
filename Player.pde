class Player{
  int x, width, height;
  float y;
  float gravity, jumpForce;
  final float maxY;
  boolean jump, duck;
  
  Player(){
    x = 50;
    maxY = 400;
    y = 400;
    width = 60;
    height = 90;
    jumpForce = -2;
    gravity = 0;
    jump = false;
    duck = false;
  }
  void draw(){
    fill(255);
    stroke(255);
    y += gravity;
    if(jump && y < 400){
      gravity += jumpForce*1.1;
      jumpForce += .18;
    }
    else if(jump && y >= 400){
      player.reset();
      jump = false;
    }
    if(!duck){
      ellipse(x, y, width, height);
    }
    if(duck){
      y += 30;
      ellipse(x,y,width, height-30);
      y -= 30;
      duck = false;
    }
  }
  void jump(){
   jump = true;
  }
  void reset(){
    jumpForce = -2;
    gravity = 0;
    y = 400;
  }
  void duck(){
    duck = true;
  }
}
