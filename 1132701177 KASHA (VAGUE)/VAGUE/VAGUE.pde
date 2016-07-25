//=====VAGUE=====

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer Cosmos;
FFT         fft;

float _x = 0.0;
float _y = 0.0;
float _angle = 0.0;
float _lasty = 250.0;
float _lastx = 250.0;

float _a = 5.0;
float _b = 3.0;

//================================= init


void setup() {
 frameRate(60); 
 size(1000,600,P3D);
 background(255);
 smooth();
 
minim = new Minim(this);
 
 Cosmos = minim.loadFile("Cosmos.mp3", 1024);
 
 Cosmos.play();
 
 fft = new FFT (Cosmos.bufferSize(), Cosmos.sampleRate());
}


//================================= frame loop

void draw() {    
  background (random(255),random(255),random(255),random(10));
  _angle += 0.7;
  ellipse (500,300,300,300);
  fill (0);
  
  
if (_angle > 360) { _angle -= 360; }
  
  float preva = _a;
  float prevb = _b;
  _a = mouseX/10;
  _b = mouseY/10;
  
  if ((_a != preva) || (_b != prevb)) {
    strokeCap(PROJECT);
    strokeWeight(int(random(300)) + 5);
  } else {
    strokeCap(ROUND);
    strokeWeight(1);
    stroke(255, 150);
  }
  
  _x = sin(_a * radians(_angle) + PI / 2) * 560;  
  _y = sin(_b * radians(_angle)) * 360;
  _x += 500;
  _y += 300;
  
  line(_x, _y, _lastx, _lasty);
  
  _lastx = _x;
  _lasty = _y;
  }