// Einheiten: cm

SPIEL = 1 ;

BETT_BREITE_UNTEN = 100;
BETT_BREITE_OBEN = 80;
BETT_LAENGE = 200;

LIEGEHOEHE_UNTEN = 30 ;
LIEGEHOEHE_OBEN = 100 ;

LATTEN_DICKE = 2 ;

BETT_PLANKE_DICKE = 2 ;
BETT_PLANKE_HOEHE = 20 ;

BETT_PFOSTEN_DICKE = 6 ;
BETT_PFOSTEN_HOEHE = 150 ;
BETT_KANTE_HOEHE = 50 ;

module lattenrost(bett_breite,
                  bett_laenge,
                  raumlage=[0, 0, 0],
                  raumwinkel=[0, 0, 0],
                  latten_dicke=2,
                  latten_breite=5,
                  latten_anzahl=20)
{
    zaehler = latten_anzahl-1;
    
    rotate(raumwinkel) {
        translate(raumlage + [0, 0, latten_dicke]) {
            for (ii = [ 0 : 1 : zaehler]) {
                translate([0, ii * (bett_laenge-latten_breite)/zaehler, 0]) {
                    cube([bett_breite, latten_breite, latten_dicke]);
                }
            }
            translate([0, 0, -latten_dicke]) {
                cube([2*latten_dicke, bett_laenge, latten_dicke]);
            }
            translate([bett_breite-2*latten_dicke, 0, -latten_dicke]) {
                cube([2*latten_dicke, bett_laenge, latten_dicke]);
            }
        }
    }     
}
  
 lattenrost(BETT_BREITE_UNTEN-SPIEL,
            BETT_LAENGE,
            raumlage=[SPIEL/2, 0, LIEGEHOEHE_UNTEN],
            latten_dicke=LATTEN_DICKE);

 lattenrost(BETT_BREITE_OBEN-SPIEL,
            BETT_LAENGE,
            raumlage=[SPIEL/2, 0, LIEGEHOEHE_OBEN],
            latten_dicke=LATTEN_DICKE);

// Lattenrostauflage UNTEN HINTEN
translate([0, SPIEL/2, LIEGEHOEHE_UNTEN-2*LATTEN_DICKE]) {
    cube([2*LATTEN_DICKE, BETT_LAENGE-SPIEL, 2*LATTEN_DICKE]);
}
translate([-BETT_PLANKE_DICKE, -SPIEL/2, LIEGEHOEHE_UNTEN-3*LATTEN_DICKE]) {
    cube([BETT_PLANKE_DICKE, BETT_LAENGE+SPIEL, BETT_PLANKE_HOEHE]) ;
}

// Lattenrostauflage UNTEN VORNE
translate([BETT_BREITE_UNTEN-2*LATTEN_DICKE, 
           SPIEL/2, 
           LIEGEHOEHE_UNTEN-2*LATTEN_DICKE]) {
    cube([2*LATTEN_DICKE, BETT_LAENGE-SPIEL, 2*LATTEN_DICKE]);
}
translate([BETT_BREITE_UNTEN,
           -SPIEL/2,
           LIEGEHOEHE_UNTEN-3*LATTEN_DICKE]) {
    cube([BETT_PLANKE_DICKE, BETT_LAENGE+SPIEL, BETT_PLANKE_HOEHE]) ;
}

// Lattenrostauflage OBEN HINTEN
translate([0, SPIEL/2, LIEGEHOEHE_OBEN-2*LATTEN_DICKE]) {
    cube([2*LATTEN_DICKE, BETT_LAENGE-SPIEL, 2*LATTEN_DICKE]);
}
translate([-BETT_PLANKE_DICKE, -SPIEL/2, LIEGEHOEHE_OBEN-3*LATTEN_DICKE]) {
    cube([BETT_PLANKE_DICKE, BETT_LAENGE+SPIEL, BETT_PLANKE_HOEHE]) ;
}

// Lattenrostauflage OBEN VORNE
translate([BETT_BREITE_OBEN-2*LATTEN_DICKE, 
           SPIEL/2, 
           LIEGEHOEHE_OBEN-2*LATTEN_DICKE]) {
    cube([2*LATTEN_DICKE, BETT_LAENGE-SPIEL, 2*LATTEN_DICKE]);
}
translate([BETT_BREITE_OBEN,
           -SPIEL/2,
           LIEGEHOEHE_OBEN-3*LATTEN_DICKE]) {
    cube([BETT_PLANKE_DICKE, BETT_LAENGE+SPIEL, BETT_PLANKE_HOEHE]) ;
}

// BETTPFOSTEN_HINTEN_0
translate([-BETT_PLANKE_DICKE-SPIEL, -BETT_PFOSTEN_DICKE-SPIEL/2, 0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_PFOSTEN_HOEHE]) ;
}

// BETTPFOSTEN MITTE 0
translate([-BETT_PLANKE_DICKE-SPIEL+BETT_BREITE_OBEN, 
           -BETT_PFOSTEN_DICKE-SPIEL/2, 
           0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_PFOSTEN_HOEHE]) ;
}

// BETTPFOSTEN VORNE 0
translate([-BETT_PLANKE_DICKE-SPIEL+BETT_BREITE_UNTEN, 
           -BETT_PFOSTEN_DICKE-SPIEL/2, 
           0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_KANTE_HOEHE]) ;
}

// BETTPFOSTEN_HINTEN_+
translate([-BETT_PLANKE_DICKE-SPIEL, BETT_LAENGE+SPIEL/2, 0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_PFOSTEN_HOEHE]) ;
}

// BETTPFOSTEN MITTE +
translate([-BETT_PLANKE_DICKE-SPIEL+BETT_BREITE_OBEN, 
           BETT_LAENGE+SPIEL/2, 
           0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_PFOSTEN_HOEHE]) ;
}

// BETTPFOSTEN VORNE +
translate([-BETT_PLANKE_DICKE-SPIEL+BETT_BREITE_UNTEN, 
           BETT_LAENGE+SPIEL/2, 
           0]) {
    cube([BETT_PFOSTEN_DICKE, BETT_PFOSTEN_DICKE, BETT_KANTE_HOEHE]) ;
}














