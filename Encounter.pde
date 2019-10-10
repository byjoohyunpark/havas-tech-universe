import org.openkinect.processing.*;

//skin
ArrayList<Particle> p;
CenterMover the_cntr;

// The kinect stuff is happening in another class
  Kinect2 kinect2;
 float min = 1000 ; 
 float max = 1500 ; 
 PImage img ;
 int scaleValue ;
 float d ;
 float avgX ;
float avgY ;
float avgX2 ;
float avgY2 ;
float fireX ;
float fireY ;
float volume;


void setup() {
  fullScreen(FX2D);
  //fullScreen(P3D);
  
  noCursor();
  scaleValue = width/512 ;
  
    kinect2 = new Kinect2(this);
    kinect2.initDepth();
    kinect2.initDevice();    
    img = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);

    // skin
     p = new ArrayList<Particle>();
    the_cntr = new CenterMover(512/2, 424/2);
}

void draw() {
  background(0);
//       fill(0, 20);
//       rect(0, 0, width, height);
   
  //println(frameRate);  
  
// add skin particle
    for (int i = 0; i < 10*scaleValue; i++) {
    p.add(new Particle());
  }
  for (Particle i : p) {
    i.update();
    i.show(); 
  
     d = dist(avgX, avgY, avgX2, avgY2);
       if(d<100) {
          for (int j = 0; j < 10; j++) {
   i.gather();
  }
    }  
  }       
   killParticles();
  
 img.loadPixels();
 
int[] depth = kinect2.getRawDepth();
  
float sumX = 0 ; 
float sumY = 0 ; 
float count = 0 ;
float sumX2 = 0 ; 
float sumY2 = 0 ; 
float count2 = 0 ;
 
    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {
        // mirroring image
        int offset = x + y * kinect2.depthWidth;
        // Raw depth
        int rawDepth = depth[offset];
        
        int clr = get(x, y);
        
        if (rawDepth > min && rawDepth < max && x < kinect2.depthWidth/2 ) {
         img.pixels[offset] = color(clr) ; 
          sumX += x; 
          sumY += y;
          count++; 
        }

         else if (rawDepth > min && rawDepth < max && x >= kinect2.depthWidth/2 ) {
         img.pixels[offset] = color(clr) ;
          sumX2 += x;
          sumY2 += y;
          count2++;
        }
        else {
          img.pixels[offset] = color(0);
        }
      }
    }
    img.updatePixels();
    image(img, 0, 0, width, height);

float countMin = 27000;

if(count+count2>2*countMin && count>countMin && count2>countMin){
avgX = sumX / count * scaleValue +120;
avgY = sumY / count *scaleValue ;
avgX2 = sumX2 / count2 *scaleValue -130;
avgY2 = sumY2 / count2 * scaleValue ;

// position for firework
fireX = (avgX+avgX2)/2;
fireY = (avgY+avgY2)/2 -20;

       noStroke();
       if(count > countMin){
        //fill(50, 100, 250);
        //ellipse(avgX, avgY, 20, 20);
       }
       if(count2 > countMin) {
      //fill(250, 100, 50);
      //ellipse(avgX2, avgY2, 20, 20);
     }

//println(count2);
//println(count);
//println(frameRate);

}
}


void killParticles() {
  for (int i = p.size() - 1; i >=0; i--) {
    if (p.get(i).isOffScreen()|| p.size()>20000) {
      p.remove(i);
    }
  }
}