class Origin{
  
   ArrayList<ParticleSystem> systems;
 
  Origin(){
    
    systems= new ArrayList<ParticleSystem>();
    systems.add(new ParticleSystem(new PVector(width/2,100)));
    systems.add(new ParticleSystem(new PVector(width/2+3,103)));
    systems.add(new ParticleSystem(new PVector(width/2-3, 100)));
    systems.add(new ParticleSystem(new PVector(width/2+5, 100)));
    systems.add(new ParticleSystem(new PVector(width/2,101)));
    systems.add(new ParticleSystem(new PVector(width/2+5,102)));
   
   
  }
  
   void displayGlow(){
    
     for(ParticleSystem ps: systems){
       ps.run();
       ps.addParticles();
       
     }
  
  }
  
  
  
}
