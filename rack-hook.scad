include <Round-Anything/polyround.scad>
/* include <ScrewsMetric/ScrewsMetric.scad>; */

/* w=2; */ // for prototyping
// subjective, a wider hook is probably stronger because a larger surface is holding the rack
width=15;
// measure length with a ruler, it's from base to top on the longest side
length=100; // 10

/* [Hidden] */
$fn=20;
longlength=length-3;
bodythickness=5;
w=width;

// reallign: 2gLi], gli]]
radiiPoints=[
    [0,  -5,             2   ],
    [0,  0,              0   ],
    [0,  longlength,     0   ],
    [0,  longlength+bodythickness,   2   ],
    [40, longlength+bodythickness,   1   ], // sharp nose
    [26, longlength-2,   0.2 ],
    [26, longlength+1,   0.5 ], // notch depth
    [21, longlength+1,   0.5 ],
    [21, longlength-2,   0.2 ], // end of bottom notch
    [bodythickness,  longlength-2,   0   ],
    [bodythickness,  0,              0   ],
    [20, 0,              0   ], // top hook
    [20, 10,             0   ],
    [25, 10,             4   ],
    [25, -5,             2   ],
];

difference() {
    polyRoundExtrude(radiiPoints,w,1,1);
    /* linear_extrude(w) polygon(polyRound(radiiPoints,30)); */
    #translate([5,1,-1])cylinder(w+2, r=1.8);
    #translate([5,37.25,-1])cylinder(w+2,r=2);
    #translate([5,87.25,-1])cylinder(w+2,r=2.5);
    #translate([5,20,w/2])rotate([0,-90,0])screw_countersunk();
    #translate([5,70,w/2])rotate([0,-90,0])screw_countersunk();
}

module screw_countersunk(
        l=20,   //length
        dh = 7.4,   //head dia
        lh = 4.4,   //head length
        ds = 3.6,  //shaft dia
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
    }
}

