abstract class Note {
  
  
  Note(){
    
  }
  
  abstract void update(Target t);
  abstract void display();
  abstract void applyForce(PVector force);
  abstract int atTarget(Target t);
  
  abstract int getRed();
  abstract int getGreen();
  abstract int getBlue();
  
 
}
