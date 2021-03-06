
scr_sprite_walk();

//if none of the movement keys are pressed, go to the stand state
if !( moveing )
{
    states = states.stand;
}

//check for if in the air
if !place_meeting(x, y + vspd + 1, par_collidable)
{
    states = states.air
}

// horizontal move code

move = mright + -mleft; //movement direction

hspd = move * wspd //put movement in hspd

//speed increase for running
if shift
{
    hspd *= 1 + rspd
}

//spead decrease when moving away from mouse
//left
if scr_facemouse() && hspd > 0
{
    hspd *= nfmspd;
}
//right
if !scr_facemouse() && hspd < 0
{
    hspd *= nfmspd;
}
show_debug_message(string(sign(hspd)));

//verticle move code
if place_meeting(x, y + 1, par_collidable)//only jump when on floor
{
    vspd = jump * -jspd //do the jump
}

//auto stepping
var astep_dist = scr_obstacle_steppable(sign(hspd))
show_debug_message("astep: "+string(astep_dist));
if astep_dist != 0
{
    //vspd = -astep_dist / 1.5;
    x += sign(hspd);
    y -= astep_dist
}

//collisons and movement application
scr_collisions();


