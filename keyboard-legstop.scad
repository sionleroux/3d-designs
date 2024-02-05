$fn=60;
height=45;
diameter=22.5;
wall_thick=3.0;
nub_r=3;
nub_spacing=1.5;
nubs_per_level=3;
slice_width=5;
slice_angle=14;

difference() {
    union() {
        cylinder(h=height, d=diameter);
        for(j=[1:nubs_per_level]) {
            a=j*(360/nubs_per_level);
            for(i=[1:height/(2*(nub_r+nub_spacing))]) translate([
                (diameter/2-nub_r/2)*cos(a),
                (diameter/2-nub_r/2)*sin(a),
                (2*nub_r+nub_spacing)*i-nub_spacing
            ]) sphere(nub_r);
        }
    }
//    translate([0,0,-1]) cylinder(h=height-wall_thick+1, d=diameter-wall_thick);
    translate([0,0,-1]) cylinder(h=height+2, d=diameter-wall_thick);
    rotate([0,0,slice_angle]) translate([0,0,-1]) cube([diameter,slice_width,height+2]);
};
