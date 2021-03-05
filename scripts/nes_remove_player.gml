///nes_remove_player(pipeID)
//Called automatically by the NES wall after the player enters the exit pipe. This will bring the player out of the NES wall through the NES pipe with the corresponding tag.
with (objNESTrigger) if (tag == argument0) (instance_create(x, y, objMario)).z = z;
global.currentNESWall = noone;
