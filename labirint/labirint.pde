int vx=0;
int vy=0;
int px=350;
int py=0;
int nx=125;
int ny=425;
int d=0;
int s=3;
int ca=0;
int cb=0;
int start = 0; // переменная радиуса окружности

float y = start;
float y1 = 500;

int sec = 0;
int fail = 0;

float speed = 0.95; // скорость движения объекта
color life_color1 = color(255,0,0);
color life_color2 = color(255,0,0);
color life_color3 = color(255,0,0);

Heart heart1, heart2, heart3;

PImage img, img1, img2, img3, img4;


void setup() {
size(500,500);

heart1 = new Heart();
heart2 = new Heart();
heart3 = new Heart();

img = loadImage("ship.png");
img1 = loadImage("meteor.png");
img2 = loadImage("meteor.png");
img3 = loadImage("space.png");
img4 = loadImage("wall.jpg");

}

void draw() {

background(255);
fill(0);
image(img3,0,0);

noStroke();
fill(250,120,120);
image(img1, 200, y, 40, 40); //метеориты
image(img2, 300, y1, 40, 40);


image(img4, vx, vy,100,500);
image(img4, vx+400,vy,100,500);
rect(vx+100,vy+300,200,100);image(img4, vx+100,vy+300,200,100);
image(img4, vx+200,vy+100,200,100);

y += speed;
y1 -= speed;// Увеличение x

if (y > height) { // Если фигура вышла за край окна,

y = -start;} // она возвращается к левому краю

if (y1 < 0){
  y1 = 500;}

stroke(1);


if(keyPressed&&(key==CODED)) {

  if(keyCode==UP) {ny=ny-s;}

  if(keyCode==DOWN) {ny=ny+s;}

  if(keyCode==RIGHT) {nx=nx+s;}

  if(keyCode==LEFT) {nx=nx-s;}

}


if ((ny>=y)&&(ny<=y+40)&&(nx>=160)&&(nx<=220)){ny = 425;nx=125; fail+=1; }
if ((ny>=y1)&&(ny<=y1+40)&&(nx>=260)&&(nx<=320)){ny = 425;nx=125; fail+=1; } 

if(ny>height+10) {ny=-70;}  // края

if(ny<-70) {ny=height+10;}  // края

if(nx+20<vx+100-d) {nx=125;ny=425;ca=cb=0;} // левый борт

if(nx+50>vx+400+d) {nx=125;ny=425;ca=cb=0;} //правый борт

if((nx+20<vx+300-d)&&(ny>vy+300+d)&&(ny+10<vy+400-d)) {nx=125;ny=425;ca=cb=0;} //верх у старта

if((nx>vx-40+200+d)&&(ny>vy+100+d)&&(ny<vy+200-d)) {nx=125;ny=425;ca=cb=0;} // финиш пересечение респавн

if((nx>px-40)&&(ny<py+100)&&(ny>py)) {ca=cb=255; textSize(32); fill(255);text("YOU WIN",180,282);} //финиш цвет

else {ca=cb=0;}

fill(ca,255,0);
rect(px,py,50,100);
fill(255,cb,0);
//rect(nx,ny,10,10);
image(img, nx, ny, 70, 70);

if (fail == 1){life_color1 = color(0);}
if (fail == 2){life_color2 = color(0);}
if (fail == 3){life_color3 = color(0); textSize(32); fill(255); text("YOU LOSE",200,250);}
if (fail == 0){life_color1=life_color2=life_color3=color(255,0,0);}

fill(life_color1);
heart1.heart(120, 12, 340, 350, 360, 380);  

fill(life_color2);
heart2.heart(170, 12, 340, 350, 360, 380);

fill(life_color3);
heart2.heart(220, 12, 340, 350, 360, 380);

}
