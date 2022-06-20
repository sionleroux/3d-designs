$fn = 30;
end_diameter = 26;
end_thickness = 5;
rod_diameter = 9;
rod_length = 16;
hole_size=4;

union() {
cylinder(h=end_thickness, r=end_diameter/2);
    difference() {
        translate([0, 0, end_thickness]) cylinder(h=rod_length, r=rod_diameter/2);

        translate([0,0,end_thickness+rod_length-5]) rotate([90,0,0]) cylinder(h=rod_diameter+2, d=hole_size, center=true);
        }
}