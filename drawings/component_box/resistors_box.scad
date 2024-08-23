// #########################################
// Repository: OpenSCAD
// Name: resistors_box.scad
// Author: Gulo
// Created: 2024-08-22
// Synopsis: A box with embossed and debossed lettering and symbols to hold resistors to be used at conferences or storage
// Requirements:
//   Box long enough to hold through hole resistors
//   Sides embossed with resitor value (as a variable)
//   One end debossed with the Combobulate Tech logo
//   A lid debossed with resistor value (as a variable)
//   Chamfered vertical corners
// Revision History: (Date\tAuthor\tCommit\tMessage)

// #########################################


// ################ Define Variables ################


// ################ Box Shape ################

// Define the outside dimensions of the box
// length, width, height
box_out_l = 102;
box_out_w = 52;
box_out_h = 44;

// Define the interior cutout dimensions of the box, this is the hollow part
// length, width, height
box_in_l = box_out_l - 4;
box_in_w = box_out_w - 4;
box_in_h = box_out_h - 4;

// Define the bottom cutout to be able to stack the box
// length, width, height
box_bot_l = box_out_l - 1;
box_bot_w = box_out_w - 4;
box_bot_h = 2;

// Define the top cutout for the lip the lid slides in to
// length, width, height
box_top_l = box_in_l + 2;
box_top_w = box_in_w + 2;
box_top_h = 2;

// Define the chamfer cylinder sizes
box_chamfer_h = box_out_h;
box_chamfer_r = .07;


// ######## Box Coordinates ########
// Box home coordinates
// Though not required, allows for easy movement of the box
box_x = 0;
box_y = 0;
box_z = 0;

// Interior cutout of the box
box_in_x = box_x + 2;
box_in_y = box_y + 2;
box_in_z = box_z + 4;

// Bottom cutout of the box to allow for stacking
box_bot_x = box_in_x;
box_bot_y = box_in_y;
box_bot_z = box_z;

// Top cutout of the box to create a lip for the lid to slide in to
box_top_x = box_x + 1;
box_top_y = box_y + 1;
box_top_z = box_out_h - 2;

// Side 1 debossed text
box_s1_x = box_x + 9;
box_s1_y = box_y;
box_s1_z = box_z + 12;

// Side 2 debossed text
box_s2_x = box_x + 92;
box_s2_y = box_out_w + 1;
box_s2_z = box_z + 12;

// Side 3 embossed logo
box_s3_x = box_out_l - 1;
box_s3_y = 8;
box_s3_z = 0;

// Corner 1 chamfer
box_c1_x = box_x + .04;
box_c1_y = box_y + .04;
box_c1_z = 0;

// Corner 2 chamfer
box_c2_x = box_x + .04;
box_c2_y = box_out_w - .04;
box_c2_z = 0;

// Corner 3 chamfer
box_c3_x = box_out_l - .04;
box_c3_y = box_out_w - .04;
box_c3_z = 0;

// Corner 4 chamfer
box_c4_x = box_out_l - .04;
box_c4_y = box_y + .04;
box_c4_z = 0;

// ######## Box Misc ########

resistance = "110 Ω";

// ################# Box Lid Shape ################

// Define the lid middle
// length, width, height
lid_mid_l = 102;
lid_mid_w = 52;
lid_mid_h = 2;

// Define the lid top used for stacking
// length, width, height
lid_top_l = lid_mid_l - 4;
lid_top_w = lid_mid_w - 4;
lid_top_h = 2;

// Define the lid bottom used to insert into the box
// length, width, height
lid_bot_l = lid_mid_l - 4;
lid_bot_w = lid_mid_w - 4;
lid_bot_h = 2;

// ######## Lid Coordinates ########

// Lid home coordinates
lid_x = 0;
lid_y = 110;
lid_z = 4;

// Lid top Coordinates
lid_top_x = lid_x + 2;
lid_top_y = lid_y + 2;
lid_top_z = lid_z + 2;

// Lid top embossed Coordinates
lid_top_txt_x = lid_top_x + 6;
lid_top_txt_y = lid_top_y + 13;
lid_top_txt_z = lid_top_z + 1;

// Lid bootom Coordinates
lid_bot_x = lid_x + 2;
lid_bot_y = lid_y + 2;
lid_bot_z = lid_z - 2;


// ################ Build Shape ################


// ######## Build Box ########

// Combine the negative space on positve space into a single object
union() {

    // Chamfer the vertical corners by roudning them with a cylinder
    translate([box_c1_x, box_c1_y, box_c1_z]) {
        cylinder(h=box_chamfer_h, r=box_chamfer_r, $fn=100);
    }
    translate([box_c2_x, box_c2_y, box_c2_z]) {
        cylinder(h=box_chamfer_h, r=box_chamfer_r, $fn=100);
    }
    translate([box_c3_x, box_c3_y, box_c3_z]) {
        cylinder(h=box_chamfer_h, r=box_chamfer_r, $fn=100);
    }
    translate([box_c4_x, box_c4_y, box_c4_z]) {
        cylinder(h=box_chamfer_h, r=box_chamfer_r, $fn=100);
    }

    // Side 1 debossed text
    translate([box_s1_x, box_s1_y, box_s1_z]) {
        // Rotate on the x access so that text can be attached to a side of the box
        rotate([90, 0, 0]) {
            color("pink")
            // Make the text 2 units deep
            linear_extrude(1) {
                 text(resistance, size=23, font="FantasqueSansMono-Bold", direction="ltr");
            }
        }
    }
    
    // Side 2 debossed text
    translate([box_s2_x, box_s2_y, box_s2_z]) {
        // Rotate on the x access so that text can be attached to a side of the box
        rotate([90, 0, 0]) {
            // Mirror on the x axis so that the text is in the correct orientation for the opposite side of the box
            mirror([1, 0, 0]) {
                color("pink")
                // Make the text 2 units deep
                linear_extrude(1) {
                     text(resistance, size=23, font="FantasqueSansMono-Bold", direction="ltr");
                }
            }
        }
    }
    // Create the negative space to shape the box
    difference() {
    
        // Outside of the box
        // Primary box shape to be altered with negative space actions
        translate([box_x, box_y, box_z]) {
            color([0.5, 0.5, 0.5, 0.8])
            cube([box_out_l, box_out_w, box_out_h], center=false);
        }
    
        // ######## Negative Space Actions ########
    
        // Inside cutout to hollow out the box
        translate([box_in_x, box_in_y, box_in_z]){
            color([0.0, 0.5, 0.5, 0.8])
            cube([box_in_l, box_in_w, box_in_h], center=false);
        }
    
        // Bottom cutout for stacking
        // Moving cutout past the short edge to allow for shorter boxes to stack on longer boxes
        translate([box_bot_x, box_bot_y, box_bot_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([box_bot_l, box_bot_w, box_bot_h], center=false);
        }
    
        // Top cutout for the lip for the lid
        translate([box_top_x,box_top_y,box_top_z]) {
            color([0.9, 0.3, 0.5, 0.8])
            cube([box_top_l, box_top_w, box_top_h], center=false);
        }
    
        // Side cutout for the logo
        translate([box_s3_x, box_s3_y, box_s3_z]) {
            // Order matters
            // Rotate the SVG image by 90 degrees on the X and Z axis
            rotate([90, 0, 90]) {
                // Resize the image to the proper size to fit on the side
                // This is exactly 15% of the SVG image size that was used
                resize([27.9, 33.3, 0]) {
                    // Create a 3D representation of the SVG
                    linear_extrude(1) {
                        import("../../SVG/C.svg");
                    }
                }
            }
        }
    }
}

// ######## Build Lid ########

// Combine the negative space on positve space into a single object
union() {

    // Build the lid middle piece which has the stacker on top and the insert into the box on the bottom
    translate([lid_x, lid_y, lid_z]) {
        color([0.5, 0.5, 0.5, 0.8])
        cube([lid_mid_l, lid_mid_w, lid_mid_h], center=false);
    }

    // Build the lid bottom that is used for insertion into the box
    translate([lid_bot_x, lid_bot_y, lid_bot_z]) {
        color([0.5, 0.9, 0.5, 0.8])
        cube([lid_bot_l, lid_bot_w, lid_bot_h], center=false);
    }

    // Add embossed text to the top of the lid
    difference() {
        // Build the lid top that is used for stacking and has an embossed resistor value
        translate([lid_top_x, lid_top_y, lid_top_z]) {
            color([0.9, 0.5, 0.5, 0.8])
            cube([lid_top_l, lid_top_w, lid_top_h], center=false);
        }


        // Top embossed text
        translate([lid_top_txt_x, lid_top_txt_y, lid_top_txt_z]) {
            // Rotate on the x access so that text can be attached to a side of the box
            color("pink")
            // Make the text 1 units deep
            linear_extrude(1) {
                text(resistance, size=23, font="FantasqueSansMono-Bold", direction="ltr");
            }
        }
    }
}
