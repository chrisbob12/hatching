// this sketch is preparation to draw vertical hatching
// in the style of hand-drawn
// LESSON 1: you have to use noLoop() in setup or it fills screen

// here we get vertical lines displaced erratically about a
// regular placement

// vary hatch and wobble to affect quality of hatching

float noiseScale=0.02;
int hatch = 40;
float wobble = 1.0;
int thisx = 0;
int thisy = 0;
int nextx = 0;
int nexty = 0;

void setup() {
  size(850, 315);
  background(255);
  noLoop();
}


void draw() {
  for (int i=0; i<width; i=i+3) {
    strokeWeight(1);
    stroke(0);
    int dist = int(randomGaussian()*1.2);
    int disp = i+dist;
    thisx = disp;
    thisy = 0;
    //println(disp);
   
    while (thisy < height){
      float nextwob = (randomGaussian()*wobble);
      nextx = thisx + int(nextwob);
      //println(nextx);
      //nextx = thisx + (int(random(minwob,maxwob)));      

      nexty = thisy + (int(sqrt(sq(randomGaussian()*hatch))));
      line(thisx, thisy, nextx, (nexty-1));
      //thisx = thisx + int(nextwob);
      thisx = nextx;
      //println(thisx);
      thisy = nexty;      
    }
    
  } //end horizontal for

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("wigglehatch.jpg");
  }
  
  println("done");
} //end draw

