class Ball{
  PVector position;
  float radius;
  color c;

  Ball(PVector _position, float _radius, color _c) {
    position = _position;
    radius = _radius;
    c = _c;
  }

  void show() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, radius*2, radius*2); 
  }
}
