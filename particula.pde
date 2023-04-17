class particula {
  // ATRIBUTOS
  PVector pos, vel, fuerza;
  float masa, KF;
  boolean estatica;
  boolean partFinal;

  // CONSTRUCTOR
  particula(PVector p, PVector v, float m, float f, boolean e, boolean pF) {
    pos = p;
    vel = v;
    fuerza = new PVector(0.0, 0.0, 0.0);
    masa = m;
    KF = f;
    estatica = e;
    partFinal = pF;
  }
  // MÉTODOS
  void muevete() {  // El SOLVER!!! empleamos un EULER :)
    // 1- Fuerza y la Aceleracion
    PVector acel;
    acel = new PVector(0.0, 0.0, 0.0);
    
    // Las fuerzas de gravedad y fricción

    fuerza.x += -KF * vel.x;
    fuerza.y += -KF * vel.y;

    fuerza.x += 0.0;
    fuerza.y += 9.8;

    // De fuerza a aceleración
    // NEWTON Suma Fuerzas = Masa x Aceleracion
    acel.x = fuerza.x/masa;
    acel.y = fuerza.y/masa;

    // 2- Velocidad
    vel.x = vel.x + acel.x * inc_t;
    vel.y = vel.y + acel.y * inc_t;

    if (!estatica) 
    {
      // 3- Posicion
      pos.x = pos.x + vel.x * inc_t;
      pos.y = pos.y + vel.y * inc_t;
    }
  }
}

void resetearFuerzas()
{
  // Reset fuerzas
  for (int i = 0; i < numeroPart; i++) 
  {
    particulaArray[i].fuerza.x = 0.0;
    particulaArray[i].fuerza.y = 0.0;
  }
}

void calcularPosiciones()
{
  for (int i = 0; i < numeroPart; i++)
  {
   particulaArray[i].muevete();
  }
  
}

void initParticulas()
{
  for (int i = 0; i < numeroPart; i++)
  {
    if (i == 9)
    {
      particulaArray[i] = new particula(new PVector(spawnX, spawnY), new PVector(0.0, 0.0), 1.0, 0.3, true, true);
      spawnY += 100.0f;
      spawnX = 0.0f;
    } 
    else if (i == 0)
    {
      particulaArray[i] = new particula(new PVector(spawnX, spawnY), new PVector(0.0, 0.0), 1.0, 0.3, true, false);
    } 
    else if (i % 10 == 9)
    {
      particulaArray[i] = new particula(new PVector(spawnX, spawnY), new PVector(0.0, 0.0), 1.0, 0.3, false, true);
      spawnY += 100.0f;
      spawnX = 0.0f;
    } 
    else
    {
      particulaArray[i] = new particula(new PVector(spawnX, spawnY), new PVector(0.0, 0.0), 1.0, 0.3, false, false);
    }
    spawnX += 100.0f;
  }
}
