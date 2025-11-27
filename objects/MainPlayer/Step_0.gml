//Moement Keys
key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump  = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));
key_kick  = keyboard_check_pressed(ord("F")) || mouse_check_button(mb_left)

mx = key_right - key_left;

vsp += global.GRAVITY;




var collision_source = Collission_Object; 
var _subpx=0.5;

player_states();
player_animations();
// Try to fix  movement stucks
if (hsp != 0 && place_meeting(x + hsp, y, collision_source)) {
	var _pixelCheck = _subpx + sign(hsp);
    while (hsp != 0 && !place_meeting(x + _pixelCheck, y, collision_source)) {
		
        x += _pixelCheck
    }
	if (state=="kick"){
		kicked_kb=true
	}
    hsp = 0;
	kicked_kb=false
}
x += hsp; 


if (place_meeting(x, y + vsp, collision_source)) {
	var _pixelCheck2 = _subpx * sign(vsp);
    while (!place_meeting(x, y + _pixelCheck2, collision_source)) {
        y += _pixelCheck2
    }
    vsp = 0; 
}
y += vsp;


on_ground = place_meeting(x, y+2, collision_source);