int COLS_NUM = 40;
int ROWS_NUM = 20;

float[][] posx = new float[COLS_NUM][ROWS_NUM];
float[][] posy = new float[COLS_NUM][ROWS_NUM];

float[][] velx = new float[COLS_NUM][ROWS_NUM];
float[][] vely = new float[COLS_NUM][ROWS_NUM];

void setup() {
  fullScreen();

  float xStepAmount = (width - 200)/(posx.length - 1);
  float yStepAmount = (height - 200)/(posx[0].length - 1);

  for (int i = 0; i < posx.length; i++) {
    for (int j = 0; j < posx[0].length; j++) {
      posx[i][j] = 100 + i * xStepAmount;
      posy[i][j] = 100 + j * yStepAmount;
      velx[i][j] = random(-3,3);
      vely[i][j] = random(-3,3);
    }
  }

  noCursor();
  noStroke();
}

void draw() {
  fill(0,50);
  rect(0,0,width,height);

  for (int i = 0; i < posx.length; i++) {
    for (int j = 0; j < posx[0].length; j++) {

      float r = map(i,0,posx.length,0,255);
      float g = map(j,0,posx[0].length,0,255);
      float b = map(dist(mouseX,mouseY,posx[i][j],posy[i][j]),0,200,255,0);
      float s = max(map(dist(mouseX,mouseY,posx[i][j],posy[i][j]),0,1000,20,5),0);
      fill(r,g,b);  
      posx[i][j] += random(-1,1);
      posy[i][j] += random(-1,1);
      ellipse(posx[i][j], posy[i][j], s, s);
      
      if (posx[i][j] < 0 || posx[i][j] > width) {
        velx[i][j] *= -1;
        posx[i][j] += velx[i][j];
      } else {
        posx[i][j] += velx[i][j];
      }
      
      if (posy[i][j] < 0 || posy[i][j] > height) {
        vely[i][j] *= -1;
        posy[i][j] += vely[i][j];
      } else {
        posy[i][j] += vely[i][j];
      }
    }
  }
 
}