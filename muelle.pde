class muelle { //<>// //<>// //<>//
  // ATRIBUTOS
  PVector longitud_natural;
  float KM;
  color color_muelle;

  // CONSTRUCTOR
  muelle(PVector ln, float cm, color c) 
  {
    longitud_natural = new PVector(ln.x, ln.y);
    KM = cm;
    color_muelle = c;
  }
  // Metodos
  PVector fuerza_que_hago(particula p0, particula p1) 
  {
    PVector f = new PVector(0.0, 0.0);
    // Ley de Hooke
    // Fmuelle = -KF * (longitud natural - longitud real)
    // longitud real = longitud entre ambas particulas
    f.x = -KM* (longitud_natural.x - (p1.pos.x - p0.pos.x));
    f.y = -KM* (longitud_natural.y - (p1.pos.y - p0.pos.y));
    return f;
  }

  void pintate(particula p0, particula p1) {
    strokeWeight(3);
    stroke(color_muelle);
    line(p0.pos.x, p0.pos.y, p1.pos.x, p1.pos.y);
  }
}

void pintarMuelles()
{
  int aux = 0;

  for (int i = 0; i < numeroMuelles; i++, aux++)
  {
    if (i < numeroMuelles/2)
    {
      if (particulaArray[aux].partFinal)
      {
        aux++;
      }
      muelleArray[i].pintate(particulaArray[aux], particulaArray[aux + 1]);
    }
    else
    {
      muelleArray[i].pintate(particulaArray[i - numeroMuelles/2], particulaArray[i - numeroMuelles/2 + partXFila]);
    }
  }
}


void calcularFuerzas()
{
  PVector fm = new PVector(0.0, 0.0);
  int aux = 0;

  for (int i = 0; i < numeroMuelles; i++, aux++)
  {
    if (i < numeroMuelles/2)
    {
      if (particulaArray[aux].partFinal)
      {
        aux++;
      }
      fm = muelleArray[i].fuerza_que_hago(particulaArray[aux], particulaArray[aux + 1]);
      particulaArray[aux].fuerza.x += fm.x;
      particulaArray[aux].fuerza.y += fm.y;
      particulaArray[aux + 1].fuerza.x -= fm.x;
      particulaArray[aux + 1].fuerza.y -= fm.y;
    }
    else
    {
      fm = muelleArray[i].fuerza_que_hago(particulaArray[i - numeroMuelles/2], particulaArray[i - numeroMuelles/2 + partXFila]);
      particulaArray[i - numeroMuelles/2].fuerza.x += fm.x;
      particulaArray[i - numeroMuelles/2].fuerza.y += fm.y;
      particulaArray[i - numeroMuelles/2 + partXFila].fuerza.x -= fm.x;
      particulaArray[i - numeroMuelles/2 + partXFila].fuerza.y -= fm.y;
    }
    
  }
}


void initMuelles()
{
  for (int i = 0; i < numeroMuelles; i++)
  {
    muelleArray[i] = new muelle(new PVector(0.0, 0.0), 0.05, color(255, 255, 0));
  }
}
