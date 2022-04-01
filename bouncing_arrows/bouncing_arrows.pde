arrowmove img1, img2, img3;
ArrayList<arrowmove> memberlist = new  ArrayList<arrowmove>();//makes a list that can contain members

void setup() {
  imageMode(CENTER);
  img1 = new arrowmove(50, 10, 2, 1);//var  old>>50, 10, 3, 5; 400, 150, 1, 0
  img2 = new arrowmove(150, 200, 5, 3);//var old>> 550, 150, 1, 0
  img3 = new arrowmove(10, 200, 2, 7);
  size(2000, 1000);
  frameRate(50);

  memberlist.add(0, img1);//adds the member img1 at postion 0
  memberlist.add(1, img2);
  memberlist.add(2, img3);
}

void draw() {
  memberlist.get(0).backgrounddraw();//=>img1.backgrounddraw();//memberlist

  /*
  if ((img1.collision(img2) || img2.collision(img1)) && (img1.imgoverboundary() || img2.imgoverboundary())) {//if member one and member 2 is colliding and one is hitting the side
   img1.hit(true);
   img2.hit(true);
   print("carrot");
   } else   //might not need this
   */
   
  int k;
  for (int i = 0; i < 3; i++) {
    k  = 1 + i;
    if (k == 3) {
      k = 0;
    }
    if (memberlist.get(i).collision(memberlist.get(k))) {
      memberlist.get(i).hit(false);
      memberlist.get(k).hit(false);
      //print("bannana"); //test function
    }
    memberlist.get(i).refreshimg();
    memberlist.get(k).refreshimg();
  }
}
