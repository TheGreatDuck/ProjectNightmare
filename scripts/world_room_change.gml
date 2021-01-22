///world_room_change(roomID, start)
var value, actors, i = 0;
if (argument1) with (instance_create(0, 0, objCamera))
{
    //Set global camera variables
    global.cX = x;
    global.cY = y;
    global.cZ = z;
    global.cD = faceDir;
    global.cP = facePitch;
}
else
{
    with (objActor) switch (object_index)
    {
        case (objBomb):
        case (objZapper): if (target == noone) instance_destroy(); break
        case (objCamera):
        case (objMario): break
        default: instance_destroy();
    }
    value = ds_map_find_value(global.worldData[0], global.levelRoom);
    c_world_remove_object(value[| 4]);
}
global.levelRoom = argument0;
value = ds_map_find_value(global.worldData[0], argument0);
actors = value[| 0];
c_world_add_object(value[| 4]);
if !(is_undefined(actors)) repeat (ds_list_size(actors) * 0.2)
{
    var actor = noone, skip = false;
    switch (actors[| i + 4])
    {
        case (0): actor = objMario; break
        case (1): actor = objBomb; break
    }
    if (actor != noone)
    {
        if (actor == objMario) //Don't create another player actor if there already is one
        {
            if (instance_exists(objPlayer))
            {
                i += 5;
                continue
            }
        }
        else with (objActor) if (uID == i) //Don't create another actor with the same uID
        {
            i += 5;
            continue
        }
        with (instance_create(actors[| i], actors[| i + 1], actor))
        {
            uID = i;
            z = actors[| i + 2] + half;
            if (actor == objMario)
            {
                (instance_create(x, y, objZapper)).z = z;
                (instance_create(x, y, objDummy)).z = z;
            }
            faceDir = actors[| i + 3];
        }
    }
    i += 5;
}
