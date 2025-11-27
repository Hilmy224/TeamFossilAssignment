x = MainPlayer.x;
y = MainPlayer.y -85;
radius = (sprite_width) * 0.5;

var inst = collision_circle(x, y, radius, LightSrcPositionObj, false, true); 

if (inst != noone) {
	nearX=inst.x
	nearY=inst.y
    show_debug_message("Something at " + string(inst.x) + ", " + string(inst.y));
}

