 class ParticleSystem {
    
     PVector origin; 
     ArrayList particles; 
     
     ParticleSystem(PVector location){
       
     origin= location.get(); 
     particles = new ArrayList(); 
    
       
     }
     
     void addParticles(){

       particles.add(new Particle(origin)); 
       //}
     }
     
     
     void run(){
       
       Iterator<Particle> it = particles.iterator(); 
       while(it.hasNext()){
         Particle p = it.next(); 
         p.run(); 
         if(p.isDead()){
           it.remove(); 
        }
     }
      
   }
    
 
}
