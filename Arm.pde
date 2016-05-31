class Arm {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector location;   // Location
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on
  
  int cx, cy; //clock
  float secondsRadius;

  Arm() {
    
    float s = map(second(), 0, 100, 0, TWO_PI) - HALF_PI; //clock
    location = new PVector(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0,0.0);
    int radius = min(width, height) / 2; //clock
    secondsRadius = radius * .4;
  
  cx = width / 2; //clock
  cy = height / 2;
  }

  PVector attract(Star m) {
    PVector force = PVector.sub(location,m.location);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
  //float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float s = map(frameCount%1000, 0, 1000, 0, TWO_PI) - HALF_PI;
  location = new PVector(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  }

}