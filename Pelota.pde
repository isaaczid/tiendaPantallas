class Pelota{
  //Atributos
  private int posX,posY,diametro,radio;
  private int velocidadX,velocidadY;
  private int limXInf,limXSup;
  private int limYInf,limYSup;
  private color colorPelota;
  private final color COLOR_INICIAL = color(255,255,255);
  private final int VEL_X_INICIAL = 5;
  private final int VEL_Y_INICIAL = 5;
  
  //Metodos
  public Pelota(int posX,int posY,int diametro){
    this.radio = diametro / 2;
    this.posX = posX;
    this.posY = posY;
    this.diametro = diametro;
    this.limXInf = 0 + radio;
    this.limXSup = width - radio;
    this.limYInf = 0 + radio;
    this.limYSup = height - radio;
    
    this.setColor(this.COLOR_INICIAL);
    this.setVelocidadX(this.VEL_X_INICIAL);
    this.setVelocidadY(this.VEL_Y_INICIAL);
    this.velocidadX *= this.numeroAleatorio();
    this.velocidadY *= this.numeroAleatorio();
  }
  
  public void dibujar(){
    noStroke();
    fill(this.colorPelota);
    ellipse(this.posX,this.posY,diametro,diametro);
  }
  
  public void dibujar(color colorPelota){
    this.setColor(colorPelota);
    
    noStroke();
    fill(this.colorPelota);
    ellipse(this.posX,this.posY,diametro,diametro);
  }
  
  public void animar(){
    if(this.posX <= this.limXInf || this.posX >= this.limXSup){
      this.setColor(color(255,0,0));
      this.velocidadX *= -1;
    }
    if(this.posY <= this.limYInf || this.posY >= this.limYSup){
      this.setColor(color(0,255,0));
      this.velocidadY *= -1;
    }
    
    this.posX += this.velocidadX;
    this.posY += this.velocidadY;
  }
  
  public void animar(int velocidadX,int velocidadY){
    this.setVelocidadX(velocidadX);
    this.setVelocidadY(velocidadY);
    
    if(this.posX <= this.limXInf || this.posX >= this.limXSup){
      this.setColor(color(255,0,0));
      this.velocidadX *= -1;
    }
    if(this.posY <= this.limYInf || this.posY >= this.limYSup){
      this.setColor(color(0,255,0));
      this.velocidadY *= -1;
    }
    
    this.posX += this.velocidadX;
    this.posY += this.velocidadY;
  }
  
  private int numeroAleatorio(){
    int numero = 0;
    
    while(numero == 0){
      numero = round(random(-1, 1));
    }
    
    return numero;
  }
  
  private void setVelocidadX(int velocidadX){
    this.velocidadX = velocidadX;
  }
  
  private void setVelocidadY(int velocidadY){
    this.velocidadY = velocidadY;
  }
  
  private void setColor(color colorPelota){
    this.colorPelota = colorPelota;
  }
}
