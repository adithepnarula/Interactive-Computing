class Target{
  
  
  PVector location; 
  float r=300; 
  float theta=2; 
  float offset;
  float angle;
  float perlinOffset;
  float x=1000;
  
  
  private int red; 
  private int green; 
  private int blue; 
 
  Target(float xPos, float yPos){
    location = new PVector(0,0);
    location.x= xPos; 
    location.y= yPos; 
    angle=0; 
    offset = random(20,50);
    
    red= 255;
    green=255;
    blue= 255;
    
  }
  
  void display(){
    
    perlinOffset= map(noise(x),0,1,20,50);
    
    offset=perlinOffset;
    
    pushMatrix();
    translate(location.x,location.y,location.z);
    rotate(angle);
    noStroke();
   
    fill(red,green,blue,70);
    ellipse(0,offset,6,6);
    fill(red,green,blue,70);
    ellipse(0,-offset,6,6);
    popMatrix();
    
    x+=0.015;
    
 }
  
  void update(){
  
   angle+=0.055;
    
  }
  
  
  void setRed(int r){
    red= r;
  }
  
  void setGreen(int g){
    green= g;
  }
  
  void setBlue(int b){
    blue=b; 
  }
  
  int getRed(){
    return red;
  }
  
  int getGreen(){
    
    return green;
  }
  
  int getBlue(){
    
    return blue;
    
  }
  
}
