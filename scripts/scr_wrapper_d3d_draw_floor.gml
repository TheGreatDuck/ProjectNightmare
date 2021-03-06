var getSprite;
switch (argument[6])
{
    case (0): getSprite = cSprNESPipe; break
    case (1): getSprite = cSprNESLink; break
}
d3d_draw_floor(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],ds_list_find_value(global.spr[| getSprite], 2),argument[7],argument[8]);
