include <ScrewsMetric/ScrewsMetric.scad>;

$fn = 30;
GHOST = false;
outer_size = 40;

difference() {
//    scale([1,1,1.376]) sphere(d = outer_size); // stretch
    sphere(d = outer_size);
    translate([-outer_size/2,-outer_size/2,0]) cube(outer_size);
    translate([-outer_size/2,11,-outer_size+1]) cube(outer_size); // cut
    rotate([0,0,30]) translate([0,0,0.002]) BoltNormalWithSurface(hexHeadBolt, M12, 15+0.002);
}