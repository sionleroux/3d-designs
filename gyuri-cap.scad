$fn=360;
height=25;
diameter=21.5;
wall_thick=2.0;
top_bed_depth=0;

difference() {
    cylinder(h=height, d=diameter);
    translate([0,0,height-top_bed_depth]) cylinder(d=diameter-wall_thick, h=top_bed_depth+1);
    translate([0,0,-1]) cylinder(h=height-top_bed_depth-wall_thick+1, d=diameter-wall_thick);
};