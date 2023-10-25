$fn=160;
cutoutH=10;
curvsize=40;
curvstart=10;
curvoffset=42;

difference(){
    translate([0,0.3,6]) rotate([-90,0,0]) import("Long Tool Template STL.stl");
    translate([curvstart,-curvoffset,0]) cylinder(cutoutH,r=curvsize);
    translate([curvstart, curvoffset,0]) cylinder(cutoutH,r=curvsize);
    translate([27,7,5]) rotate([0,90,-90]) prism(10, 20, 1.5);
    translate([27,-7,-5]) rotate([0,-90,-90]) prism(10, 20, 1.5);
    translate([32, 2.8,-5]) rotate([0,-90,-90]) prism(10, 15, 2.8);
    translate([32, 2.8, 5]) rotate([0, 90,-90]) prism(10, 15, 2.8);
    translate([32,-2.8,-5]) rotate([0,-90,-90]) prism(10, 15, 2.8);
    translate([32,-2.8, 5]) rotate([0, 90,-90]) prism(10, 15, 2.8);
};


module prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
            points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );
}
