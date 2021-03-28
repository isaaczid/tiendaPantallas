/***
*Clase encargada de representar en pantalla los datos obtenidos por el arduino
*/

abstract class MedidasPosiciones{
  protected int posX,posY,largo,ancho;
  protected int proporcion;
}

class Monitor extends MedidasPosiciones{
  //Atributos
  //private int posX,posY,largo,ancho;
  //private int proporcion;
  private color colorFondo;
  private Pantalla pantalla;
  private final color COLOR_INICIAL = color(255,140,52);
  private final int PROPORCION_INICIAL = 3;
  
  private class Pantalla extends MedidasPosiciones{
    //private int posX,posY,largo,ancho;
    //private int proporcion;
    private final int LARGO_MONITOR = width;
    private final int ANCHO_MONITOR = height;
    private final int BORDES = 7;
    private final color COLOR_INICIAL = color(255);
    private final color COLOR_CONTORNO = color(0);
    private final int TAM_CONTORNO = 3;
    
    public Pantalla(int proporcion){
      this.proporcion = proporcion;
      
      this.setPosicion();
    }
    
    public void dibujar(){
      this.setPosicion();
      
      stroke(this.COLOR_CONTORNO);
      strokeWeight(this.TAM_CONTORNO);
      fill(this.COLOR_INICIAL);
      rect(this.posX,this.posY,this.largo,this.ancho,this.BORDES);
    }
    
    public void setProporcion(int proporcion){
      this.proporcion = proporcion;
    }
    
    private void setPosicion(){
      this.largo = this.LARGO_MONITOR - (this.LARGO_MONITOR / this.proporcion);
      this.ancho = this.ANCHO_MONITOR - (this.ANCHO_MONITOR / this.proporcion);
      this.posX = (width / 2) - this.largo / 2;
      this.posY = (height / 2) - this.ancho / 2;
    }
  }
  
  //Metodos
  public Monitor(int posX,int posY,int largo,int ancho){
    this.posX = posX;
    this.posY = posY;
    this.largo = largo;
    this.ancho = ancho;
    this.proporcion = this.PROPORCION_INICIAL;
    
    this.setColor(this.COLOR_INICIAL);
    this.pantalla = new Pantalla(this.proporcion);
  }
  
  public void dibujar(){
    fill(this.colorFondo);
    noStroke();
    rect(this.posX,this.posY,this.largo,this.ancho);
    this.pantalla.dibujar();
  }
  
  public void dibujar(int proporcion){
    this.pantalla.setProporcion(proporcion);
    
    fill(this.colorFondo);
    noStroke();
    rect(this.posX,this.posY,this.largo,this.ancho);
    this.pantalla.dibujar();
  }
  
  public void dibujar(boolean transparencia){
    if(transparencia){
      noFill();
    }else{
      fill(this.colorFondo);
      noStroke();
      rect(this.posX,this.posY,this.largo,this.ancho);
      this.pantalla.dibujar();
    }
  }
  
  public void dibujar(boolean transparencia, int proporcion){
    this.pantalla.setProporcion(proporcion);
    
    if(transparencia){
      noFill();
    }else{
      fill(this.colorFondo);
      noStroke();
      rect(this.posX,this.posY,this.largo,this.ancho);
      this.pantalla.dibujar();
    }
  }
  
  private void setColor(color colorFondo){
    this.colorFondo = colorFondo;
  }
}
