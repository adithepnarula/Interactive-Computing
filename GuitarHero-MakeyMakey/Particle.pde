class Particle{
  
  PVector acceleration;
  PVector velocity; 
  PVector location;
  
  float lifespan;
  float mass;  
  float tx, ty; 
  float x, y; 
  int r,g,b;
  float spanVariable; 
  
  Particle(PVector l){
    
    acceleration= new PVector(0,0);
    velocity= new PVector(random(-0.6,0.6), random(-0.6,0.6)); 
    location= l.get(); 
    
    lifespan=255;
    mass=random(2,6); 
    
    tx= random(0,100);
    ty=random(1000,2000);
   
    r=255;
    g=255;
    b=255;
    
    spanVariable = 20; 
   
  }
  
  void run(){
    
    update();
    display(); 
    pulse();
    
  }
  
  void update(){
    
    velocity.add(acceleration);
    location.add(velocity); 
    lifespan-=spanVariable; 
 
  }
  
  void pulse(){
    
    int count = 0;
   
    if(frameCount % 56 == 0){
       
      if(count % 2 == 0){
        
        spanVariable = 5;
      }
      
      else{
        spanVariable = 15;
      }
      
    }
    
    count++; 
    
  }
  
  
  void display(){
    
    x= map(noise(tx), 0,1,100,255); 
    y= map(noise(ty), 0,1,100,255); 
    
    noStroke(); 
    fill(r,g,b,lifespan); 
    ellipse(location.x,location.y,4,4);
    
    tx+=0.01;
    ty+=0.01;
    
    b-=5;
    
  }
  
  boolean isDead(){
    
    if(lifespan<0){
      return true; 
    }
    else{
      return false; 
    }
    
  }
}
