import processing.serial.*;

final int velocidad = 9600;
color colorPelota1 = color(255,0,244);
color colorFondo = color(0);
boolean transparencia = true;
Pelota pelota;
Monitor monitor;
Serial arduino;
String peso;
String puerto;

void setup(){
  size(1280,720);
  
  puerto = Serial.list()[0];
  println(puerto);
  pelota = new Pelota(width/2, height/2, 100);
  monitor = new Monitor(0,0,width,height);
  arduino = new Serial(this, puerto, velocidad);
}

void draw(){
  leerDatosArduino();
  
  background(colorFondo);
  pelota.dibujar();
  pelota.animar();
  noFill();
  
  monitor.dibujar(transparencia,3);
  monitor.setText(peso, transparencia);
}

void leerDatosArduino(){
  if(arduino.available() > 0){
    String datosRecibidos = arduino.readStringUntil('\n');
    
    if(datosRecibidos != null){
      peso = datosRecibidos;
    }
  }
}

void mousePressed(){
  transparencia = (mouseButton == LEFT)?false:true;
}

void mouseReleased(){
  transparencia = true;
}
