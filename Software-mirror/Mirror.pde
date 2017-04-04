// begin by importing the video library
import processing.video.*;

// declare an object of type Capture
// this object will handle getting
// video frames and can be used to
// draw the video to the canvas
Capture video;
float degreeX = 0;
float degreeY = 0;
int state = 0;

float vid2TintRed, vid2TintGreen, vid2TintBlue;

float vid3TintRed, vid3TintGreen, vid3TintBlue;

float degreeAddX, degreeAddY;

int redAdd, greenAdd, blueAdd;

PImage vid1, vid2, vid3, background1;

void setup()
{


  size(640, 480, P3D);
  background1 = loadImage("pietbackground.png");

  // connect to our default camera and request
  // a video resolution of 320 x 240
  video = new Capture(this, 640, 480);

  // start the video
  video.start();

  //widht, height, color
  vid1 = new PImage(505, 360, ARGB);
  vid2 = new PImage(120, 120, ARGB);
  vid3 = new PImage(50, 60, ARGB);
  degreeAddX = 0.02;
  degreeAddY = 0.01;

  vid2TintRed = 255;
  vid2TintGreen = 255;
  vid2TintBlue = 0;

  vid3TintRed = 0;
  vid3TintGreen = 0;
  vid3TintBlue = 255;
}

void draw()
{

  background(214, 215, 173);

  // video frames will be delivered at a much slower rate than
  // your Processing frame rate
  // we need to wait until a video frame is available before we grab it from the camera
  if (video.available())
  {
    // new frame is ready!  read it in ...
    video.read();
  }

  video.loadPixels();
  degreeX = degreeX + degreeAddX;
  degreeY = degreeY + degreeAddY;

  if (degreeY > 3 ) {
    if (state == 0) {
      state = 1;
      degreeY = 0;
      degreeX = 0;
      degreeAddX = random(0.01, 0.02);
      degreeAddY = random(0.01, 0.02);
    } else if (state == 1) {
      state = 2;
      degreeY = 0;
      degreeX = 0;
      degreeAddX = random(0.01, 0.02);
      degreeAddY = random(0.01, 0.02);
    } else if (state == 2) {
      state = 0;
      degreeY = 0;
      degreeX = 0;
      degreeAddX = random(0.01, 0.02);
      degreeAddY = random(0.01, 0.02);
    }
  }


  if (state == 0) {
    redAdd = 100;
    greenAdd = -60;
    blueAdd = -60;

    vid2TintRed = 0;
    vid2TintGreen = 0;
    vid2TintBlue = 255;

    vid3TintRed = 255;
    vid3TintGreen = 255;
    vid3TintBlue = 0;
    
  } else if (state == 1) {
    
    redAdd = 100;
    greenAdd = 100;
    blueAdd = -60;

    vid2TintRed = 255;
    vid2TintGreen = 0;
    vid2TintBlue = 0;

    vid3TintRed = 0;
    vid3TintGreen = 0;
    vid3TintBlue = 255;
    
  } else {
    redAdd = -60;
    greenAdd = -60;
    blueAdd = 100;

    vid2TintRed = 255;
    vid2TintGreen = 255;
    vid2TintBlue = 0;

    vid3TintRed = 255;
    vid3TintGreen = 0;
    vid3TintBlue = 0;
  }

  println("state: " + state);



  for (int x = 0; x < video.width; x = x + 10) {
    for (int y = 0; y < video.height; y = y + 10) {


      int location = x + y*video.width;
      float red = red(video.pixels[location]);
      float green = green(video.pixels[location]);
      float blue = blue(video.pixels[location]);



      float newX = map(x, 0, width, 135, 640);

      float newY = map(y, 0, height, 0, 360);



      //100, -60, -60
      fill(red+redAdd, green+greenAdd, blue+blueAdd);
      pushMatrix();
      translate(newX, newY);
      rectMode(CENTER);
      rotateY(degreeY);
      rotateX(degreeX);
      rotateZ(degreeX);

      rect(0, 0, 10, 10);

      popMatrix();
    }
  }
  tint(vid2TintRed, vid2TintGreen, vid2TintBlue, 255);
  vid2.copy(video, 0, 0, 640, 480, 0, 0, 120, 120);
  image(vid2, 0, 360);

  tint(vid3TintRed, vid3TintGreen, vid3TintBlue, 255);
  vid3.copy(video, 0, 0, 640, 480, 0, 0, 50, 60);
  image(vid3, 590, 420);




  // every frame in your program you can draw the contents of the video object
  // note that at the beginning of your program this will be empty
  rectMode(CORNER);
  fill(0);
  rect(120, 0, 15, 480);
  rect(0, 150, 120, 20);
  rect(0, 360, width, 15);

  //two rectangles on the side
  rect(width-50, 360, 15, 120);
  rect(width-50, 420, 60, 15);
}

