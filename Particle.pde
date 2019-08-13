class Particle {
  float x, y;
  int lifeTime;
  PVector pos, ppos, vel, acc, cntr;
  boolean os;
  float op;
  float radius ;


  Particle() {
    x = random(w);
    y = random(h);
    radius = random(3);
    cntr = the_cntr.pos.copy();
    pos = new PVector(x, y);
    ppos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    lifeTime = 0;
    op = 0;


    
    //if (random(100) < 10) {    
    //  if (random(100) < 90) {        
    //    c = color(82, 0, 255);
    //  } else {
    //    c = color(255, 255, 0);
    //  }
    //} else {
    //  c = color(255);
    //}
  }

  void show() {
    fill(c, op); 
        //fill(c, 100, 100, 1); 
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

    if (op < 100) {
      op += random(8, 12);
    }
  }
  
  
  boolean isOffScreen() {
    if (pos.x < 0 || pos.x > w || pos.y < 0 || pos.y > h) {
      return true;
    } else {
      return false;
    }
  }
}
