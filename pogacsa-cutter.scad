height=45;
width=75;
handle=20;
cutter_thickness=1.6;
handle_thickness=2;
$fn = 280;

difference() {
    cylinder(height,d=width);
    translate([0,0,-0.5]) cylinder(height+1,d=width-cutter_thickness);
};

difference() {
    union() {
        translate([-width/2,-handle/2,0]) cube([width,handle,handle_thickness]);
        translate([-width/2,handle/3,0]) corner();
        translate([-width/2,-handle/3,0]) rotate([0,0,-90]) corner();
        translate([width/2,handle/3,0]) rotate([0,0,90]) corner(); 
        translate([width/2,-handle/3,0]) rotate([0,0,180]) corner();
    };
    difference() {
        translate([0,0,-0.5]) cylinder(height+1,d=width*2);
        translate([0,0,-1]) cylinder(height+2,d=width);
    };
};

module corner() {
    linear_extrude(handle_thickness) polygon([[0,0],[0,handle],[handle,0]]);
};