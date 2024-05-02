include <ScrewsMetric/ScrewsMetric.scad>;

$fn=100;

thickness=5;

holew=25;
holeh=35;
holed=20;

union(){

    // Main holder
    difference(){
        translate([-thickness,0,0])
            cube([holew+thickness*2,holed,holeh+thickness]);
        union(){
            // rounded top
            translate([holew/2,holed,holeh/2+thickness])
                rotate([90,0,0])
                cylinder(holed,d=holew);
            // square bottom
            cube([holew,holed,holeh/2+thickness]);
        };
    };

    // Left drill flap
    translate([-thickness,holed,0])
            rotate([0,0,180], center=true)
        difference(){
            union(){
                cube([holed,holed,thickness]);
                supports();
            };
            countersink();
        };


    // Right drill flap
    translate([holed+thickness*2,0,0])
        difference(){
            union(){
                cube([holed,holed,thickness]);
                supports();
            };
            countersink();
        };

};

module countersink() {
    translate([holed/2,holed/2,thickness])
        AllenCountersunkBoltHole(5, 5, 100);
}

module supports() {
    support();
    translate([0,holed-thickness,0]) support();
}

module support() {
    translate([0,thickness,thickness])
        rotate([90,0,0])
        linear_extrude(thickness)
        polygon([
                [0,0],
                [0,holeh/2],
                [holew/2,0]
        ]);
}
