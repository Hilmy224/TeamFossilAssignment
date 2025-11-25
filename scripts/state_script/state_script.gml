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

    var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
    hsp = mx * global.PLAYER_SPEED;

    if (mx != 0) {
        state = "walk";
        state_timer = 0;
        return;
    }

    if (keyboard_check_pressed(vk_space) && on_ground) {
        vsp = global.PLAYER_JUMP;
        state = "jump";
        state_timer = 0;
        return;
    }

    if (keyboard_check_pressed(ord("F"))) {
        state = "kick";
        state_timer = 0;
        return;
    }
}

function state_walk() {

    var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
    hsp = mx * global.PLAYER_SPEED;


    if (mx == 0) {
        state = "idle";
        state_timer = 0;
        return;
    }


    if (keyboard_check_pressed(vk_space) && on_ground) {
        vsp = global.PLAYER_JUMP;
        state = "jump";
        state_timer = 0;
        return;
    }


    if (keyboard_check_pressed(ord("F"))) {
        state = "kick";
        state_timer = 0;
        return;
    }
}
	
function state_jump() {


    var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
    hsp = mx * global.PLAYER_SPEED;


    if (on_ground && vsp == 0) {
        state = "idle";
        state_timer = 0;
        return;
    }
}
	
function state_kick() {

    hsp = global.KICK_FORCE * (keyboard_check(vk_right) - keyboard_check(vk_left));


    if (state_timer > 10) {
        state = on_ground ? "idle" : "jump";
        state_timer = 0;
        return;
    }
}