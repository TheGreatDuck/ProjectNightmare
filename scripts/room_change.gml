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
            ds_list_delete(roomModel[| 0], 0);
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
        var addData = ds_list_create(), addActors = ds_list_create(), addTextures = ds_list_create(), addModels = ds_list_create(), addCShape = c_shape_create(), addCObj, roomData = ds_map_find_value(tempData, key), roomModel = roomData[| 0], roomActors = roomData[| 1];
        //Load actor data
        repeat (ds_list_size(roomActors))
        {
            ds_list_add(addActors, roomActors[| 0]);
            ds_list_delete(roomActors, 0);
        }
        ds_list_destroy(roomActors);
        //Load room textures
        ds_list_add(addTextures, roomModel[| 9]); //Add the first triangle's texture to the world textures list
        for (i = 20; i < ds_list_size(roomModel); i += 11) //First loop through the list to get every texture that gets used by the room
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
            vertex_begin(buffer, global.worldData[1]);
            for (j = 0; j < ds_list_size(roomModel); j += 11) //Iterate through every triangle to be added and skip those that don't have the corresponding texture ID
            {
                var texID = roomModel[| j + 9];
                if (texID != addTextures[| i]) continue
                var pos, texPointer = ds_list_find_value(global.tex[| texID], 0), vec, d, getNormal;
                //X,Y,Z
                for (var k = 0; k < 9; k++) pos[k] = roomModel[| j + k];
                //NX,NY,NZ
                getNormal = triangle_normal(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
                pos[9, 0] = getNormal[0]; //Normals are flat by default, unless specified otherwise by triangle data
                pos[10, 0] = getNormal[1];
                pos[11, 0] = getNormal[2];
                pos[9, 1] = getNormal[0];
                pos[10, 1] = getNormal[1];
                pos[11, 1] = getNormal[2];
                pos[9, 2] = getNormal[0];
                pos[10, 2] = getNormal[1];
                pos[11, 2] = getNormal[2];
                if (roomModel[| j + 10]) //Smooth shading
                {
                    var combineNormals = ds_list_create(), normals;
                    for (k = 0; k < 3; k++) normals[k] = 1;
                    for (k = 0; k < ds_list_size(roomModel); k += 11)
                    {
                        if (j == k) continue
                        for (var l = 0; l < 9; l += 3) for (var m = 0; m < 9; m += 3) if (pos[l] == roomModel[| k + m] && pos[l + 1] == roomModel[| k + m + 1] && pos[l + 2] == roomModel[| k + m + 2]) ds_list_add(combineNormals, l / 3, k);
                    }
                    for (k = 0; k < ds_list_size(combineNormals); k += 2)
                    {
                        var slot = combineNormals[| k], otherTri = combineNormals[| k + 1], otherNormal = triangle_normal(roomModel[| otherTri], roomModel[| otherTri + 1], roomModel[| otherTri + 2], roomModel[| otherTri + 3], roomModel[| otherTri + 4], roomModel[| otherTri + 5], roomModel[| otherTri + 6], roomModel[| otherTri + 7], roomModel[| otherTri + 8]);
                        pos[9, slot] += otherNormal[0];
                        pos[10, slot] += otherNormal[1];
                        pos[11, slot] += otherNormal[2];
                        normals[slot]++;
                    }
                    for (k = 0; k < 3; k++) for (l = 0; l < 3; l++) pos[9 + k, l] /= normals[k];
                    ds_list_destroy(combineNormals);
                }
                //U,V,W,H
                if (getNormal[2] >= -0.1 && getNormal[2] <= 0.1)
                {
                    pos[12] = abs(getNormal[0]);
                    pos[13] = abs(getNormal[1]);
                    pos[14] = abs(getNormal[2]);
                }
                else
                {
                    pos[12] = 0;
                    pos[13] = 0;
                    pos[14] = 1;
                }
                pos[15] = image_get_width(texPointer) * 0.5;
                pos[16] = image_get_height(texPointer) * 0.5;
                vertex_position_3d(buffer, pos[0], pos[1], pos[2]);
                vertex_normal(buffer, pos[9, 0], pos[10, 0], pos[11, 0]);
                vertex_texcoord(buffer, lerp(pos[0], lerp(pos[1], pos[0], pos[13]), pos[12]) / pos[15], lerp(-pos[2], pos[1], pos[14]) / pos[16]);
                vertex_colour(buffer, c_white, 1);
                vertex_position_3d(buffer, pos[3], pos[4], pos[5]);
                vertex_normal(buffer, pos[9, 1], pos[10, 1], pos[11, 1]);
                vertex_texcoord(buffer, lerp(pos[3], lerp(pos[4], pos[3], pos[13]), pos[12]) / pos[15], lerp(-pos[5], pos[4], pos[14]) / pos[16]);
                vertex_colour(buffer, c_white, 1);
                vertex_position_3d(buffer, pos[6], pos[7], pos[8]);
                vertex_normal(buffer, pos[9, 2], pos[10, 2], pos[11, 2]);
                vertex_texcoord(buffer, lerp(pos[6], lerp(pos[7], pos[6], pos[13]), pos[12]) / pos[15], lerp(-pos[8], pos[7], pos[14]) / pos[16]);
                vertex_colour(buffer, c_white, 1);
                c_shape_add_triangle(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
                global.minZ = min(global.minZ, pos[2], pos[5], pos[8]);
            }
            vertex_end(buffer);
        }
        c_shape_end_trimesh(addCShape);
        addCObj = c_object_create(addCShape, 1, 1);
        ds_list_add(addData, addActors, addTextures, addModels);
        ds_list_mark_as_list(addData, 0);
        ds_list_mark_as_list(addData, 1);
        ds_list_mark_as_list(addData, 2);
        ds_list_add(addData, addCShape, addCObj);
        ds_list_destroy(roomData);
        show_debug_message(key + ": " + string(addActors) + ", " + string(addTextures) + ", " + string(addModels) + ", " + string(addCShape) + ", " + string(addCObj));
        var str = "Textures: ";
        for (i = 0; i < ds_list_size(addTextures); i++) str += string(addTextures[| i]) + ", ";
        show_debug_message(str);
        ds_map_add_list(global.worldData[0], real(key), addData);
    }
    //All levels must start in the room ID 0. If this room doesn't exist, this will throw an error
    world_room_change(0, true);
    /*var dataSize = ds_list_size(tempData);
    //Start loading world model
    ds_list_add(global.worldModel[1], tempData[| 9]); //Add the first triangle's texture to the world textures list
    for (i = 20; i < dataSize; i += 11) //First loop through the list to get every texture that gets used in the level
    {
        var unique = true, j;
        //Iterate through every texture ID in the world textures list to see if the current triangle's texture is already included
        for (j = 0; j < ds_list_size(global.worldModel[1]); j++)
            if (tempData[| i] == ds_list_find_value(global.worldModel[1], j)) //If the texture ID is already included, skip to the next triangle
            {
                unique = false;
                break
            }
        if (unique) ds_list_add(global.worldModel[0], tempData[| i]); //Add the unique texture ID to the world textures list
    }
    var textures = ds_list_size(global.worldModel[0]);
    repeat (textures) ds_list_add(global.worldModel[0], vertex_create_buffer()); //Create models as world model segments for each texture
    //Preparations to add triangles to world collision mesh while world model segments assemble
    worldShape = c_shape_create();
    c_shape_begin_trimesh();
    for (i = 0; i < textures; i++) //Loop through the texture IDs list to add every triangle with the corresponding texture ID to each world model segment
    {
        var buffer = ds_list_find_value(global.worldModel[0], i);
        vertex_begin(buffer, global.worldModel[1]);
        for (j = 0; j < dataSize; j += 11) //Iterate through every triangle to be added and skip those that don't have the corresponding texture ID
        {
            var texID = tempData[| j + 9];
            if (texID != ds_list_find_value(global.worldModel[1], i)) continue
            var pos, texPointer = ds_list_find_value(global.tex[| texID], 0), vec, d, getNormal;
            //X,Y,Z
            for (var k = 0; k < 9; k++) pos[k] = tempData[| j + k];
            //NX,NY,NZ
            getNormal = triangle_normal(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
            pos[9, 0] = getNormal[0]; //Normals are flat by default, unless specified otherwise by triangle data
            pos[10, 0] = getNormal[1];
            pos[11, 0] = getNormal[2];
            pos[9, 1] = getNormal[0];
            pos[10, 1] = getNormal[1];
            pos[11, 1] = getNormal[2];
            pos[9, 2] = getNormal[0];
            pos[10, 2] = getNormal[1];
            pos[11, 2] = getNormal[2];
            if (tempData[| j + 10]) //Smooth shading
            {
                var combineNormals = ds_list_create(), normals;
                for (k = 0; k < 3; k++) normals[k] = 1;
                for (k = 0; k < dataSize; k += 11)
                {
                    if (j == k) continue
                    for (var l = 0; l < 9; l += 3) for (var m = 0; m < 9; m += 3) if (pos[l] == tempData[| k + m] && pos[l + 1] == tempData[| k + m + 1] && pos[l + 2] == tempData[| k + m + 2]) ds_list_add(combineNormals, l / 3, k);
                }
                for (k = 0; k < ds_list_size(combineNormals); k += 2)
                {
                    var slot = combineNormals[| k], otherTri = combineNormals[| k + 1], otherNormal = triangle_normal(tempData[| otherTri], tempData[| otherTri + 1], tempData[| otherTri + 2], tempData[| otherTri + 3], tempData[| otherTri + 4], tempData[| otherTri + 5], tempData[| otherTri + 6], tempData[| otherTri + 7], tempData[| otherTri + 8]);
                    pos[9, slot] += otherNormal[0];
                    pos[10, slot] += otherNormal[1];
                    pos[11, slot] += otherNormal[2];
                    normals[slot]++;
                }
                for (k = 0; k < 3; k++) for (l = 0; l < 3; l++) pos[9 + k, l] /= normals[k];
                ds_list_destroy(combineNormals);
            }
            //U,V,W,H
            if (getNormal[2] >= -0.1 && getNormal[2] <= 0.1)
            {
                pos[12] = abs(getNormal[0]);
                pos[13] = abs(getNormal[1]);
                pos[14] = abs(getNormal[2]);
            }
            else
            {
                pos[12] = 0;
                pos[13] = 0;
                pos[14] = 1;
            }
            pos[15] = image_get_width(texPointer) * 0.5;
            pos[16] = image_get_height(texPointer) * 0.5;
            vertex_position_3d(buffer, pos[0], pos[1], pos[2]);
            vertex_normal(buffer, pos[9, 0], pos[10, 0], pos[11, 0]);
            //vertex_texcoord(buffer, lerp(pos[0], lerp(pos[1], sqrt(sqr(pos[0]) + sqr(pos[1])), pos[13]), pos[12]) / pos[15], lerp(-pos[2], pos[1], pos[14]) / pos[16]);
            vertex_texcoord(buffer, lerp(pos[0], lerp(pos[1], pos[0], pos[13]), pos[12]) / pos[15], lerp(-pos[2], pos[1], pos[14]) / pos[16]);
            vertex_colour(buffer, c_white, 1);
            vertex_position_3d(buffer, pos[3], pos[4], pos[5]);
            vertex_normal(buffer, pos[9, 1], pos[10, 1], pos[11, 1]);
            vertex_texcoord(buffer, lerp(pos[3], lerp(pos[4], pos[3], pos[13]), pos[12]) / pos[15], lerp(-pos[5], pos[4], pos[14]) / pos[16]);
            vertex_colour(buffer, c_white, 1);
            vertex_position_3d(buffer, pos[6], pos[7], pos[8]);
            vertex_normal(buffer, pos[9, 2], pos[10, 2], pos[11, 2]);
            vertex_texcoord(buffer, lerp(pos[6], lerp(pos[7], pos[6], pos[13]), pos[12]) / pos[15], lerp(-pos[8], pos[7], pos[14]) / pos[16]);
            vertex_colour(buffer, c_white, 1);
            c_shape_add_triangle(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6], pos[7], pos[8]);
            global.minZ = min(global.minZ, pos[2], pos[5], pos[8]);
        }
        vertex_end(buffer);
    }
    c_shape_end_trimesh(worldShape);
    worldObject = c_object_create(worldShape, 1, 1);
    global.world = c_world_create();
    c_world_add_object(worldObject);
    //Read actors
    ds_list_read(tempData, level_read_string(file));
    i = 0;
    repeat (ds_list_size(tempData) * 0.2)
    {
        var actor = noone;
        switch (tempData[| i + 4])
        {
            case (0): actor = objMario; break
            case (1): actor = objBomb; break
        }
        if (actor != noone) with (instance_create(tempData[| i], tempData[| i + 1], actor))
        {
            z = tempData[| i + 2] + half;
            if (actor == objMario) (instance_create(x, y, objZapper)).z = z;
            faceDir = tempData[| i + 3];
        }
        i += 5;
    }
    with (instance_create(0, 0, objCamera))
    {
        //Set global camera variables
        global.cX = x;
        global.cY = y;
        global.cZ = z;
        global.cD = faceDir;
        global.cP = facePitch;
    }*/
    ds_map_destroy(tempData);
    file_text_close(file);
    //Reset in-game states
    music_start();
    global.battle = false;
    framerate_set();
    discord_update_presence("0 backups collected", global.roomName, "largeicon" + string(global.roomIcon), "smallicon");
    window_set_cursor(cr_default);
    if !(instance_exists(objCutscene)) window_mouse_set(window_get_x() + window_get_width() * 0.5, window_get_y() + window_get_height() * 0.5);
}
