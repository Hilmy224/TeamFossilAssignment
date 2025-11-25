function player_animations() {

    switch (state) {
        case "idle":
            sprite_index = Player_idle;
            image_speed = 1;
            break;

        case "walk":
            sprite_index = Player_walk;
            image_speed = 1;
            break;

        case "jump":
            sprite_index = Player_jump;
            image_speed = 1;
            break;

        case "kick":
            sprite_index = Player_Kick_rev;
            image_speed = 0.2;
            break;
    }

	//Should flip on this
    if (hsp != 0)
        image_xscale = sign(hsp);
    else
        image_xscale = facing_dir;
}