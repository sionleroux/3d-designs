h=7;
w=7;
d=250;
padding=5;
bigarm=40;
smallarm=10;

union() {
    translate([0,d/2,0]) cube([w,d,h], center=true);
    translate([0,-bigarm/2,0]) cube(bigarm, center=true);
    translate([0,d,0]) cylinder(20,r=smallarm/2, center=true);
}
