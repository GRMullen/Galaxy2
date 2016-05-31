class Star {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float rcolorvar = random(.8,1.2);
  float gcolorvar = random(.8,1.2);
  float bcolorvar = random(.8,1.2);
  float colorgroup = random(0,1);
  float luminosity = random(0,500);
  float alph = luminosity;
  float paleness = 180; //0-250, 250 being palest
  
  Star(float m, float x, float y, float opacity) {
    float massvar = random(2);
    mass = m * massvar;
    location = new PVector(x,y);
    luminosity = opacity;
    rcolorvar = rcolorvar * 1.3;
    bcolorvar = bcolorvar * 1.3;
    gcolorvar = gcolorvar * 1.3;
  }
  
  Star(float m, float x, float y) {
    //luminosity = -1000;
    float massvar = random(2);
    mass = m * massvar;
    location = new PVector(x,y);
    //float v = random(0, 0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    
    if (location.x > width/2){
      velocity.y = 1;
    }
    else {
      velocity.y = -1;
    }
    
    if (location.y > height/2){
      velocity.x = -1;
    }
    else {
      velocity.x = 1;
    }

  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    velocity.y = (location.x - width/2)/200;
    //velocity.x = -1*(location.y - height/2)/475;
  }

  void display() {
    float flicker = random(0,20);
    float r = paleness;
    float g = paleness;
    float b = paleness;
    
    
    if (colorgroup < 0.2) {
      b = 255.0;
    }
    else if (colorgroup < 0.4) {
      r = 255.0;
    }
    else if (colorgroup < 0.6) {
      r = 255.0;
      g = 255.0;
    }
    else {
      r = 255.0;
      b = 255.0;
    }
    if (flicker < 0.3) {
      alph = luminosity/20;
    }
    else if(flicker < 1) {
      alph = luminosity;
    }
    stroke(0,0,0,0);
    if (dist(this.location.x, this.location.y, width/2, height/2) <= 100) {
      r = r * 1.5;
      g = g * 1.5;
      b = b * 1.5;
      alph = 255;
    }
    fill(r*rcolorvar,g*gcolorvar,b*bcolorvar,alph/3);
    ellipse(location.x,location.y,mass*40,mass*40);
    fill(r*rcolorvar,g*gcolorvar,b*bcolorvar,alph);
    ellipse(location.x,location.y,mass*25,mass*25);

  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }
}