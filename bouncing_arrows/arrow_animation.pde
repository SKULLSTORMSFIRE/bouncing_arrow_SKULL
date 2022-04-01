class arrowmove {
  int x, y, deltax, deltay, circlesize;//members/ vars to call inside of the class

  PImage topright = loadImage("topright.png");
  PImage bottomright = loadImage("bottomright.png");
  PImage bottomleft = loadImage("bottomleft.png");
  PImage topleft = loadImage("topleft.png");
  PImage img;

  arrowmove(int x, int y, int deltax, int deltay) { //constructor/ call from the main
    this.x = x;
    this.y = y;
    this.deltax = deltax;
    this.deltay = deltay;
  }

  void imgswap() {//swaps image based on the magnitudes
    if (deltax >= 0 && deltay < 0)
      img = topright;
    if (deltax >= 0 && deltay >= 0)
      img = bottomright;
    if (deltax < 0 && deltay < 0)
      img = topleft;
    if (deltax < 0 && deltay >= 0)
      img = bottomleft;
  }

  boolean collision(arrowmove nextmember) {//passes through true or false if 2 members hit
    if (abs(this.x - nextmember.x)<=100 && abs(this.y - nextmember.y)<=100) {
      return true;
    } else {
      return false;
    }
  }

  void hit(boolean sidebounce) {//call this to make members reflect
    if (sidebounce == false) {
      deltax = - deltax;
      deltay = - deltay;
    } else if (sidebounce == true) {
      if (x>=600) {
        deltax = - abs(deltax);
      }//reve50 x direction, right edge
      if (x<=100) {
        deltax = abs(deltax);
      }//left edge
      if (y<=100) {
        deltay = abs(deltay);
      }///top edge
      if (y>=600) {
        deltay = - abs(deltay);
      }//bottom edge
    }
  }

  void refreshimg() {//resfreshes image
    hit(true);
    imgswap();
    x += deltax;
    y += deltay;
    image (img, x, y);
  }

  void backgrounddraw() {//draws the background
    background(125);
    line(650, 50, 650, 650);
    line(50, 650, 650, 650);
    line(50, 50, 50, 650);
    line(50, 50, 650, 50);
  }
}//end of class description
