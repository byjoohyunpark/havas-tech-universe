//import org.openkinect.processing.*;

//skin
ArrayList <Particle> p;
CenterMover the_cntr;

// The kinect stuff is happening in another class
//Kinect2 kinect2;
 float min = 1000 ; 
 float max = 1500 ; 
 PImage img ;
 int number = 1000;
 int maxCount = 3000;

void setup() {
     fullScreen(FX2D);
     //fullScreen(P3D);
     background(0);
     noStroke();
    //noCursor();
    
   
  
    //kinect2 = new Kinect2(this);
    //kinect2.initDepth();
    //kinect2.initDevice();    
    //img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
    img = createImage(width, height, ARGB);

     p = new ArrayList<Particle>();
    the_cntr = new CenterMover(width/2, height/2);
}

void draw() {
   fill(0, 100);
   rect(0, 0, width, height);
   fill(255);
   
  
    for (int i = 0; i < number; i++) {
    p.add(new Particle());
  }
  for (Particle i : p) {
    i.update();
    i.show(); 
  }       
   killParticles();
  
 img.loadPixels();
 

for (int x = 0; x <  width; x++) {
      for (int y = 0; y < height; y++) {
   int clr = get(x, y);
   img.pixels[x + y * width] = color(clr);
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
    image(img, 0, 0, width, height);
}



void killParticles() {
  for (int i = p.size() - 1; i >=0; i--) {
    if (p.get(i).isOffScreen()|| p.size()>maxCount) {
      p.remove(i);
    }
  }
}
