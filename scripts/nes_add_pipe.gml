///nes_add_pipe(id, pipeID, x, y)
//Adds a pipe to the NES wall with the tag used for warping out through a 3D pipe with the corresponding tag.

var dir;
dir = 0; //need to add this as an argument in the future. My bad. - Typhon

return scr_call_DLL_function(global.addPipe, 5, argument[0], argument[1], 1, argument[2], argument[3]);