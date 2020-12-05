//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite != -1)
{
    var nums = 0, getSprite = sprite_get(sprite);
    switch (sprite_type(sprite))
    {
        case (0): nums = image_get_number(getSprite) - 1; break
        case (1): nums = image_get_number(getSprite) * 0.25; break
        case (2): nums = ds_list_size(getSprite[| 2 + anim]); break
    }
    if (nums) frame = (frame + frameSpd) mod (nums);
}
