int i=0;

void setup()
{
  size(400, 400, P3D);
  noFill();
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
              cameraZ/10.0, cameraZ*10.0);
}

void draw(){
  background(255);
  pushMatrix();
  translate(250, 250, 0);
  rotateX(-i*PI/180);
  rotateY(i*PI/180);
  box(200);
  popMatrix();
  i++;
}