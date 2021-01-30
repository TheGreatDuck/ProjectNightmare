///particle_create(x, y, z, type)
while (ds_list_size(global.particles) >= 384000) repeat (12) ds_list_delete(global.particles, 0);
var setHSpeed = 0, setVSpeed = 0, setZSpeed = 0, setScale, setSprite, setFrameSpd;
switch (argument3)
{
    case (cParTypeSkid):
        setHSpeed = random_range(-0.1, 0.1);
        setVSpeed = random_range(-0.1, 0.1);
        setZSpeed = random(0.1);
        setScale = 0.5;
        setSprite = cSprSmoke;
        setFrameSpd = 0.25;
    break
    case (cParTypeZap):
        setScale = 0.7;
        setSprite = cSprZap;
        setFrameSpd = 0.25;
    break
}
ds_list_add(global.particles, argument3, argument0, argument1, argument2, setHSpeed, setVSpeed, setZSpeed, 0, setScale, setSprite, 0, setFrameSpd);
