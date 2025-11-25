vsp += global.GRAVITY;

player_states();


var collision_source = Collission_Object; 

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

// grounded?
// Cek apakah ada Objek Dinding 1 piksel di bawah pemain
on_ground = place_meeting(x, y + 1, collision_source);