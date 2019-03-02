/*
    box(float breite, float hoehe, float tiefe, float dicke, float <2x1> devider)
    creates a shell like cube with one open side and [n,m] n horizontal deviers 
    and m vertical deviders.

    wall(float <2x1> start, float <2x1> end, float height, float thickness)
    creates a wall from start x,y to end x,y with thickness and height.

    pairdoor(float width, float height, float deepness, float thickness, float devider=[0, 0], bool open_door=1)
    creates a box with a pair door. The flag open_door defines, whether the doors are open or not.

    stool(float width, float deepness, float height, float thickness)
    makes a four legged stool like object.
*/

DOOR_ANGLE = 70 ; // Angle for open doors

module box(breite, hoehe, tiefe, dicke, trennwaende=[0, 0]) {
    difference () {
        cube([breite, tiefe, hoehe]);
        translate ([dicke, -dicke, dicke]) {
            cube([breite-2*dicke, tiefe, hoehe-2*dicke]);
        };
    }
    
    delta_v = (breite - (2 + trennwaende[0] ) * dicke) / (trennwaende[0] + 1) ;
    delta_h = (hoehe - (2 + trennwaende[1] ) * dicke)  / (trennwaende[1] + 1) ;

    for (vv = [ 1 : 1 : trennwaende[0] ] ) {
        translate( [ vv * (delta_v + dicke), 0, dicke ] ) {
            cube( [dicke, tiefe - dicke, hoehe - 2 * dicke] ) ;
        }
    }
    for (hh = [ 1 : 1 : trennwaende[1] ] ) {
        translate( [ dicke , 0, hh * (delta_h + dicke)] ) {
            cube( [breite - 2*dicke, tiefe - dicke, dicke] ) ;
        }
    }
}

module wall(start, ende, hoehe, dicke) {
    dx = ende[0] - start[0] ;
    dy = ende[1] - start[1] ;
    X = pow(dx, 2) ;
    Y = pow(dy, 2) ;
    laenge = sqrt(X + Y) ;
    winkel = ( ende[0] >= start[0] ) ? atan(dy/dx) : atan(dy/dx) + 180 ; 
    translate([start[0], start[1], 0]) {
        rotate([0, 0, winkel]) {
            translate([0, -dicke/2, 0]) {
                cube([laenge, dicke, hoehe]) ;
            }
        }
    }
}

module pairdoor(width, height, deepness, thickness, devider=[0, 0], open_door=1) {
    box(width, height, deepness, thickness, devider) ;
    rotate_angle = open_door * DOOR_ANGLE ;

    translate([0, -thickness, 0]) { 
        rotate([0, 0, -rotate_angle]) {
            cube([width/2, thickness, height]) ; 
        }
    } 
    translate([width, -thickness, 0]) {
        rotate([0, 0, 180+rotate_angle]) {
            translate([0, -thickness, 0]) {
                cube([width/2, thickness, height]) ; 
            }
        }
    }
}

module swingdoor(width, height, deepness, thickness, devider=[0, 0], open_door=1, left_door=1) {
    box(width, height, deepness, thickness, devider) ;
    rotate_angle = open_door * DOOR_ANGLE ;

    if (left_door) {
        translate([0, -thickness, 0]) { 
            rotate([0, 0, -rotate_angle]) {
                cube([width, thickness, height]) ; 
            }
        } 
    } else {
        translate([width, -thickness, 0]) {
            rotate([0, 0, 180+rotate_angle]) {
                translate([0, -thickness, 0]) {
                    cube([width, thickness, height]) ; 
                }
            }
        }
    }
}

module stool(width, deepness, height, thickness) {
    translate([0, 0, height-thickness]) {
        cube([width, deepness, thickness]) ;
    }

    cube([thickness, thickness, height-thickness]) ;

    translate([width-thickness, 0, 0]) {
        cube([thickness, thickness, height-thickness]) ;
    }
    translate([0, deepness-thickness, 0]) {
        cube([thickness, thickness, height-thickness]) ;
    }
    translate([width-thickness, deepness-thickness, 0]) {
        cube([thickness, thickness, height-thickness]) ;
    }
}