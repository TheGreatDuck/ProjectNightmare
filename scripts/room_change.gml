///room_change(roomID)
//Clears everything and switches to another room. This is a workaround for GM:S 1.4's room memory leaks.
global.currentRoom = argument0;
//---ROOM END---
with (all)
{
    if (object_index == objControl) continue
    instance_destroy();
}
with (objControl)
{
    c_world_destroy();
    //Destroy world data
    for (var key = ds_map_find_first(global.worldData[0]), value, roomModel; !is_undefined(key); key = ds_map_find_next(global.worldData[0], key))
    {
        value = ds_map_find_value(global.worldData[0], key);
        roomModel = value[| 2];
        repeat (ds_list_size(roomModel))
        {
            vertex_delete_buffer(roomModel[| 0]);
            ds_list_delete(roomModel, 0);
        }
        c_object_destroy(value[| 4]);
        c_shape_destroy(value[| 3]);
    }
    ds_map_clear(global.worldData[0]);
    if (background_exists(pauseBg))
    {
        global.paused = false;
        background_delete(pauseBg);
    }
    audio_stop_all();
    music_stop();
    global.dawn = false;
    global.skybox = 0;
    //---ROOM START---
    var i = 0, file = file_text_open_read(cDirMap + string(global.currentRoom) + ".pnl"), tempData; //Open level file that corresponds to the current room ID
    //Read level information
    for (i = 0; i < 2; i++) global.levelMusic[i] = level_read_real(file);
    global.skybox = level_read_real(file);
    global.roomName = level_read_string(file);
    global.roomIcon = level_read_real(file);
    background_color[0] = level_read_real(file);
    for (i = 0; i < 2; i++) global.fog[i] = level_read_real(file);
    var fogColor = level_read_real(file);
    global.fog[2] = color_get_red(fogColor) / 255;
    global.fog[3] = color_get_green(fogColor) / 255;
    global.fog[4] = color_get_blue(fogColor) / 255;
    for (i = 0; i < 3; i++) global.light[i] = level_read_real(file);
    var lightColor = level_read_real(file), lightAmbient = level_read_real(file);
    global.light[3] = color_get_red(lightColor) / 255;
    global.light[4] = color_get_green(lightColor) / 255;
    global.light[5] = color_get_blue(lightColor) / 255;
    global.light[6] = color_get_red(lightAmbient) / 255;
    global.light[7] = color_get_green(lightAmbient) / 255;
    global.light[8] = color_get_blue(lightAmbient) / 255;
    tempData = json_decode(level_read_string(file)); //Get world data map
    //Start loading world data
    c_world_create();
    for (var key = ds_map_find_first(tempData); !is_undefined(key); key = ds_map_find_next(tempData, key))
    {
        var addData = ds_list_create(), addActors = undefined, addTextures = ds_list_create(), addModels = ds_list_create(), addCShape = c_shape_create(), addCObj, roomData = tempData[? key], roomModel = roomData[| 0], roomActors = roomData[| 1];
        //Load actor data
        if !(ds_list_empty(roomActors))
        {
            addActors = ds_list_create();
            ds_list_copy(addActors, roomActors);
        }
        ds_list_destroy(roomActors);
        //Load room textures
        ds_list_add(addTextures, roomModel[| 27]); //Add the first triangle's texture to the world textures list
        for (i = 55; i < ds_list_size(roomModel); i += 28) //First loop through the list to get every texture that gets used by the room
        {
            var unique = true, j;
            //Iterate through every texture ID in the world textures list to see if the current triangle's texture is already included
            for (j = 0; j < ds_list_size(addTextures); j++) if (roomModel[| i] == addTextures[| j]) //If the texture ID is already included, skip to the next triangle
            {
                unique = false;
                break
            }
            if (unique) ds_list_add(addTextures, roomModel[| i]); //Add the unique texture ID to the world textures list
        }
        //Load room model
        var textures = ds_list_size(addTextures);
        repeat (textures) ds_list_add(addModels, vertex_create_buffer()); //Create models as world model segments for each texture
        //Preparations to add triangles to world collision mesh while world model segments assemble
        c_shape_begin_trimesh();
        for (i = 0; i < textures; i++) //Loop through the texture IDs list to add every triangle with the corresponding texture ID to each world model segment
        {
            var buffer = addModels[| i];
            vertex_begin(buffer, SMF_format);
            for (j = 0; j < ds_list_size(roomModel); j += 28) //Iterate through every triangle to be added and skip those that don't have the corresponding texture ID
            {
                if (roomModel[| j + 27] != addTextures[| i]) continue
                for (k = 0; k < 27; k += 9)
                {
                    var l = j + k;
                    smf_add_vertex(buffer, roomModel[| l], roomModel[| l + 1], roomModel[| l + 2], roomModel[| l + 3], roomModel[| l + 4], roomModel[| l + 5], roomModel[| l + 6], roomModel[| l + 7], c_white, 1, roomModel[| l + 8], 1);
                    global.minZ = min(global.minZ, roomModel[| j + 2]);
                }
                c_shape_add_triangle(roomModel[| j], roomModel[| j + 1], roomModel[| j + 2], roomModel[| j + 9], roomModel[| j + 10], roomModel[| j + 11], roomModel[| j + 18], roomModel[| j + 19], roomModel[| j + 20]);
            }
            vertex_end(buffer);
            vertex_freeze(buffer);
        }
        ds_list_destroy(roomModel);
        c_shape_end_trimesh(addCShape);
        addCObj = c_object_create(addCShape, 1, 1);
        ds_list_add(addData, addActors, addTextures, addModels, addCShape, addCObj);
        if !(is_undefined(addActors)) ds_list_mark_as_list(addData, 0);
        ds_list_mark_as_list(addData, 1);
        ds_list_mark_as_list(addData, 2);
        show_debug_message(key + ": " + string(addActors) + ", " + string(addTextures) + ", " + string(addModels) + ", " + string(addCShape) + ", " + string(addCObj));
        ds_map_add_list(global.worldData[0], real(key), addData);
        ds_list_destroy(roomData);
        tempData[? key] = undefined;
    }
    //All levels must start in the room ID 0. If this room doesn't exist, this will throw an error
    world_room_change(0, true);
    ds_map_destroy(tempData);
    file_text_close(file);
    //Reset in-game states
    music_start();
    global.battle = false;
    framerate_set();
    discord_update_presence("0 backups collected", global.roomName, "largeicon" + string(global.roomIcon), "smallicon");
    window_set_cursor(cr_default);
    if !(instance_exists(objCutscene)) window_mouse_set(window_get_x() + window_get_width() * 0.5, window_get_y() + window_get_height() * 0.5);
    for (var key = ds_map_find_first(global.worldData[0]), value; !is_undefined(key); key = ds_map_find_next(global.worldData[0], key))
    {
        value = ds_map_find_value(global.worldData[0], key);
        show_debug_message(string(key) + ": " + string(value[| 0]) + " (" + string(!is_undefined(value[| 0]) && ds_exists(value[| 0], ds_type_list)) + "), " + string(value[| 1]) + " (" + string(ds_exists(value[| 1], ds_type_list)) + "), " + string(value[| 2]) + " (" + string(ds_exists(value[| 2], ds_type_list)) + "), ");
    }
}
