Bacteria[] subject = new Bacteria[4];
void setup() {
  size(400, 400);
  background(0);
  frameRate(10);
  ellipseMode(CENTER);
  noStroke();
  for(int i = 0; i < 4; i ++) {
    subject[i] = new Bacteria();
    //subject[i].setColor();
  }
}
void mousePressed() {
  setup();
  draw();
}

void draw() {
  //fill(255,255,255);
  for (int i = 0; i < 4; i++) {
    subject[i].move();
    subject[i].show();
  }
  
  //fill(255,0,0);
  //ellipse(200, 200, 50, 50);
  //System.out.println(get(mouseX, mouseY));
}

class Bacteria {
  int myColor;
  int count;
  int myX;
  int myY;
  boolean left;
  boolean right;
  boolean down;
  boolean up;
  boolean noPick;
  int pick;
  Bacteria() {//Constructor
    
    myX = (int)(Math.random() * 401);//(int)(Math.random() * 400) + 1;
    myY = (int)(Math.random() * 401);//(int)(Math.random() * 400) + 1;
    //Ensures circles are reasonably lined up and can't weave through tiny gaps
    if(myX % 5 == 0) {
      myX = (int)(Math.random() * 401);
    }
    if(myY % 5 == 0) {
      myY = (int)(Math.random() * 401);
    }
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    //ellipse(myX, myY, 20, 20);
  }
  void move() {
    left = false;
    right = false;
    down = false;
    up = false;
    count = 0;
    //-16777216 is black
    //checking possible options
    if (get(myX + 19, myY) == -16777216) {
      right = true;
    }
    if (get(myX - 19, myY) == -16777216) {
      left = true;
    }
    if (get(myX, myY - 19) == -16777216) {
      up = true;
    }
    if (get(myX, myY + 19) == -16777216) {
      down = true;
    }
    //decides path
    noPick = true;
    while (noPick && count < 10) {
      pick = (int)(Math.random()*4) +1;
      if (pick == 1) {
        //if(get(myX + 40, myY) != -16777216){
        if (right) {
          myX = myX + 17;
          noPick = false;
          if (myX >= 400) {
            myX = 400;
          }
        } else {
          pick = (int)(Math.random() * 3) + 2;
        }
      } else if (pick == 2) {
        if (left) {
          myX = myX - 17;
          noPick = false;
          if (myX <= 0) {
            myX = 0;
          }
        } else {
          pick = (int)(Math.random() * 4) + 1;
          while (pick == 2) {
            pick = (int)(Math.random() * 4) + 1;
          }
        }
      } else if (pick == 3) {
        if (up) {
          myY = myY - 17;
          noPick = false;
          if (myY <= 0) {
            myY = 0;
          }
        } else {
          pick = (int)(Math.random() * 4) + 1;
          while (pick == 3) {
            pick = (int)(Math.random() * 4) + 1;
          }
        }
      } else if (pick == 4) {
        if (down) {
          myY = myY + 17;
          noPick = false;
          if (myY >= 400) {
            myY = 400;
          }
        } else {
          pick = (int)(Math.random() * 4) + 1;
          while (pick == 4) {
            pick = (int)(Math.random() * 4) + 1;
          }
        }
      }
      //System.out.println(noPick);
      count++;
    }
  }
  void show() {
    fill(myColor);
    ellipse(myX, myY, 20,20);
  }
}
