//controls for in the air stuff

if place_meeting(x, y + vspd + 1, par_collidable)
{
    alarm[0] = 10;
    states = states.walk
}

if vspd < tvel
{
    vspd += grav  * (mdown * fspd + 1); //allow accelleration to terminal velocity // accelerate w/ down key
}

move = mright - mleft;

hspd += move * aspd * fmspd;

if jumping && vspd < 0 //jump boost
{
    vspd -= jbst;
}

scr_collisions(); //collisons

x += hspd; //apply the movements
y += vspd;
