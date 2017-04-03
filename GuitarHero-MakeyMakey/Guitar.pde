import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//2667

import java.util.Iterator;

float target = 5000;
float last = 0;

Target[] targets= new Target[4];
PImage back; 
PImage back2;
int points; 
AudioPlayer song; 
Minim minim; 
BeatDetect beat;
BeatListener bl;
String lines[]; 
String noteFile[];
int[] intLines;
int[] intNotes;
Origin start; 

ArrayList<Note> allNotes; 

void setup() {

  size(840, 610, P3D);
  background(0);
  
 // back= loadImage("bg_easy.jpg");
  back2= loadImage("bg_start.png");
  
  targets[0]= new Target((400*cos(PI/2 - PI/7)) + width/2, (400*sin(PI/2 - PI/7)) + 100); 
  targets[1] = new Target((400*cos(PI/2 - PI/20)) + width/2, (400*sin(PI/2 - PI/20)) + 100);
  targets[2] = new Target((400*cos(PI/2 + PI/7)) + width/2, (400*sin(PI/2 + PI/7))+ 100);
  targets[3]= new Target((400*cos(PI/2 + PI/20)) + width/2, (400*sin(PI/2 + PI/20) + 100));
 
  allNotes= new ArrayList<Note>();

  minim= new Minim(this);
  song = minim.loadFile("DaftHarder.mp3");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  bl= new BeatListener(beat, song);
  // beat.setSensitivity(500);
  song.play();

  lines = loadStrings("FinalDaftHarder.txt");
  noteFile = loadStrings("NoteDaftHarder.txt");
  

  intLines = new int[lines.length];
  intNotes= new int[noteFile.length];

  for (int i = 0 ; i < lines.length; i++) {
    int number = Integer.parseInt(lines[i]);
    intLines[i]=number;
  }
  
  for(int i = 0; i< noteFile.length; i++){
    int notes = Integer.parseInt(noteFile[i]);
    intNotes[i]= notes;
  }
  
  targets[0].setRed(252);
  targets[0].setGreen(161);
  targets[0].setBlue(225);
  
  
  targets[1].setRed(169);
  targets[1].setGreen(24);
  targets[1].setBlue(198);
  
  targets[2].setRed(250);
  targets[2].setGreen(226);
  targets[2].setBlue(10);
  
  targets[3].setRed(10);
  targets[3].setGreen(156);
  targets[3].setGreen(250);
  
  start = new Origin(); 
  
}

long now; 
long elapsed; 
int iterator =0;
int count=0;

void draw() {
  
  textAlign(CENTER);

  // song timing 
  //if(iterator == 60){
   // exit();
 // }

  target = intLines[iterator];
  
//  if(frameCount%400==0){
//    allNotes.add(new ANote());
//    now = millis();
//  }
  
  if ( millis() > target  && iterator < intLines.length-1) {
    last = millis();
    if(intNotes[iterator]==1){
      allNotes.add(new ANote());
      println(millis());
    }
    else if(intNotes[iterator]==2){
       allNotes.add(new SNote());
       println(millis());
    }
    else if(intNotes[iterator]==3){
       allNotes.add(new DNote());
       println(millis());
    }
    else{
       allNotes.add(new FNote());
       println(millis());
    }
    
    iterator++;
    target = intLines[iterator];
  }
 
  

// notes 
   for(int i = 0; i< allNotes.size(); i++){
   
   Note thisNote= allNotes.get(i);
   thisNote.display();
   
   if(thisNote instanceof FNote){
   thisNote.update(targets[0]);
   thisNote.atTarget(targets[0]);
   
   if(thisNote.atTarget(targets[0]) == 1){
     points+=1000;
     fill(255);
     text("PERFECT", width/2, height/2+ 100);
     allNotes.remove(i);
   }
  
   
   else if (thisNote.atTarget(targets[0]) == 2){
      points+=500;
      fill(255);
      text("GOOD" ,  width/2, height/2+100);
       allNotes.remove(i);
     
    }
    
    else if (thisNote.atTarget(targets[0])==0){
        fill(255); 
        allNotes.remove(i);
       text("WRONG KEY" ,  width/2, height/2+100);
       
    }
    
    else if(thisNote.atTarget(targets[0])==4){
        fill(255);
        allNotes.remove(i);
       text("MISSED" ,  width/2, height/2+100);
    }   
    
   }
   
   else if(thisNote instanceof DNote){
     
       thisNote.update(targets[1]);
       thisNote.atTarget(targets[1]);
       
       
       if(thisNote.atTarget(targets[1]) == 1){
         points+=1000;
         fill(255);
        text("PERFECT", width/2, height/2+ 100);
         allNotes.remove(i);
      }
      
      
      else if (thisNote.atTarget(targets[1]) == 2){
          points+=500;
          fill(255);
         text("GOOD" ,  width/2, height/2+100);
           allNotes.remove(i);
     
      }
      
      
       else if (thisNote.atTarget(targets[1])==0){
        fill(255); 
        allNotes.remove(i);
        text("WRONG KEY" ,  width/2, height/2+100);
       
    }
    
      else if(thisNote.atTarget(targets[1])==4){
        fill(255);
        allNotes.remove(i);
        text("MISSED" ,  width/2, height/2+100);
      } 
 
   }
   
   
   else if (thisNote instanceof ANote){
     
      thisNote.update(targets[2]);
      thisNote.atTarget(targets[2]);
       
        if(thisNote.atTarget(targets[2]) == 1){
         points+=1000;
         fill(255);
        text("PERFECT", width/2, height/2+ 100);
         elapsed = millis()-now;
         println(elapsed);
         allNotes.remove(i);
      }
      
      
      else if (thisNote.atTarget(targets[2]) == 2){
          points+=500;
          fill(255);
         text("GOOD" ,  width/2, height/2+100);
           allNotes.remove(i);
     
      }
      
      
       else if (thisNote.atTarget(targets[2])==0){
        fill(255); 
        allNotes.remove(i);
        text("WRONG KEY" ,  width/2, height/2+100);
       
    }
    
      else if(thisNote.atTarget(targets[2])==4){
        fill(255);
        allNotes.remove(i);
       text("MISSED" ,  width/2, height/2+100);
      } 
   
     
   }
   
   
   else{
     
       thisNote.update(targets[3]);
        thisNote.atTarget(targets[3]);
       
        if(thisNote.atTarget(targets[3]) == 1){
         points+=1000;
         fill(255);
        text("PERFECT", width/2, height/2+ 100);
         allNotes.remove(i);
      }
      
      
      else if (thisNote.atTarget(targets[3]) == 2){
          points+=500;
          fill(255);
         text("GOOD" ,  width/2, height/2+100);
           allNotes.remove(i);
     
      }
      
      
       else if (thisNote.atTarget(targets[3])==0){
        fill(255); 
        allNotes.remove(i);
        text("WRONG KEY" ,  width/2, height/2+100);
       
    }
    
      else if(thisNote.atTarget(targets[3])==4){
        fill(255);
        allNotes.remove(i);
       text("MISSED" ,  width/2, height/2+100);
      } 
     
     
     
     
     
     
     
   }
   
   
  

 }
   
   
   rectMode(CORNER); 
  
   for(int i = 0; i< targets.length ; i++){
     targets[i].display();
     targets[i].update();
   }
  
   fill(0,30);
   rect(0,0, width,height); 
   smooth();
   
   fill(255);
   text(points,20,30);
   
   start.displayGlow();
 
}

