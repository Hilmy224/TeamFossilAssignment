function player_states() {

    state_timer++;

    switch (state) {

        case "idle":
            state_idle();
            break;

        case "walk":
            state_walk();
            break;

        case "jump":
            state_jump();
            break;

        case "kick":
            state_kick();
            break;
    }

}


function state_idle() {

    var mx = key_right - key_left;
    hsp = mx * global.PLAYER_SPEED;
	
	if (mx != 0) facing_dir = mx; //Animaiton Facing Check
	
    if (mx != 0) {
        state = "walk";
        state_timer = 0;
        return;
    }

    if (key_jump && on_ground) {
        vsp = global.PLAYER_JUMP;
        state = "jump";
        state_timer = 0;
        return;
    }

    if (key_kick) {
        state = "kick";
        state_timer = 0;
        return;
    }
}

function state_walk() {

    var mx = key_right - key_left;
    hsp = mx * global.PLAYER_SPEED;
	
	if (mx != 0) facing_dir = mx; // Animation Check

    if (mx == 0) {
        state = "idle";
        state_timer = 0;
        return;
    }


    if (key_jump && on_ground) {
        vsp = global.PLAYER_JUMP;
        state = "jump";
        state_timer = 0;
        return;
    }


    if (key_kick) {
        state = "kick";
        state_timer = 0;
        return;
    }
}
	
function state_jump() {

    var mx = key_right - key_left;
    hsp = mx * global.PLAYER_SPEED;

    if (on_ground) {
        state = (mx == 0) ? "idle" : "walk";
        state_timer = 0;
        return;
    }
	if (key_kick) {
    state = "kick";
    state_timer = 0;
    return;
	}
}
	
function state_kick() {
	
	if(kicked_kb)
		hsp = global.KICK_FORCE * facing_dir;
		vsp = -global.KICK_FORCE * 0.5

	//Frame Managing
    if (state_timer > 15) {
        state = on_ground ? "idle" : "jump";
        state_timer = 0;
        return;
    }
}