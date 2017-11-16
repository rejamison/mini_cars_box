$fn = 100;
box_width = 139.5;
box_border_radius = 8;
car_length = 45;
car_width = 30;
car_height = 23;
track_width = 24;
track_length = 120;
lip_width = 2;

//case();
translate([0,-55,car_length + 5]) track_straight();
track_curved();

module case() {
    difference() {
        hull() {
            offset = (box_width / 2) - box_border_radius;
            translate([-offset, -offset, 0]) cylinder(r=box_border_radius, h=car_length);
            translate([-offset, offset, 0]) cylinder(r=box_border_radius, h=car_length);
            translate([offset, -offset, 0]) cylinder(r=box_border_radius, h=car_length);
            translate([offset, offset, 0]) cylinder(r=box_border_radius, h=car_length);
        }
        
        wall_width = 3;
        x_offset = car_width + wall_width;
        y_offset = car_height + wall_width;
        for(x=[-2:1:1]) {
            for(y=[-2:1:2]) {
                translate([(wall_width / 2) + (x_offset * x), (-y_offset / 2) + (wall_width / 2) + (y_offset * y),-.5]) cube([car_width, car_height, car_length + 1]);
            }
        }
    }
}

module track_straight() {
    difference() {
        cube([track_width + lip_width*2,track_length,lip_width * 2]);
        translate([2,-1,lip_width]) cube([track_width,track_length + 2,5]);
        
        translate([track_width / 2 + lip_width,track_length-8,-1]) cylinder(d=10,h=lip_width+2);
        translate([track_width / 2 + lip_width - 2.5,track_length-7,-1]) cube([5,8,lip_width+2]);
    }
    translate([track_width / 2 + lip_width,-8,0]) cylinder(d=9.5,h=lip_width);
    translate([track_width / 2 + lip_width - 2.25,-8,0]) cube([4.5,8,lip_width]);
}

module track_curved() {
    difference() {
        union() {
            difference() {
                cylinder(d=180,h=lip_width * 2);
                translate([0,0,lip_width]) cylinder(d=180-lip_width*2,h=lip_width * 2);
            }
            cylinder(d=180-((track_width+lip_width)*2),h=lip_width*2);
        }
        translate([0,0,-1]) cylinder(d=180-((track_width+lip_width*2)*2),h=lip_width*2+2);
        translate([-100,0,-1]) cube([200,100,100]);
        translate([0,-100,-1]) cube([100,200,100]);
        translate([-90+lip_width+track_width/2,-8,-1]) cylinder(d=10,h=lip_width+2);
        translate([-90+lip_width+track_width/2-2.5,-7,-1]) cube([5,8,lip_width+2]);
    }
    translate([8,-90+lip_width+track_width/2,0]) cylinder(d=9.5,h=lip_width);
    translate([0,-90+lip_width+track_width/2-2.25,0]) cube([8,4.5,lip_width]);
}