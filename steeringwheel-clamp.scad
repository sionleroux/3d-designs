include <ScrewsMetric/ScrewsMetric.scad>;

hole_w=70; // d
hole_h=20; // r
extra_h=10;
padding=10;
hole_size=4;
$fn=90;

union() {
    
    difference(){
        // semi-circle cutout
        translate([0,extra_h+padding/2,0]) semioval(hole_w/2+padding,hole_h+padding,padding);
        translate([padding,extra_h+padding,0]) semioval(hole_w/2,hole_h,padding);
    };
    
    // screw holes
    translate([padding,padding/1.5,0]) drillhole(hole_size,padding*2,padding/2);
    translate([hole_w+padding,padding/1.5,0]) drillhole(hole_size,padding*2,padding/2);
};

module semioval(w,h, height) {
    intersection(){
        cube([w*2,h,height]);
        translate([w,0,0]) scale([1, h/w, 1]) cylinder(h=height, r=w, center=false);
    };
}

module drillhole(hole_size,padding,height) {
    difference(){
        translate([-padding/2,-padding/2,0]) cube([padding,padding,height]);
//        cylinder(h=height,r=hole_size/2);
        translate([0,0,height]) BoltNormalWithSurface(hexHeadBolt, M4, height);
    }
}
