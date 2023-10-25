// 17x10cm
platform_width=170;
platform_length=100;
platform_height=2;
// Top: max: 4.5, min: 3, height: 4
clearance=1;
top_outter_width=50-clearance;
top_inner_width=40+clearance;
top_height=40;
// Border width: 0.5, height from surface: 1
border_width=5;
border_height=platform_height+10;

union(){

    difference(){

        union(){
            // hex grid bottom
            intersection(){
                cube([platform_width, platform_length, platform_height]);
                hexgrid([platform_width, platform_length, platform_height], 11, 4.5);
            };

            // border for the cutout
            translate([platform_width/2-top_outter_width/2,platform_length/2-top_outter_width/2,0])
                cube([top_outter_width,top_outter_width,platform_height]);
        };

        // cut this out of the grid from underneath the cross top
        translate([platform_width/2-top_inner_width/2,platform_length/2-top_inner_width/2,-top_height/2])
            cube([top_inner_width,top_inner_width,top_height]);
    };

    // tall wall border
    difference(){
        translate([-border_width/2,-border_width/2]) cube([platform_width+border_width, platform_length+border_width, border_height]);
        translate([0,0,-1]) cube([platform_width, platform_length, border_height+2]);
    };

    // top cap for fence post
    translate([platform_width/2-top_outter_width/2,platform_length/2-top_outter_width/2,0])
        difference(){
            cube([top_outter_width,top_outter_width,top_height]);
            translate([top_outter_width/2-top_inner_width/2,top_outter_width/2-top_inner_width/2,-(top_outter_width-top_inner_width)]) cube([top_inner_width,top_inner_width,top_height+1]);
            // the corners to cut out the cross shape
            cutout_size=top_outter_width/2;
            cutout_offset=cutout_size/3;
            positive_offset=-cutout_offset;
            negative_offset=cutout_size+cutout_offset;
            translate([negative_offset,negative_offset,-1])cube([cutout_size,cutout_size,top_height+2]); // bottom-left
            translate([negative_offset,positive_offset,-1])cube([cutout_size,cutout_size,top_height+2]); // bottom-right
            translate([positive_offset,negative_offset,-1])cube([cutout_size,cutout_size,top_height+2]); // top-left
            translate([positive_offset,positive_offset,-1])cube([cutout_size,cutout_size,top_height+2]); // top-right
        };

};

// hex module by ggrievesis licensed CC-BY from thingiverse.com/thing:1296149
// ---
module hex(hole, wall, thick){
    hole = hole;
    wall = wall;
    difference(){
        rotate([0, 0, 30]) cylinder(d = (hole + wall), h = thick, $fn = 6);
        translate([0, 0, -0.1]) rotate([0, 0, 30]) cylinder(d = hole, h = thick + 0.2, $fn = 6);
    }
}
// first arg is vector that defines the bounding box, length, width, height
// second arg in the 'diameter' of the holes. In OpenScad, this refers to the corner-to-corner diameter, not flat-to-flat
// this diameter is 2/sqrt(3) times larger than flat to flat
// third arg is wall thickness.  This also is measured that the corners, not the flats.
module hexgrid(box, holediameter, wallthickness) {
    a = (holediameter + (wallthickness/2))*sin(60);
    for(x = [holediameter/2: a: box[0]]) {
        for(y = [holediameter/2: 2*a*sin(60): box[1]]) {
            translate([x, y, 0]) hex(holediameter, wallthickness, box[2]);
            translate([x + a*cos(60), y + a*sin(60), 0]) hex(holediameter, wallthickness, box[2]);
        }
    }
}
// ---
