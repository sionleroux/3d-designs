$fn=360;
height=60;
diameter=13.5;
wall_thick=7.0;

// keep all the parts together
union(){

    // pipe sides
    difference(){
        cylinder(h=height,d=diameter+wall_thick);
        translate([0,0,-1]) cylinder(h=height+2,d=diameter);

        // cut-out
        cutxy=flatxy;
        union(){
            translate([0,0,height/2+cutxy/2]) rotate([90,0,0]) cylinder(h=cutxy,d=diameter,center=true);
            translate([0,0,height/3*2+cutxy/2]) cube([diameter,cutxy,height/3],center=true);
        };
    };

    // platform
    flatxy=diameter+wall_thick;
    intersection(){
        translate([-flatxy/2,-flatxy/2,height/3-wall_thick/2])
            cube([flatxy,flatxy,wall_thick]);
        cylinder(h=height,d=diameter+wall_thick); // copy of pipe sides
    };
};
