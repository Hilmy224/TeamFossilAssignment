x = MainPlayer.x;
y = MainPlayer.y;

//opt for distance is better
//light_dir = point_direction(x, y, NearestLightDetector.nearX, NearestLightDetector.nearY);
//if (light_dir > 45 && light_dir < 135) { 
//	player_light_dir = "u"; 
//} else if (light_dir > 135 && light_dir < 225) { 
//	player_light_dir = "l"; 
//} else if (
//	light_dir > 315 && light_dir < 45) {
//	player_light_dir = "r"; 
//}

var dx = NearestLightDetector.nearX - x;
var dy = NearestLightDetector.nearY - y;
//show_debug_message(string(x)+ string(",") + string(y));
//show_debug_message(string(NearestLightDetector.nearX)+ string("-") + string(NearestLightDetector.nearY));
//show_debug_message(string(dx)+ string("-") + string(dy));

//Diretional should be better now
if (abs(dx) > abs(dy)) {
    player_light_dir = (dx > 0) ? "l" : "r";
} else if (abs(dx) < abs(dy)) {
    player_light_dir ="u";
} 

if (abs(dx) > 650){
	visible=false
}



switch (MainPlayer.state) {
    case "idle":
        spr_name = "player_idle_light_" + player_light_dir;
        break;
	
    case "walk":
        spr_name = "Player_walk_light_" + player_light_dir;
        break;

    case "jump":
        spr_name = "Player_jump_light_" + player_light_dir;
        break;

    case "kick":
        spr_name = "Player_Kick_rev_light_" + player_light_dir;
        break;
}

spr = asset_get_index(spr_name);

//Sprites reset to fast maybe
if (spr != -1 && sprite_index != spr) {
	visible=true
	image_index=MainPlayer.image_index
    sprite_index = spr;
	image_speed = (MainPlayer.state != "kick") ? 1 : 0.2;
	//image_speed = 1;

}

//show_debug_message(MainPlayer.state + string(",") + string(spr))

if (MainPlayer.hsp != 0) {
    image_xscale = (MainPlayer.state == "kick")
        ? MainPlayer.facing_dir
        : sign(MainPlayer.hsp);
} else {
    image_xscale = MainPlayer.facing_dir;
}