include <Round-Anything/polyround.scad>

$fn=20;
circlediam=8.2;
stickwidth=6;
stickthick=1.6;
eyethick=2.8;
eyedistance=29;
eyeoffsetdown=-5.5;


union(){
    mirror([1,0,0]) rightside();
    rightside();
};

module rightside(){

    difference(){
        union(){
            // eyes on the side with holes in
            translate([eyedistance,eyeoffsetdown,-(eyethick-stickthick)])
                difference(){
                    cylinder(eyethick,d=circlediam);
                    #translate([0,0,-1])
                        cylinder(eyethick+2,d=4);
                }

            // standing up flat tower thingies
            towerinset=1;
            translate([8.5,towerinset/2,0]) cube([1.2,stickwidth-towerinset,4.5]);

            // flat stick thing
            // reallign: 2gLi], gli]]
            radiiPoints=[
                [-1,  0, 0 ],
                [eyedistance-stickwidth/2, 0, 15 ],
                [eyedistance-stickwidth/2, eyeoffsetdown+1, 0 ],
                [eyedistance, eyeoffsetdown+3, 0 ], // indent to get the curve out of the eye hole
                [eyedistance+stickwidth/2, eyeoffsetdown+1, 0 ],
                [eyedistance+stickwidth/2, stickwidth, 15 ],
                [-1,  stickwidth, 0 ],
            ];
                polyRoundExtrude(radiiPoints,stickthick,0,0);
        };

        // 1.8mm hole in the middle to put a nail in
        #translate([0,2.5,-1]) cylinder(stickthick+2,d=1.8);
    };
};
