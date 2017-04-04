void setup() {
  size(800, 800);
  background(255,255,255);
  smooth();

  
  strokeWeight(5);
  fill(102, 51, 0);

  rectMode(CORNERS);
  //draw body
  rect(200, 450, 620, 800);

  //chest outline
  line(250, 600, 350, 600);
  line(470, 600, 570, 600);

  strokeWeight(15);
  
  //np
  point(325, 580);
  point(490, 580);

  strokeWeight(5);

  //color and shape head
  beginShape();
  vertex(250, 200);
  vertex(575, 200);
  vertex(600, 225);
  vertex(475, 500);
  vertex(350, 500);
  vertex(225, 225);
  vertex(250, 200);
  endShape();

  //draw two white eyes
  fill(255);
  ellipse(350, 275, 75, 50);
  ellipse(475, 275, 75, 50);

  //black eyes
  fill(0);
  ellipse(350, 275, 30, 20);
  ellipse(475, 275, 30, 20);

  //draw nose
  noFill();
  triangle(415, 275, 435, 375, 390, 375);
  
  rectMode(CORNER);
  //draw mouth
  rect(370, 420, 100, 10);
  rect(370, 430, 100, 10);

  rectMode(CORNERS);
  //draw a cap, behind part
  fill(200, 0, 0);
  rect(110, 120, 275, 200);

  //draw a cap, bottom part
  rect(225, 80, 600, 200);
}


void draw() {
 
  fill(0);
  
  
  if (mousePressed) {
    ellipse(mouseX, mouseY, 20, 20);
  }

  
}