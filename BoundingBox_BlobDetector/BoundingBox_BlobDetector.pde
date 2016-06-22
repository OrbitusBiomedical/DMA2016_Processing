import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import blobscanner.*;

Detector bd;


Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
  
bd = new Detector( this, 255 );


}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );
  
  color boundingBoxCol = color(255, 0, 0);
  int boundingBoxThickness = 1;
  
  video.loadPixels();
  
  bd.findBlobs(video.pixels, video.width, video.height);
  
  // to be called always before using a method 
  // returning or processing a blob's feature
  bd.loadBlobsFeatures(); 
  
  bd.drawBox(boundingBoxCol, boundingBoxThickness);

  noFill();
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(0);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    ellipse(faces[i].x+10, faces[i].y+20, max(faces[i].width-10, 10), max(faces[i].height-20, 6));
  }
}

void captureEvent(Capture c) {
  c.read();
}