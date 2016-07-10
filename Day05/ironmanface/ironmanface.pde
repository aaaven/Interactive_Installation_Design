//created by in Aven on Jun 29th with students in Class: Interactive Installation Design

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage ironman;
void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
  ironman = loadImage("ironman.png");
}
void draw() {
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    //println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    image(ironman,1.02*faces[i].x, 0.71*faces[i].y, 0.95*faces[i].width, 1.14*faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}