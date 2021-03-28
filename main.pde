color colorPelota1 = color(255,0,244);
color colorFondo = color(0);
boolean transparencia = true;
Pelota pelota;
Monitor monitor;

void setup(){
  size(1280,720);
  
  pelota = new Pelota(width/2, height/2, 100);
  monitor = new Monitor(0,0,width,height);
}

void draw(){
  background(colorFondo);
  pelota.dibujar();
  pelota.animar();
  noFill();
  
  monitor.dibujar(transparencia,12);
}

void mousePressed(){
  transparencia = (mouseButton == LEFT)?false:true;
}

void mouseReleased(){
  transparencia = true;
}
