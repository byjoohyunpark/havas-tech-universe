//import org.openkinect.processing.*;

ArrayList <Particle> p;
CenterMover the_cntr;

//Kinect2 kinect2;
 float min = 1000 ; 
 float max = 1500 ; 
 
 PImage img ;
 int number = 1000;
 int maxCount = 2000;
 
 int w = 800;
 int h = 800;
 
 color bgColor = color(0);
 color c = color(255);

void setup() {
     //fullScreen(FX2D);
    size(800, 800);
    
     noStroke();
    //noCursor();
    
   
    //kinect2 = new Kinect2(this);
    //kinect2.initDepth();
    //kinect2.initDevice();    
    //img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
    img = createImage(w, h, ARGB);

     p = new ArrayList<Particle>();
    the_cntr = new CenterMover(w/2, h/2);
}

void draw() {
  background(bgColor, 100);
   //fill(bgColor, 100);
   //rect(0, 0, w, h);
  
    for (int i = 0; i < number; i++) {
    p.add(new Particle());
  }
  for (Particle i : p) {
    i.update();
    i.show(); 
  }       
   killParticles();
  
 img.loadPixels();
 

for (int x = 0; x <  w; x++) {
      for (int y = 0; y < h; y++) {
   int clr = get(x, y);
   img.pixels[x + y * w] = color(clr);
      }}
 
//    //for (int x = 0; x < kinect2.depthWidth; x++) {
//    //  for (int y = 0; y < kinect2.depthHeight; y++) {
//    //    // mirroring image
//    //    int offset = x + y * kinect2.depthWidth;
//    //    // Raw depth
//    //    int rawDepth = depth[offset];
        
//    //    int clr = get(x, y);
        
//    //    if (rawDepth > min && rawDepth < max && x < kinect2.depthWidth/2 ) {
//    //     img.pixels[offset] = color(clr) ; 
//    //      sumX += x; 
//    //      sumY += y;
//    //      count++; 
//    //    }

//    //     else if (rawDepth > min && rawDepth < max && x >= kinect2.depthWidth/2 ) {
//    //     img.pixels[offset] = color(clr) ;
//    //      sumX2 += x;
//    //      sumY2 += y;
//    //      count2++;
//    //    }
//    //    else {
//    //      img.pixels[offset] = color(0);
//    //    }
//    //  }
//    //}
    img.updatePixels();
    image(img, 0, 0, w, h);
}



void killParticles() {
  for (int i = p.size() - 1; i >=0; i--) {
    if (p.get(i).isOffScreen()|| p.size()>maxCount) {
      p.remove(i);
    }
  }
}


void keyPressed() {
  bgColor = color(random(255), random(255), random(255));
   c = color(random(255), random(255), random(255));
}
