/// @description smf_collision_get_triangle(collisionBuffer, triangleIndex)
/// @param collisionBuffer
/// @param triangleIndex
/*
Returns a triangle as an array with three vertices and one normal

Script made by TheSnidr
www.TheSnidr.com
*/
var i = 0, vert;
buffer_seek(argument0, buffer_seek_start, SMF_colBuffHeader + argument1 * SMF_colTriBytes)
repeat 9{vert[i++] = buffer_read(argument0, buffer_u16);}
repeat 3{vert[i++] = buffer_read(argument0, buffer_s16) / 32767;}
return vert;


