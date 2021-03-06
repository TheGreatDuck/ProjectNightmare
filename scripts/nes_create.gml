///nes_create(w, h)
//Creates an NES Wall and returns its ID (pointer).
//Width and height are measured in tiles, where one tile is 16x16 pixels (1 PN tile).
return scr_call_DLL_function(global.createWall, 2, argument[0], argument[1]);
