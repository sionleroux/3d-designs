$fn=40;
height=16;
width=20;

difference(){
    union(){
        cylinder(h=height, d=width); // shell
        translate([0,0,height]) cylinder(h=8, d1=width, d2=width/2); // hump
    };
    translate([0,0,-1]) cylinder(h=height-1, d=width-2); // shell hollowness
    cylinder(h=24, d=4); // inner cutout
};

