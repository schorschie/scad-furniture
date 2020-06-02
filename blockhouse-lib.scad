PLANK = 90;
NOTCH = 13;
GAP = 0.5;

module wall(width=46, length, height) {  
    for (start_z = [ 0 : PLANK+GAP : height ])
        translate([length, 0, start_z]) {
    rotate(a=[0, -90, 0]) {
    linear_extrude(height = length) {
    polygon(points=[[0, 0],
                    [0, (width-NOTCH)/2],
                    [1.5*NOTCH, (width-NOTCH)/2],
                    [1.5*NOTCH, (width+NOTCH)/2],
                    [0, (width+NOTCH)/2],
                    [0, width],
                    [PLANK, width],
                    [PLANK, (width-NOTCH)/2],
                    [PLANK+1.5*NOTCH, (width-NOTCH)/2],
                    [PLANK+1.5*NOTCH, (width+NOTCH)/2],
                    [PLANK, (width+NOTCH)/2],
                    [PLANK, 0]]);
    }
    }
    };
};
w = 46;
l = 3900;
wall(length=l, height=2000);
translate([100, -100+w, -PLANK/2]) {
    rotate([0, 0, 90]) { wall(length=3900, height=2000+PLANK); }
}
translate([-100+l+w, -100+w, -PLANK/2]) {
    rotate([0, 0, 90]) { wall(length=3900, height=2000+PLANK); }
}
/*

*/