/// tile_solid_at(tilemap_id, x, y)
function tile_solid_at(_tilemap, _x, _y) {
    var tile = tilemap_get_at_pixel(_tilemap, _x, _y);
    return tile != 0;
}





vsp += global.GRAVITY;

player_states();


// ----- HORIZONTAL COLLISION -----
if (tile_solid_at(Main_Tile, x + hsp, y)) {
    while (!tile_solid_at(Main_Tile, x + sign(hsp), y)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;


// ----- VERTICAL COLLISION -----
if (tile_solid_at(Main_Tile, x, y + vsp)) {
    while (!tile_solid_at(Main_Tile, x, y + sign(vsp))) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;


// grounded?
on_ground = tile_solid_at(Main_Tile, x, y + 1);

