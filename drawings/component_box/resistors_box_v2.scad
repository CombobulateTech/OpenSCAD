// #########################################
// Repository: OpenSCAD
// Name: resistors_box_v2.scad
// Author: Gulo
// Created: 2024-08-23
// Synopsis: A box with embossed and debossed lettering and symbols to hold resistors to be used at conferences or storage
// Requirements:
//   Box long enough to hold through hole resistors
//   Sides embossed with resitor value (as a variable)
//   One end debossed with the Combobulate Tech logo
//   A lid debossed with resistor value (as a variable)
//   Chamfered vertical corners
//   Box made of sliders for cleaner prints
//   Other short side will need to be shorter than the first side to leave space for the lid to slide in
// Revision History: (Date\tAuthor\tCommit\tMessage)

// #########################################


// ################ Define Variables ################


// ################ Dimensions ################


// Define all of the side dimensions
side_length = 102;
side_width = 52;
side_height = 44;
side_thickness = 4;
side_switch_thickness = 8;

// Define all groove dimensions
groove_length = side_length;
groove_width = side_width - 4;
groove_height = side_height - 2;
groove_thickness = side_thickness - 2;

// Define all tongue dimensions
tongue_length = groove_length;
tongue_width = groove_width;
tongue_height = groove_height;
tongue_thickness = groove_thickness + 0.04;
tongue_switch_thickness = groove_thickness;

// ######## Coordinates ########


// Short side 1 coordinates
short_s1_x = 0;
short_s1_y = 0;
short_s1_z = 0;

// Short side 1 vertical groove 1
short_s1_g1_vert_x = short_s1_x + groove_thickness;
short_s1_g1_vert_y = short_s1_y + groove_thickness;
short_s1_g1_vert_z = short_s1_z + groove_thickness;

// Short side 1 vertical groove 2
short_s1_g2_vert_x = short_s1_x + groove_thickness;
short_s1_g2_vert_y = (short_s1_y + side_width) - (groove_thickness * 2);
short_s1_g2_vert_z = short_s1_z + groove_thickness;

// Short side 1 horizontal groove 3
short_s1_g3_horiz_x = short_s1_x + groove_thickness;
short_s1_g3_horiz_y = short_s1_y + groove_thickness;
short_s1_g3_horiz_z = side_height - (groove_thickness * 2);

// Short side 1 horizontal groove 4
short_s1_g4_horiz_x = short_s1_x + groove_thickness;
short_s1_g4_horiz_y = short_s1_y + groove_thickness;
short_s1_g4_horiz_z = short_s1_z + groove_thickness;

//######## Long Side 1 ########

// Long side 1 coordinates
long_s1_x = short_s1_x + 6;
long_s1_y = short_s1_y - 6;
long_s1_z = short_s1_z;

// Long side 1 vertical tongue 1
long_s1_t1_vert_x = long_s1_x - groove_thickness;
long_s1_t1_vert_y = long_s1_y + (groove_thickness / 2);
long_s1_t1_vert_z = long_s1_z + groove_thickness;

// Long side 1 vertical groove 1
long_s1_g1_vert_x = (long_s1_x + side_length) - (groove_thickness * 2);
long_s1_g1_vert_y = long_s1_y + groove_thickness;
long_s1_g1_vert_z = long_s1_z + groove_thickness;

// Long side 1 horizontal groove 2
long_s1_g2_horiz_x = long_s1_x;
long_s1_g2_horiz_y = long_s1_y + groove_thickness;
long_s1_g2_horiz_z = side_height - (groove_thickness * 2);

// Long side 1 horizontal groove 3
long_s1_g3_horiz_x = long_s1_x;
long_s1_g3_horiz_y = long_s1_y + groove_thickness;
long_s1_g3_horiz_z = long_s1_z + groove_thickness;


//######## Long Side 2 ########

// Long side 2 coordinates
long_s2_x = short_s1_x + 6;
long_s2_y = side_width + 6;
long_s2_z = short_s1_z;

// Long side 2 vertical tongue 1
long_s2_t1_vert_x = long_s2_x - groove_thickness;
long_s2_t1_vert_y = long_s2_y + (groove_thickness / 2);
long_s2_t1_vert_z = long_s2_z + groove_thickness;

// Long side 2 vertical groove 1
long_s2_g1_vert_x = (long_s2_x + side_length) - (groove_thickness * 2);
long_s2_g1_vert_y = long_s2_y;
long_s2_g1_vert_z = long_s2_z + groove_thickness;

// ######## Box Misc ########

resistance = "110 Ω";

// ################# Box Lid Shape ################



// ################ Build Shape ################


// ######## Short Side 1 ########


// Create the negative space of the groove in short side 1
difference() {

    // Create short side 1 of the box
    translate([short_s1_x, short_s1_y, short_s1_z]) {
        color([0.5, 0.5, 0.5, 0.8])
        cube([side_thickness, side_width, side_height], center=false);
    }

    // Create short side 1 vertical groove 1
    translate([short_s1_g1_vert_x, short_s1_g1_vert_y, short_s1_g1_vert_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([groove_thickness, groove_thickness, groove_height], center=false);
    }
    
    // Create short side 1 vertical groove 2
    translate([short_s1_g2_vert_x, short_s1_g2_vert_y, short_s1_g2_vert_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([groove_thickness, groove_thickness, groove_height], center=false);
    }

    // Create short side 1 horizontal groove 3
    translate([short_s1_g3_horiz_x, short_s1_g3_horiz_y, short_s1_g3_horiz_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([groove_length, groove_width, groove_thickness], center=false);
    }
    
    // Create short side 1 horizontal groove 4
    translate([short_s1_g4_horiz_x, short_s1_g4_horiz_y, short_s1_g4_horiz_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([groove_length, groove_width, groove_thickness], center=false);
    }
}

// ######## Long Side 1 ########


// Join the tongue to the long side
union() {
    // Create long side 1 vertical tongue 1
    translate([long_s1_t1_vert_x, long_s1_t1_vert_y, long_s1_t1_vert_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([tongue_thickness, tongue_thickness, tongue_height], center=false);
    }

    // Create the negative space of the groove in long side 1
    difference() {
        // Create long side 1 of the box
        translate([long_s1_x, long_s1_y, long_s1_z]) {
            color([0.5, 0.5, 0.5, 0.8])
            cube([side_length, side_thickness, side_height], center=false);
        }

        // Create long side 1 vertical groove 1
        translate([long_s1_g1_vert_x, long_s1_g1_vert_y, long_s1_g1_vert_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([groove_thickness, groove_thickness, groove_height], center=false);
        }

        // Create long side 1 horizontal groove 2
        translate([long_s1_g2_horiz_x, long_s1_g2_horiz_y, long_s1_g2_horiz_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([groove_length, groove_thickness, groove_thickness], center=false);
        }

        // Create long side 1 horizontal groove 3
        translate([long_s1_g3_horiz_x, long_s1_g3_horiz_y, long_s1_g3_horiz_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([groove_length, groove_thickness, groove_thickness], center=false);
        }
    }
}

// ######## Long Side 2 ########


// Join the tongue to the long side
union() {
    // Create long side 2 vertical tongue 1
    translate([long_s2_t1_vert_x, long_s2_t1_vert_y, long_s2_t1_vert_z]) {
        color([0.9, 0.5, 0.5, 0.8])
        cube([tongue_thickness, tongue_thickness, tongue_height], center=false);
    }

    // Create the negative space of the groove in long side 2
    difference() {
        // Create long side 2 of the box
        translate([long_s2_x, long_s2_y, long_s2_z]) {
            color([0.5, 0.5, 0.5, 0.8])
            cube([side_length, side_thickness, side_height], center=false);
        }

        // Create long side 2 vertical groove 1
        translate([long_s2_g1_vert_x, long_s2_g1_vert_y, long_s2_g1_vert_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([groove_thickness, groove_thickness, groove_height], center=false);
        }
    }
}
