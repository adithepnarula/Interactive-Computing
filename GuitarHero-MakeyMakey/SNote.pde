class SNote extends Note{
  
  PVector location;
  PVector velocity; 
  PVector acceleration; 
  float topSpeed=2.5;
  PVector target;
  PVector dir; 

  private int red; 
  private int green;
  private int blue;
  
  SNote(){
    
    red=147; //10
    green=208; //156
    blue=247;  //250
    
    location = new PVector(width/2,100); 
    velocity = new PVector(); 
  }
  
  void update(Target t){
    
    target = new PVector(t.location.x,t.location.y, t.location.z);
    dir= PVector.sub(target,location);
    
    dir.normalize();
    
    acceleration = dir; 
    
    velocity.add(acceleration); 
    velocity.limit(topSpeed);
    location.add(velocity);
    
  }
  
  
  void display(){
    
    pushMatrix();
    fill(red,green,blue); 
    translate(location.x,location.y,location.z);
    ellipse(0,0,7,7);
    popMatrix();
  }
  
  
  void applyForce(PVector force){
    
    
  }
  
  
  int atTarget(Target t){
    
    float distance= dist(location.x,location.y,location.z,t.location.x,t.location.y,t.location.z); 
    
    if((distance <= 10) && (distance >2) && keyPressed && key=='s'){
      return 1; //1000
    } 

    else if((distance <= 20) && (distance >10) && keyPressed && key=='s'){
      return 2; // 500
    } 
    
    else if((distance < 10) && (distance >2) && keyPressed && key!='s'){
      return 0;
      // wrong key 
    }
    
    else if((distance<1) && !keyPressed){
      
    return 4; 
      
   }
    
    
    return 5;
    
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
