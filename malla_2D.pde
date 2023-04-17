// ZONA DE VARIABLES Y OBJETOS

// LOS OBJETOS
int partXFila = 10;
int partXCol = 10;
int numeroPart = partXFila * partXCol;
int numeroMuelles = (partXFila * (partXFila - 1)) + (partXCol * (partXCol - 1));
particula[] particulaArray = new particula[numeroPart];
muelle[] muelleArray = new muelle[numeroMuelles];
// DELTA TIEMPO
float inc_t;
// SPAWN PARTICULAS
float spawnX = 100.0f;
float spawnY = 10.0f;


// ZONA DE SETUP
void setup() {

  size(1200, 800);

  initParticulas();

  initMuelles();

  // Tiempo
  inc_t = 0.04;
}

// ZONA DE DRAW
void draw()
{
  background(0);

  resetearFuerzas();

  calcularFuerzas();

  calcularPosiciones();

  pintarMuelles();
}
