// Spotlight Handle
// My brother-in-law has a car battery powered spotlight, the battery
// sits in a custom made box with metal handles welded on but it's
// pretty heavy and cuts into your hands when you lift it.
// This design is for a pair of comfortable plastic handles that clip
// on to make the battery pack easier to carry.

il=110; // inner length
ih=30; // inner height
iw=3; // inner width
oh=40; // outer height
ow=30; // 30 is also okay; outer height
gap=0.2; // for the part to fit on

difference(){
    // outter handle, scaled to be narrower for your hands
    scale([ow/oh,1,1]) cylinder(il,r=oh/2);
    // rectangular cut-out with gap for spacing
    translate([-iw/2-gap,-ih/2-gap,-1])
        #cube([iw+gap*2,ih*1.5+gap,il+2]);

    // represents the shape of the metal handle
    translate([-iw/2,-ih/2,-5]) %cube([iw,ih,il+10]);
};
