class FNote extends Note{
  PVector location;
  PVector velocity; 
  PVector acceleration; 
  float topSpeed=2.5;
  PVector target;
  PVector dir; 
  int die; 
  private int red;
  private int blue;
  private int green;
  
  FNote(){
   
    location = new PVector(width/2, 100) ; // origin of particiles system 
    velocity = new PVector(); 
     
    red=245;  //252
    green= 136;  //161
    blue= 214;  //225
    
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
    
    if((distance <= 10) && (distance >2) && keyPressed && key=='f'){
      return 1; //1000
    } 

    else if((distance <= 20) && (distance >10) && keyPressed && key=='f'){
      return 2; // 500
    } 
    
    else if((distance < 10) && (distance >2) && keyPressed && key!='f'){
      return 0;
      // wrong key 
    }
    
    else if((distance<1) && !keyPressed){
      return 4; 
      // no key pressed
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
