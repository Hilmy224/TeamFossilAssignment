//Moement Keys
key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump  = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));
key_kick  = keyboard_check_pressed(ord("F"));

mx = key_right - key_left;

vsp += global.GRAVITY;

player_states();
player_animations();


var collision_source = Collission_Object; 

// Try to fix  movement stucks
if (place_meeting(x + hsp, y, collision_source)) {

    while (!place_meeting(x + sign(hsp), y, collision_source)) {
        x += sign(hsp);
    }
    hsp = 0; 
}
x += hsp; 


if (place_meeting(x, y + vsp, collision_source)) {

    while (!place_meeting(x, y + sign(vsp), collision_source)) {
        y += sign(vsp);
    }
    vsp = 0; 
}
y += vsp;


on_ground = place_meeting(x, y + 1, collision_source);
show_debug_message(on_ground);