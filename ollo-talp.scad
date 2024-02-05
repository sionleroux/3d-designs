h=18;
w=35;
d=60;
padding=5;

difference() {
    cube([w,d,h]);
    translate([padding/2,padding/2,h+2-padding*2]) cube([w-padding,d-padding,h+1-padding*2]);
}
