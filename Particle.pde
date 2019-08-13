class Particle {
  float x, y;
  int lifeTime;
  PVector pos, ppos, vel, acc, cntr;
  boolean os;
  color c;
  float op;
  float radius ;

  Particle() {
    x = random(w);
    y = random(h);
    //r = 0;
    radius = random(3);
    cntr = the_cntr.pos.copy();
    pos = new PVector(x, y);
    ppos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    lifeTime = 0;
    op = 0;
    if (random(100) < 10) {    
      if (random(100) < 90) {        
        c = color(82, 0, 255);
      } else {
        c = color(255, 255, 0);
      }
    } else {
      c = color(255);
    }
  }

  void show() {
    fill(c, op); 
    ellipse(ppos.x, ppos.y, radius, radius);
  }

  void update() {
    ppos = pos.copy();
    acc = pos.copy();
    acc.sub(cntr);
    acc.div(50000);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);  
    lifeTime++;

    if (op < 255) {
      op += random(8, 12);
    }
  }
  
  
  //void gather(){
  //  float magnetism = 1.0; 
  //  float gensoku = 0.95; 
    
  //  float distance = dist(fireX/scaleValue, fireY/scaleValue, pos.x, pos.y); //dist(x1,y1,x2,y2) 
  //  if(distance > 3){ 
  //    acc.x = magnetism * (fireX/scaleValue - pos.x) / (distance * distance); 
  //    acc.y = magnetism * (fireY/scaleValue - pos.y) / (distance * distance);
  //  }
  // vel.add(acc);

  //  vel.x = vel.x*gensoku ;
  //  vel.y = vel.y*gensoku ;
    
  //  pos.add(vel);  
    
  //  float sokudo = dist(0,0,vel.x,vel.y); 
  //  float r = map(sokudo, 0, 5, 0, 255); 
  //  float g = map(sokudo, 0,5, 64, 255);
  //  float b = map(sokudo, 0,5, 128, 255);
  //  fill(r, g, b, 32);
  //}
  
  
  boolean isOffScreen() {
    if (pos.x < 0 || pos.x > w || pos.y < 0 || pos.y > h) {
      return true;
    } else {
      return false;
    }
  }
}
