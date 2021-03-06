//Loop the animation every time the end is reached.
//As a failsafe, check if the actor has a sprite. If not, abort.
if (sprite != -1)
{
    var nums = 0, getSprite = sprite_get(sprite), getType = sprite_type(sprite);
    switch (getType)
    {
        case (0): //Static sprite
        case (2): //Billboard sprite
            nums = image_get_number(getSprite) - 1; break
        case (1): //4-directional sprite
            nums = image_get_number(getSprite) * 0.25; break
        case (4): //Animated model
            nums = ds_list_size(getSprite[| 2 + anim]) - 2; break
    }
    if (nums) frame = (frame + frameSpd) mod (nums);
    if (getType == 4) if (is_undefined(customFrame))
    {
        if (prevFrame != frame)
        {
            var animation = getSprite[| 2 + anim];
            frameSample = smf_sample_blend(animation[| 2 + frame], animation[| 2 + (frame + 1) mod (ds_list_size(animation) - 2)], frac(frame));
            prevFrame = frame;
        }
    }
    else frameSample = smf_sample_create_from_frame(customFrame);
}
