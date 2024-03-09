include <Round-Anything/polyround.scad>
$fn=60;

cube_height=5;
cube_inner_hole=46;
circ_height=38;
circ_inner_hole=41;
thickness=8;

profile = [
    [43/2, 0 , 0],
    [43/2, 38, 0],
    [50/2, 38, 0],
];

difference(){
    union(){
        /* rotate_extrude(angle = 360, convexity = 2) */
        /*     polygon(polyRound(profile,$fn)); */

        translate([0,0,cube_height/2+circ_height])
            difference(){
                translate([0,0,-4]) cube([
                    cube_inner_hole+thickness,
                    cube_inner_hole+thickness,
                    cube_height+4
                ],true);
                #cube([cube_inner_hole,cube_inner_hole,cube_height],true);
            };

        cylinder(
            circ_height,
            r1=(circ_height+thickness)/2,
            r2=(circ_height+thickness*2)/2
        );
    };

translate([0,0,-1]) #cylinder(circ_height+8,r=circ_inner_hole/2);
};
