  import org.openkinect.processing.*;
  Kinect2 kinect2;
 
 
  ArrayList <Particle> p;
  CenterMover the_cntr;

  float min = 500 ; 
  float max = 2200 ; 
  PImage img ;
  int number = 2000;
  int maxCount = 4000;
 
  int w;
  int h;
  

  void setup() {
     //fullScreen(FX2D);
     size(800, 800);
         
     w =  800;// width; 
     h = 800;// height; 
     
     noStroke();
    //noCursor();
    
    
     kinect2 = new Kinect2(this);
     kinect2.initDepth();
     kinect2.initDevice();    
     img = createImage( kinect2.depthWidth,  kinect2.depthHeight, RGB);
    
    //img = createImage(w, h, ARGB);

     p = new ArrayList<Particle>();
     the_cntr = new CenterMover(kinect2.depthWidth/2, kinect2.depthHeight/2);
}

void draw() {
   fill(0, 100);
   rect(0, 0, w, h);
   
    for (int i = 0; i < number; i++) {
    p.add(new Particle());
    }
  
  for (Particle i : p) {
    i.update();
    i.show(); 
  }       
   killParticles();
  
 img.loadPixels();
 
 
//for (int x = 0; x <  w; x++) {
//      for (int y = 0; y < h; y++) {
//   int clr = get(x, y);
//   img.pixels[x + y * w] = color(clr);
//      }}
 
 int[] depth = kinect2.getRawDepth();
 
    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {
        // mirroring image
        int offset = x + y * kinect2.depthWidth;
        // Raw depth
        int rawDepth = depth[offset];
        
        int clr = get(x, y);
        
        if(rawDepth > min && rawDepth < max){
           img.pixels[offset] = color(clr) ; 
        }
        else {
          img.pixels[offset] = color(0);
        }
      }
    }

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
