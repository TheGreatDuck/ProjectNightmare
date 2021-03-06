/// @description smf_line_sphere_intersection(sx, sy, sz, r, px, py, pz, vx, vy, vz)
/// @param sphereX
/// @param sphereY
/// @param sphereZ
/// @param sphereRadius
/// @param xFrom
/// @param yFrom
/// @param zFrom
/// @param xTo
/// @param yTo
/// @param zTo
//Finds the intersection between a line [px,py,pz] + t * [vx,vy,vz], where [vx,vy,vz] is a unit vector, and a sphere centered at (sx,sy,sz) with radius r
/*
Script made by TheSnidr

www.thesnidr.com
*/
var a, b, c, d, dp, xx, yy, zz;
xx = argument0 - argument4;
yy = argument1 - argument5;
zz = argument2 - argument6;
a = argument7;
b = argument8;
c = argument9;
dp = xx * a + yy * b + zz * c;
d = sqr(dp) + sqr(argument3) - sqr(xx) - sqr(yy) - sqr(zz);
if d < 0 {return false;}
d = sqrt(d);
if dp < d {dp += d; if dp < 0{return false;}}
else {dp -= d;}
returnX = argument4 + a * dp;
returnY = argument5 + b * dp;
returnZ = argument6 + c * dp;
return true;


