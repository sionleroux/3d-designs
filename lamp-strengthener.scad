include <Round-Anything/polyround.scad>
$fn=60;

cubeheight=5;
circheight=38;

profile = [
    [43/2, 0 , 0],
    [43/2, 38, 0],
    [50/2, 38, 0],
];

difference(){
    union(){
        /* rotate_extrude(angle = 360, convexity = 2) */
        /*     polygon(polyRound(profile,$fn)); */

        translate([0,0,cubeheight/2+circheight])
            difference(){
                translate([0,0,-4]) cube([50,50,cubeheight+4],true);
                cube([44,44,cubeheight],true);
            };

        cylinder(circheight,r1=43/2,r2=50/2);
    };

    cylinder(circheight+2,r=35/2);
};
