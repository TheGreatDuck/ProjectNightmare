#define scr_delayCallDLL_exportWrapperFunctions
global.delayCallDLL_export_d3d_model_create = external_define("CallDelayedFunctions.dll", "export_d3d_model_create", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_create, scr_wrapper_d3d_model_create);
global.delayCallDLL_export_d3d_model_destroy = external_define("CallDelayedFunctions.dll", "export_d3d_model_destroy", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_destroy, scr_wrapper_d3d_model_destroy);
global.delayCallDLL_export_d3d_model_load = external_define("CallDelayedFunctions.dll", "export_d3d_model_load", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_load, scr_wrapper_d3d_model_load);
global.delayCallDLL_export_d3d_model_draw = external_define("CallDelayedFunctions.dll", "export_d3d_model_draw", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_draw, scr_wrapper_d3d_model_draw);
global.delayCallDLL_export_d3d_model_primitive_begin = external_define("CallDelayedFunctions.dll", "export_d3d_model_primitive_begin", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_primitive_begin, scr_wrapper_d3d_model_primitive_begin);
global.delayCallDLL_export_d3d_model_vertex_texture = external_define("CallDelayedFunctions.dll", "export_d3d_model_vertex_texture", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_vertex_texture, scr_wrapper_d3d_model_vertex_texture);
global.delayCallDLL_export_d3d_model_primitive_end = external_define("CallDelayedFunctions.dll", "export_d3d_model_primitive_end", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_model_primitive_end, scr_wrapper_d3d_model_primitive_end);
global.delayCallDLL_export_d3d_primitive_begin = external_define("CallDelayedFunctions.dll", "export_d3d_primitive_begin", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_primitive_begin, scr_wrapper_d3d_primitive_begin);
global.delayCallDLL_export_d3d_vertex = external_define("CallDelayedFunctions.dll", "export_d3d_vertex", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex, scr_wrapper_d3d_vertex);
global.delayCallDLL_export_d3d_vertex_color = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_color, scr_wrapper_d3d_vertex_color);
global.delayCallDLL_export_d3d_primitive_end = external_define("CallDelayedFunctions.dll", "export_d3d_primitive_end", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_primitive_end, scr_wrapper_d3d_primitive_end);
global.delayCallDLL_export_d3d_primitive_begin_texture = external_define("CallDelayedFunctions.dll", "export_d3d_primitive_begin_texture", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_primitive_begin_texture, scr_wrapper_d3d_primitive_begin_texture);
global.delayCallDLL_export_d3d_vertex_texture = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_texture", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_texture, scr_wrapper_d3d_vertex_texture);
global.delayCallDLL_export_d3d_vertex_texture_color = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_texture_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_texture_color, scr_wrapper_d3d_vertex_texture_color);
global.delayCallDLL_export_d3d_vertex_normal_color = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_normal_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_normal_color, scr_wrapper_d3d_vertex_normal_color);
global.delayCallDLL_export_d3d_vertex_normal_texture = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_normal_texture", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_normal_texture, scr_wrapper_d3d_vertex_normal_texture);
global.delayCallDLL_export_d3d_vertex_normal_texture_color = external_define("CallDelayedFunctions.dll", "export_d3d_vertex_normal_texture_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_vertex_normal_texture_color, scr_wrapper_d3d_vertex_normal_texture_color);
global.delayCallDLL_export_d3d_draw_block = external_define("CallDelayedFunctions.dll", "export_d3d_draw_block", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_block, scr_wrapper_d3d_draw_block);
global.delayCallDLL_export_d3d_draw_cylinder = external_define("CallDelayedFunctions.dll", "export_d3d_draw_cylinder", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_cylinder, scr_wrapper_d3d_draw_cylinder);
global.delayCallDLL_export_d3d_draw_cone = external_define("CallDelayedFunctions.dll", "export_d3d_draw_cone", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_cone, scr_wrapper_d3d_draw_cone);
global.delayCallDLL_export_d3d_draw_ellipsoid = external_define("CallDelayedFunctions.dll", "export_d3d_draw_ellipsoid", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_ellipsoid, scr_wrapper_d3d_draw_ellipsoid);
global.delayCallDLL_export_d3d_draw_wall = external_define("CallDelayedFunctions.dll", "export_d3d_draw_wall", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_wall, scr_wrapper_d3d_draw_wall);
global.delayCallDLL_export_d3d_draw_floor = external_define("CallDelayedFunctions.dll", "export_d3d_draw_floor", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_draw_floor, scr_wrapper_d3d_draw_floor);
global.delayCallDLL_export_d3d_set_projection_ortho = external_define("CallDelayedFunctions.dll", "export_d3d_set_projection_ortho", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_set_projection_ortho, scr_wrapper_d3d_set_projection_ortho);
global.delayCallDLL_export_d3d_set_projection_perspective = external_define("CallDelayedFunctions.dll", "export_d3d_set_projection_perspective", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_set_projection_perspective, scr_wrapper_d3d_set_projection_perspective);
global.delayCallDLL_export_d3d_set_projection = external_define("CallDelayedFunctions.dll", "export_d3d_set_projection", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_set_projection, scr_wrapper_d3d_set_projection);
global.delayCallDLL_export_d3d_start = external_define("CallDelayedFunctions.dll", "export_d3d_start", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_start, scr_wrapper_d3d_start);
global.delayCallDLL_export_d3d_set_fog = external_define("CallDelayedFunctions.dll", "export_d3d_set_fog", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_set_fog, scr_wrapper_d3d_set_fog);
global.delayCallDLL_export_d3d_set_lighting = external_define("CallDelayedFunctions.dll", "export_d3d_set_lighting", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_set_lighting, scr_wrapper_d3d_set_lighting);
global.delayCallDLL_export_d3d_transform_set_identity = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_identity", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_identity, scr_wrapper_d3d_transform_set_identity);
global.delayCallDLL_export_d3d_transform_set_translation = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_translation", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_translation, scr_wrapper_d3d_transform_set_translation);
global.delayCallDLL_export_d3d_transform_set_scaling = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_scaling", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_scaling, scr_wrapper_d3d_transform_set_scaling);
global.delayCallDLL_export_d3d_transform_set_rotation_x = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_rotation_x", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_rotation_x, scr_wrapper_d3d_transform_set_rotation_x);
global.delayCallDLL_export_d3d_transform_set_rotation_y = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_rotation_y", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_rotation_y, scr_wrapper_d3d_transform_set_rotation_y);
global.delayCallDLL_export_d3d_transform_set_rotation_z = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_rotation_z", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_rotation_z, scr_wrapper_d3d_transform_set_rotation_z);
global.delayCallDLL_export_d3d_transform_set_rotation_axis = external_define("CallDelayedFunctions.dll", "export_d3d_transform_set_rotation_axis", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_set_rotation_axis, scr_wrapper_d3d_transform_set_rotation_axis);
global.delayCallDLL_export_d3d_transform_add_translation = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_translation", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_translation, scr_wrapper_d3d_transform_add_translation);
global.delayCallDLL_export_d3d_transform_add_scaling = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_scaling", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_scaling, scr_wrapper_d3d_transform_add_scaling);
global.delayCallDLL_export_d3d_transform_add_rotation_x = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_rotation_x", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_rotation_x, scr_wrapper_d3d_transform_add_rotation_x);
global.delayCallDLL_export_d3d_transform_add_rotation_y = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_rotation_y", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_rotation_y, scr_wrapper_d3d_transform_add_rotation_y);
global.delayCallDLL_export_d3d_transform_add_rotation_z = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_rotation_z", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_rotation_z, scr_wrapper_d3d_transform_add_rotation_z);
global.delayCallDLL_export_d3d_transform_add_rotation_axis = external_define("CallDelayedFunctions.dll", "export_d3d_transform_add_rotation_axis", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_d3d_transform_add_rotation_axis, scr_wrapper_d3d_transform_add_rotation_axis);
global.delayCallDLL_export_draw_set_font = external_define("CallDelayedFunctions.dll", "export_draw_set_font", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_font, scr_wrapper_draw_set_font);
global.delayCallDLL_export_draw_set_halign = external_define("CallDelayedFunctions.dll", "export_draw_set_halign", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_halign, scr_wrapper_draw_set_halign);
global.delayCallDLL_export_draw_set_valign = external_define("CallDelayedFunctions.dll", "export_draw_set_valign", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_valign, scr_wrapper_draw_set_valign);
global.delayCallDLL_export_draw_text = external_define("CallDelayedFunctions.dll", "export_draw_text", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text, scr_wrapper_draw_text);
global.delayCallDLL_export_draw_text_ext = external_define("CallDelayedFunctions.dll", "export_draw_text_ext", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_ext, scr_wrapper_draw_text_ext);
global.delayCallDLL_export_string_width = external_define("CallDelayedFunctions.dll", "export_string_width", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_string_width, scr_wrapper_string_width);
global.delayCallDLL_export_string_height = external_define("CallDelayedFunctions.dll", "export_string_height", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_string_height, scr_wrapper_string_height);
global.delayCallDLL_export_string_width_ext = external_define("CallDelayedFunctions.dll", "export_string_width_ext", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_string_width_ext, scr_wrapper_string_width_ext);
global.delayCallDLL_export_string_height_ext = external_define("CallDelayedFunctions.dll", "export_string_height_ext", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_string_height_ext, scr_wrapper_string_height_ext);
global.delayCallDLL_export_draw_text_transformed = external_define("CallDelayedFunctions.dll", "export_draw_text_transformed", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_transformed, scr_wrapper_draw_text_transformed);
global.delayCallDLL_export_draw_text_ext_transformed = external_define("CallDelayedFunctions.dll", "export_draw_text_ext_transformed", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_ext_transformed, scr_wrapper_draw_text_ext_transformed);
global.delayCallDLL_export_draw_text_color = external_define("CallDelayedFunctions.dll", "export_draw_text_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_color, scr_wrapper_draw_text_color);
global.delayCallDLL_export_draw_text_ext_color = external_define("CallDelayedFunctions.dll", "export_draw_text_ext_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_ext_color, scr_wrapper_draw_text_ext_color);
global.delayCallDLL_export_draw_text_transformed_color = external_define("CallDelayedFunctions.dll", "export_draw_text_transformed_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_transformed_color, scr_wrapper_draw_text_transformed_color);
global.delayCallDLL_export_draw_text_ext_transformed_color = external_define("CallDelayedFunctions.dll", "export_draw_text_ext_transformed_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_text_ext_transformed_color, scr_wrapper_draw_text_ext_transformed_color);
global.delayCallDLL_export_sprite_get_texture = external_define("CallDelayedFunctions.dll", "export_sprite_get_texture", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_sprite_get_texture, scr_wrapper_sprite_get_texture);
global.delayCallDLL_export_sprite_add = external_define("CallDelayedFunctions.dll", "export_sprite_add", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_sprite_add, scr_wrapper_sprite_add);
global.delayCallDLL_export_draw_sprite = external_define("CallDelayedFunctions.dll", "export_draw_sprite", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_sprite, scr_wrapper_draw_sprite);
global.delayCallDLL_export_show_message = external_define("CallDelayedFunctions.dll", "export_show_message", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_show_message, scr_wrapper_show_message);
global.delayCallDLL_export_draw_clear = external_define("CallDelayedFunctions.dll", "export_draw_clear", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_clear, scr_wrapper_draw_clear);
global.delayCallDLL_export_draw_clear_alpha = external_define("CallDelayedFunctions.dll", "export_draw_clear_alpha", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_clear_alpha, scr_wrapper_draw_clear_alpha);
global.delayCallDLL_export_draw_point = external_define("CallDelayedFunctions.dll", "export_draw_point", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_point, scr_wrapper_draw_point);
global.delayCallDLL_export_draw_line = external_define("CallDelayedFunctions.dll", "export_draw_line", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_line, scr_wrapper_draw_line);
global.delayCallDLL_export_draw_line_width = external_define("CallDelayedFunctions.dll", "export_draw_line_width", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_line_width, scr_wrapper_draw_line_width);
global.delayCallDLL_export_draw_rectangle = external_define("CallDelayedFunctions.dll", "export_draw_rectangle", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_rectangle, scr_wrapper_draw_rectangle);
global.delayCallDLL_export_draw_roundrect = external_define("CallDelayedFunctions.dll", "export_draw_roundrect", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_roundrect, scr_wrapper_draw_roundrect);
global.delayCallDLL_export_draw_triangle = external_define("CallDelayedFunctions.dll", "export_draw_triangle", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_triangle, scr_wrapper_draw_triangle);
global.delayCallDLL_export_draw_circle = external_define("CallDelayedFunctions.dll", "export_draw_circle", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_circle, scr_wrapper_draw_circle);
global.delayCallDLL_export_draw_ellipse = external_define("CallDelayedFunctions.dll", "export_draw_ellipse", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_ellipse, scr_wrapper_draw_ellipse);
global.delayCallDLL_export_draw_set_circle_precision = external_define("CallDelayedFunctions.dll", "export_draw_set_circle_precision", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_circle_precision, scr_wrapper_draw_set_circle_precision);
global.delayCallDLL_export_draw_arrow = external_define("CallDelayedFunctions.dll", "export_draw_arrow", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_arrow, scr_wrapper_draw_arrow);
global.delayCallDLL_export_draw_button = external_define("CallDelayedFunctions.dll", "export_draw_button", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_button, scr_wrapper_draw_button);
global.delayCallDLL_export_draw_path = external_define("CallDelayedFunctions.dll", "export_draw_path", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_path, scr_wrapper_draw_path);
global.delayCallDLL_export_draw_healthbar = external_define("CallDelayedFunctions.dll", "export_draw_healthbar", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_healthbar, scr_wrapper_draw_healthbar);
global.delayCallDLL_export_draw_set_color = external_define("CallDelayedFunctions.dll", "export_draw_set_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_color, scr_wrapper_draw_set_color);
global.delayCallDLL_export_draw_set_alpha = external_define("CallDelayedFunctions.dll", "export_draw_set_alpha", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_set_alpha, scr_wrapper_draw_set_alpha);
global.delayCallDLL_export_draw_get_color = external_define("CallDelayedFunctions.dll", "export_draw_get_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_get_color, scr_wrapper_draw_get_color);
global.delayCallDLL_export_draw_get_alpha = external_define("CallDelayedFunctions.dll", "export_draw_get_alpha", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_get_alpha, scr_wrapper_draw_get_alpha);
global.delayCallDLL_export_make_color_rgb = external_define("CallDelayedFunctions.dll", "export_make_color_rgb", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_make_color_rgb, scr_wrapper_make_color_rgb);
global.delayCallDLL_export_make_color_hsv = external_define("CallDelayedFunctions.dll", "export_make_color_hsv", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_make_color_hsv, scr_wrapper_make_color_hsv);
global.delayCallDLL_export_color_get_red = external_define("CallDelayedFunctions.dll", "export_color_get_red", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_red, scr_wrapper_color_get_red);
global.delayCallDLL_export_color_get_green = external_define("CallDelayedFunctions.dll", "export_color_get_green", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_green, scr_wrapper_color_get_green);
global.delayCallDLL_export_color_get_blue = external_define("CallDelayedFunctions.dll", "export_color_get_blue", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_blue, scr_wrapper_color_get_blue);
global.delayCallDLL_export_color_get_hue = external_define("CallDelayedFunctions.dll", "export_color_get_hue", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_hue, scr_wrapper_color_get_hue);
global.delayCallDLL_export_color_get_saturation = external_define("CallDelayedFunctions.dll", "export_color_get_saturation", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_saturation, scr_wrapper_color_get_saturation);
global.delayCallDLL_export_color_get_value = external_define("CallDelayedFunctions.dll", "export_color_get_value", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_color_get_value, scr_wrapper_color_get_value);
global.delayCallDLL_export_merge_color = external_define("CallDelayedFunctions.dll", "export_merge_color", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_merge_color, scr_wrapper_merge_color);
global.delayCallDLL_export_draw_getpixel = external_define("CallDelayedFunctions.dll", "export_draw_getpixel", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_draw_getpixel, scr_wrapper_draw_getpixel);
global.delayCallDLL_export_screen_save = external_define("CallDelayedFunctions.dll", "export_screen_save", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_screen_save, scr_wrapper_screen_save);
global.delayCallDLL_export_screen_save_part = external_define("CallDelayedFunctions.dll", "export_screen_save_part", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_screen_save_part, scr_wrapper_screen_save_part);
global.delayCallDLL_export_window_set_visible = external_define("CallDelayedFunctions.dll", "export_window_set_visible", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_visible, scr_wrapper_window_set_visible);
global.delayCallDLL_export_window_get_visible = external_define("CallDelayedFunctions.dll", "export_window_get_visible", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_visible, scr_wrapper_window_get_visible);
global.delayCallDLL_export_window_set_fullscreen = external_define("CallDelayedFunctions.dll", "export_window_set_fullscreen", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_fullscreen, scr_wrapper_window_set_fullscreen);
global.delayCallDLL_export_window_get_fullscreen = external_define("CallDelayedFunctions.dll", "export_window_get_fullscreen", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_fullscreen, scr_wrapper_window_get_fullscreen);
global.delayCallDLL_export_window_set_showborder = external_define("CallDelayedFunctions.dll", "export_window_set_showborder", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_showborder, scr_wrapper_window_set_showborder);
global.delayCallDLL_export_window_get_showborder = external_define("CallDelayedFunctions.dll", "export_window_get_showborder", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_showborder, scr_wrapper_window_get_showborder);
global.delayCallDLL_export_window_set_showicons = external_define("CallDelayedFunctions.dll", "export_window_set_showicons", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_showicons, scr_wrapper_window_set_showicons);
global.delayCallDLL_export_window_get_showicons = external_define("CallDelayedFunctions.dll", "export_window_get_showicons", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_showicons, scr_wrapper_window_get_showicons);
global.delayCallDLL_export_window_set_stayontop = external_define("CallDelayedFunctions.dll", "export_window_set_stayontop", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_stayontop, scr_wrapper_window_set_stayontop);
global.delayCallDLL_export_window_get_stayontop = external_define("CallDelayedFunctions.dll", "export_window_get_stayontop", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_stayontop, scr_wrapper_window_get_stayontop);
global.delayCallDLL_export_window_set_sizeable = external_define("CallDelayedFunctions.dll", "export_window_set_sizeable", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_set_sizeable, scr_wrapper_window_set_sizeable);
global.delayCallDLL_export_window_get_sizeable = external_define("CallDelayedFunctions.dll", "export_window_get_sizeable", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_sizeable, scr_wrapper_window_get_sizeable);
global.delayCallDLL_export_window_get_width = external_define("CallDelayedFunctions.dll", "export_window_get_width", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_width, scr_wrapper_window_get_width);
global.delayCallDLL_export_window_get_height = external_define("CallDelayedFunctions.dll", "export_window_get_height", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_window_get_height, scr_wrapper_window_get_height);
global.delayCallDLL_export_display_get_width = external_define("CallDelayedFunctions.dll", "export_display_get_width", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_get_width, scr_wrapper_display_get_width);
global.delayCallDLL_export_display_get_height = external_define("CallDelayedFunctions.dll", "export_display_get_height", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_get_height, scr_wrapper_display_get_height);
global.delayCallDLL_export_display_get_colordepth = external_define("CallDelayedFunctions.dll", "export_display_get_colordepth", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_get_colordepth, scr_wrapper_display_get_colordepth);
global.delayCallDLL_export_display_get_frequency = external_define("CallDelayedFunctions.dll", "export_display_get_frequency", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_get_frequency, scr_wrapper_display_get_frequency);
global.delayCallDLL_export_display_set_size = external_define("CallDelayedFunctions.dll", "export_display_set_size", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_set_size, scr_wrapper_display_set_size);
global.delayCallDLL_export_display_set_colordepth = external_define("CallDelayedFunctions.dll", "export_display_set_colordepth", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_set_colordepth, scr_wrapper_display_set_colordepth);
global.delayCallDLL_export_display_set_frequency = external_define("CallDelayedFunctions.dll", "export_display_set_frequency", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_set_frequency, scr_wrapper_display_set_frequency);
global.delayCallDLL_export_display_set_all = external_define("CallDelayedFunctions.dll", "export_display_set_all", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_set_all, scr_wrapper_display_set_all);
global.delayCallDLL_export_display_test_all = external_define("CallDelayedFunctions.dll", "export_display_test_all", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_test_all, scr_wrapper_display_test_all);
global.delayCallDLL_export_display_reset = external_define("CallDelayedFunctions.dll", "export_display_reset", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_reset, scr_wrapper_display_reset);
global.delayCallDLL_export_display_mouse_get_x = external_define("CallDelayedFunctions.dll", "export_display_mouse_get_x", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_mouse_get_x, scr_wrapper_display_mouse_get_x);
global.delayCallDLL_export_display_mouse_get_y = external_define("CallDelayedFunctions.dll", "export_display_mouse_get_y", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_mouse_get_y, scr_wrapper_display_mouse_get_y);
global.delayCallDLL_export_display_mouse_set = external_define("CallDelayedFunctions.dll", "export_display_mouse_set", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_display_mouse_set, scr_wrapper_display_mouse_set);
global.delayCallDLL_export_mouse_check_button = external_define("CallDelayedFunctions.dll", "export_mouse_check_button", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_mouse_check_button, scr_wrapper_mouse_check_button);
global.delayCallDLL_export_mouse_check_button_pressed = external_define("CallDelayedFunctions.dll", "export_mouse_check_button_pressed", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_mouse_check_button_pressed, scr_wrapper_mouse_check_button_pressed);
global.delayCallDLL_export_mouse_check_button_released = external_define("CallDelayedFunctions.dll", "export_mouse_check_button_released", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_mouse_check_button_released, scr_wrapper_mouse_check_button_released);
global.delayCallDLL_export_mouse_wheel_up = external_define("CallDelayedFunctions.dll", "export_mouse_wheel_up", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_mouse_wheel_up, scr_wrapper_mouse_wheel_up);
global.delayCallDLL_export_mouse_wheel_down = external_define("CallDelayedFunctions.dll", "export_mouse_wheel_down", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_mouse_wheel_down, scr_wrapper_mouse_wheel_down);
global.delayCallDLL_export_keyboard_check = external_define("CallDelayedFunctions.dll", "export_keyboard_check", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_keyboard_check, scr_wrapper_keyboard_check);
global.delayCallDLL_export_keyboard_check_pressed = external_define("CallDelayedFunctions.dll", "export_keyboard_check_pressed", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_keyboard_check_pressed, scr_wrapper_keyboard_check_pressed);
global.delayCallDLL_export_keyboard_check_released = external_define("CallDelayedFunctions.dll", "export_keyboard_check_released", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_keyboard_check_released, scr_wrapper_keyboard_check_released);
global.delayCallDLL_export_joystick_exists = external_define("CallDelayedFunctions.dll", "export_joystick_exists", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_exists, scr_wrapper_joystick_exists);
global.delayCallDLL_export_joystick_axes = external_define("CallDelayedFunctions.dll", "export_joystick_axes", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_axes, scr_wrapper_joystick_axes);
global.delayCallDLL_export_joystick_buttons = external_define("CallDelayedFunctions.dll", "export_joystick_buttons", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_buttons, scr_wrapper_joystick_buttons);
global.delayCallDLL_export_joystick_has_pov = external_define("CallDelayedFunctions.dll", "export_joystick_has_pov", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_has_pov, scr_wrapper_joystick_has_pov);
global.delayCallDLL_export_joystick_direction = external_define("CallDelayedFunctions.dll", "export_joystick_direction", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_direction, scr_wrapper_joystick_direction);
global.delayCallDLL_export_joystick_check_button = external_define("CallDelayedFunctions.dll", "export_joystick_check_button", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_check_button, scr_wrapper_joystick_check_button);
global.delayCallDLL_export_joystick_xpos = external_define("CallDelayedFunctions.dll", "export_joystick_xpos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_xpos, scr_wrapper_joystick_xpos);
global.delayCallDLL_export_joystick_ypos = external_define("CallDelayedFunctions.dll", "export_joystick_ypos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_ypos, scr_wrapper_joystick_ypos);
global.delayCallDLL_export_joystick_zpos = external_define("CallDelayedFunctions.dll", "export_joystick_zpos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_zpos, scr_wrapper_joystick_zpos);
global.delayCallDLL_export_joystick_rpos = external_define("CallDelayedFunctions.dll", "export_joystick_rpos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_rpos, scr_wrapper_joystick_rpos);
global.delayCallDLL_export_joystick_upos = external_define("CallDelayedFunctions.dll", "export_joystick_upos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_upos, scr_wrapper_joystick_upos);
global.delayCallDLL_export_joystick_vpos = external_define("CallDelayedFunctions.dll", "export_joystick_vpos", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_vpos, scr_wrapper_joystick_vpos);
global.delayCallDLL_export_joystick_pov = external_define("CallDelayedFunctions.dll", "export_joystick_pov", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_joystick_pov, scr_wrapper_joystick_pov);
global.delayCallDLL_export_game_end = external_define("CallDelayedFunctions.dll", "export_game_end", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_game_end, scr_wrapper_game_end);
global.delayCallDLL_export_link_leave_wall = external_define("CallDelayedFunctions.dll", "export_link_leave_wall", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_link_leave_wall, scr_wrapper_link_leave_wall);
global.delayCallDLL_export_get_keyboard_lastkey = external_define("CallDelayedFunctions.dll", "export_get_keyboard_lastkey", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_keyboard_lastkey, scr_wrapper_get_keyboard_lastkey);
global.delayCallDLL_export_set_keyboard_lastkey = external_define("CallDelayedFunctions.dll", "export_set_keyboard_lastkey", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_keyboard_lastkey, scr_wrapper_set_keyboard_lastkey);
global.delayCallDLL_export_get_mouse_x = external_define("CallDelayedFunctions.dll", "export_get_mouse_x", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_mouse_x, scr_wrapper_get_mouse_x);
global.delayCallDLL_export_set_mouse_x = external_define("CallDelayedFunctions.dll", "export_set_mouse_x", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_mouse_x, scr_wrapper_set_mouse_x);
global.delayCallDLL_export_get_mouse_y = external_define("CallDelayedFunctions.dll", "export_get_mouse_y", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_mouse_y, scr_wrapper_get_mouse_y);
global.delayCallDLL_export_set_mouse_y = external_define("CallDelayedFunctions.dll", "export_set_mouse_y", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_mouse_y, scr_wrapper_set_mouse_y);
global.delayCallDLL_export_get_fa_left = external_define("CallDelayedFunctions.dll", "export_get_fa_left", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_left, scr_wrapper_get_fa_left);
global.delayCallDLL_export_set_fa_left = external_define("CallDelayedFunctions.dll", "export_set_fa_left", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_left, scr_wrapper_set_fa_left);
global.delayCallDLL_export_get_fa_center = external_define("CallDelayedFunctions.dll", "export_get_fa_center", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_center, scr_wrapper_get_fa_center);
global.delayCallDLL_export_set_fa_center = external_define("CallDelayedFunctions.dll", "export_set_fa_center", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_center, scr_wrapper_set_fa_center);
global.delayCallDLL_export_get_fa_right = external_define("CallDelayedFunctions.dll", "export_get_fa_right", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_right, scr_wrapper_get_fa_right);
global.delayCallDLL_export_set_fa_right = external_define("CallDelayedFunctions.dll", "export_set_fa_right", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_right, scr_wrapper_set_fa_right);
global.delayCallDLL_export_get_fa_top = external_define("CallDelayedFunctions.dll", "export_get_fa_top", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_top, scr_wrapper_get_fa_top);
global.delayCallDLL_export_set_fa_top = external_define("CallDelayedFunctions.dll", "export_set_fa_top", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_top, scr_wrapper_set_fa_top);
global.delayCallDLL_export_get_fa_middle = external_define("CallDelayedFunctions.dll", "export_get_fa_middle", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_middle, scr_wrapper_get_fa_middle);
global.delayCallDLL_export_set_fa_middle = external_define("CallDelayedFunctions.dll", "export_set_fa_middle", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_middle, scr_wrapper_set_fa_middle);
global.delayCallDLL_export_get_fa_bottom = external_define("CallDelayedFunctions.dll", "export_get_fa_bottom", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_fa_bottom, scr_wrapper_get_fa_bottom);
global.delayCallDLL_export_set_fa_bottom = external_define("CallDelayedFunctions.dll", "export_set_fa_bottom", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_fa_bottom, scr_wrapper_set_fa_bottom);
global.delayCallDLL_export_get_vk_left = external_define("CallDelayedFunctions.dll", "export_get_vk_left", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_left, scr_wrapper_get_vk_left);
global.delayCallDLL_export_set_vk_left = external_define("CallDelayedFunctions.dll", "export_set_vk_left", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_left, scr_wrapper_set_vk_left);
global.delayCallDLL_export_get_vk_right = external_define("CallDelayedFunctions.dll", "export_get_vk_right", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_right, scr_wrapper_get_vk_right);
global.delayCallDLL_export_set_vk_right = external_define("CallDelayedFunctions.dll", "export_set_vk_right", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_right, scr_wrapper_set_vk_right);
global.delayCallDLL_export_get_vk_up = external_define("CallDelayedFunctions.dll", "export_get_vk_up", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_up, scr_wrapper_get_vk_up);
global.delayCallDLL_export_set_vk_up = external_define("CallDelayedFunctions.dll", "export_set_vk_up", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_up, scr_wrapper_set_vk_up);
global.delayCallDLL_export_get_vk_down = external_define("CallDelayedFunctions.dll", "export_get_vk_down", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_down, scr_wrapper_get_vk_down);
global.delayCallDLL_export_set_vk_down = external_define("CallDelayedFunctions.dll", "export_set_vk_down", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_down, scr_wrapper_set_vk_down);
global.delayCallDLL_export_get_vk_enter = external_define("CallDelayedFunctions.dll", "export_get_vk_enter", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_enter, scr_wrapper_get_vk_enter);
global.delayCallDLL_export_set_vk_enter = external_define("CallDelayedFunctions.dll", "export_set_vk_enter", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_enter, scr_wrapper_set_vk_enter);
global.delayCallDLL_export_get_vk_escape = external_define("CallDelayedFunctions.dll", "export_get_vk_escape", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_escape, scr_wrapper_get_vk_escape);
global.delayCallDLL_export_set_vk_escape = external_define("CallDelayedFunctions.dll", "export_set_vk_escape", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_escape, scr_wrapper_set_vk_escape);
global.delayCallDLL_export_get_vk_space = external_define("CallDelayedFunctions.dll", "export_get_vk_space", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_space, scr_wrapper_get_vk_space);
global.delayCallDLL_export_set_vk_space = external_define("CallDelayedFunctions.dll", "export_set_vk_space", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_space, scr_wrapper_set_vk_space);
global.delayCallDLL_export_get_vk_shift = external_define("CallDelayedFunctions.dll", "export_get_vk_shift", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_shift, scr_wrapper_get_vk_shift);
global.delayCallDLL_export_set_vk_shift = external_define("CallDelayedFunctions.dll", "export_set_vk_shift", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_shift, scr_wrapper_set_vk_shift);
global.delayCallDLL_export_get_vk_control = external_define("CallDelayedFunctions.dll", "export_get_vk_control", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_vk_control, scr_wrapper_get_vk_control);
global.delayCallDLL_export_set_vk_control = external_define("CallDelayedFunctions.dll", "export_set_vk_control", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_vk_control, scr_wrapper_set_vk_control);
global.delayCallDLL_export_get_pr_pointlist = external_define("CallDelayedFunctions.dll", "export_get_pr_pointlist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_pointlist, scr_wrapper_get_pr_pointlist);
global.delayCallDLL_export_set_pr_pointlist = external_define("CallDelayedFunctions.dll", "export_set_pr_pointlist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_pointlist, scr_wrapper_set_pr_pointlist);
global.delayCallDLL_export_get_pr_linelist = external_define("CallDelayedFunctions.dll", "export_get_pr_linelist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_linelist, scr_wrapper_get_pr_linelist);
global.delayCallDLL_export_set_pr_linelist = external_define("CallDelayedFunctions.dll", "export_set_pr_linelist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_linelist, scr_wrapper_set_pr_linelist);
global.delayCallDLL_export_get_pr_linestrip = external_define("CallDelayedFunctions.dll", "export_get_pr_linestrip", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_linestrip, scr_wrapper_get_pr_linestrip);
global.delayCallDLL_export_set_pr_linestrip = external_define("CallDelayedFunctions.dll", "export_set_pr_linestrip", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_linestrip, scr_wrapper_set_pr_linestrip);
global.delayCallDLL_export_get_pr_trianglelist = external_define("CallDelayedFunctions.dll", "export_get_pr_trianglelist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_trianglelist, scr_wrapper_get_pr_trianglelist);
global.delayCallDLL_export_set_pr_trianglelist = external_define("CallDelayedFunctions.dll", "export_set_pr_trianglelist", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_trianglelist, scr_wrapper_set_pr_trianglelist);
global.delayCallDLL_export_get_pr_trianglestrip = external_define("CallDelayedFunctions.dll", "export_get_pr_trianglestrip", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_trianglestrip, scr_wrapper_get_pr_trianglestrip);
global.delayCallDLL_export_set_pr_trianglestrip = external_define("CallDelayedFunctions.dll", "export_set_pr_trianglestrip", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_trianglestrip, scr_wrapper_set_pr_trianglestrip);
global.delayCallDLL_export_get_pr_trianglefan = external_define("CallDelayedFunctions.dll", "export_get_pr_trianglefan", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_get_pr_trianglefan, scr_wrapper_get_pr_trianglefan);
global.delayCallDLL_export_set_pr_trianglefan = external_define("CallDelayedFunctions.dll", "export_set_pr_trianglefan", dll_cdecl, ty_real, 1, ty_real);
external_call(global.delayCallDLL_export_set_pr_trianglefan, scr_wrapper_set_pr_trianglefan);

#define scr_wrapper_d3d_model_create
return d3d_model_create();

#define scr_wrapper_d3d_model_destroy
d3d_model_destroy(argument[0]);

#define scr_wrapper_d3d_model_load
d3d_model_load(argument[0],argument[1]);

#define scr_wrapper_d3d_model_draw
d3d_model_draw(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_d3d_model_primitive_begin
d3d_model_primitive_begin(argument[0],argument[1]);

#define scr_wrapper_d3d_model_vertex_texture
d3d_model_vertex_texture(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);

#define scr_wrapper_d3d_model_primitive_end
d3d_model_primitive_end(argument[0]);

#define scr_wrapper_d3d_primitive_begin
d3d_primitive_begin(argument[0]);

#define scr_wrapper_d3d_vertex
d3d_vertex(argument[0],argument[1],argument[2]);

#define scr_wrapper_d3d_vertex_color
d3d_vertex_color(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_d3d_primitive_end
d3d_primitive_end();

#define scr_wrapper_d3d_primitive_begin_texture
d3d_primitive_begin_texture(argument[0],argument[1]);

#define scr_wrapper_d3d_vertex_texture
d3d_vertex_texture(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_d3d_vertex_texture_color
d3d_vertex_texture_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);

#define scr_wrapper_d3d_vertex_normal_color
d3d_vertex_normal_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);

#define scr_wrapper_d3d_vertex_normal_texture
d3d_vertex_normal_texture(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);

#define scr_wrapper_d3d_vertex_normal_texture_color
d3d_vertex_normal_texture_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);

#define scr_wrapper_d3d_draw_block
d3d_draw_block(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);

#define scr_wrapper_d3d_draw_cylinder
d3d_draw_cylinder(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);

#define scr_wrapper_d3d_draw_cone
d3d_draw_cone(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);

#define scr_wrapper_d3d_draw_ellipsoid
d3d_draw_ellipsoid(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);

#define scr_wrapper_d3d_draw_wall
d3d_draw_wall(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);

#define scr_wrapper_d3d_draw_floor
d3d_draw_floor(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);

#define scr_wrapper_d3d_set_projection_ortho
d3d_set_projection_ortho(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_d3d_set_projection_perspective
d3d_set_projection_perspective(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_d3d_set_projection
d3d_set_projection(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8]);

#define scr_wrapper_d3d_start
d3d_start();

#define scr_wrapper_d3d_set_fog
d3d_set_fog(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_d3d_set_lighting
d3d_set_lighting(argument[0]);

#define scr_wrapper_d3d_transform_set_identity
d3d_transform_set_identity();

#define scr_wrapper_d3d_transform_set_translation
d3d_transform_set_translation(argument[0],argument[1],argument[2]);

#define scr_wrapper_d3d_transform_set_scaling
d3d_transform_set_scaling(argument[0],argument[1],argument[2]);

#define scr_wrapper_d3d_transform_set_rotation_x
d3d_transform_set_rotation_x(argument[0]);

#define scr_wrapper_d3d_transform_set_rotation_y
d3d_transform_set_rotation_y(argument[0]);

#define scr_wrapper_d3d_transform_set_rotation_z
d3d_transform_set_rotation_z(argument[0]);

#define scr_wrapper_d3d_transform_set_rotation_axis
d3d_transform_set_rotation_axis(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_d3d_transform_add_translation
d3d_transform_add_translation(argument[0],argument[1],argument[2]);

#define scr_wrapper_d3d_transform_add_scaling
d3d_transform_add_scaling(argument[0],argument[1],argument[2]);

#define scr_wrapper_d3d_transform_add_rotation_x
d3d_transform_add_rotation_x(argument[0]);

#define scr_wrapper_d3d_transform_add_rotation_y
d3d_transform_add_rotation_y(argument[0]);

#define scr_wrapper_d3d_transform_add_rotation_z
d3d_transform_add_rotation_z(argument[0]);

#define scr_wrapper_d3d_transform_add_rotation_axis
d3d_transform_add_rotation_axis(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_draw_set_font
draw_set_font(argument[0]);

#define scr_wrapper_draw_set_halign
draw_set_halign(argument[0]);

#define scr_wrapper_draw_set_valign
draw_set_valign(argument[0]);

#define scr_wrapper_draw_text
draw_text(argument[0],argument[1],argument[2]);

#define scr_wrapper_draw_text_ext
draw_text_ext(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_string_width
return string_width(argument[0]);

#define scr_wrapper_string_height
return string_height(argument[0]);

#define scr_wrapper_string_width_ext
return string_width_ext(argument[0],argument[1],argument[2]);

#define scr_wrapper_string_height_ext
return string_height_ext(argument[0],argument[1],argument[2]);

#define scr_wrapper_draw_text_transformed
draw_text_transformed(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);

#define scr_wrapper_draw_text_ext_transformed
draw_text_ext_transformed(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);

#define scr_wrapper_draw_text_color
draw_text_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7]);

#define scr_wrapper_draw_text_ext_color
draw_text_ext_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9]);

#define scr_wrapper_draw_text_transformed_color
draw_text_transformed_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);

#define scr_wrapper_draw_text_ext_transformed_color
draw_text_ext_transformed_color(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10],argument[11],argument[12]);

#define scr_wrapper_sprite_get_texture
return sprite_get_texture(argument[0],argument[1]);

#define scr_wrapper_sprite_add
return sprite_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);

#define scr_wrapper_draw_sprite
draw_sprite(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_show_message
return show_message(argument[0]);

#define scr_wrapper_draw_clear
draw_clear(argument[0]);

#define scr_wrapper_draw_clear_alpha
draw_clear_alpha(argument[0],argument[1]);

#define scr_wrapper_draw_point
draw_point(argument[0],argument[1]);

#define scr_wrapper_draw_line
draw_line(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_draw_line_width
draw_line_width(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_rectangle
draw_rectangle(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_roundrect
draw_roundrect(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_triangle
draw_triangle(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6]);

#define scr_wrapper_draw_circle
draw_circle(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_draw_ellipse
draw_ellipse(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_set_circle_precision
draw_set_circle_precision(argument[0]);

#define scr_wrapper_draw_arrow
draw_arrow(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_button
draw_button(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_draw_path
draw_path(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_draw_healthbar
draw_healthbar(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7],argument[8],argument[9],argument[10]);

#define scr_wrapper_draw_set_color
draw_set_color(argument[0]);

#define scr_wrapper_draw_set_alpha
draw_set_alpha(argument[0]);

#define scr_wrapper_draw_get_color
return draw_get_color();

#define scr_wrapper_draw_get_alpha
return draw_get_alpha();

#define scr_wrapper_make_color_rgb
return make_color_rgb(argument[0],argument[1],argument[2]);

#define scr_wrapper_make_color_hsv
return make_color_hsv(argument[0],argument[1],argument[2]);

#define scr_wrapper_color_get_red
return color_get_red(argument[0]);

#define scr_wrapper_color_get_green
return color_get_green(argument[0]);

#define scr_wrapper_color_get_blue
return color_get_blue(argument[0]);

#define scr_wrapper_color_get_hue
return color_get_hue(argument[0]);

#define scr_wrapper_color_get_saturation
return color_get_saturation(argument[0]);

#define scr_wrapper_color_get_value
return color_get_value(argument[0]);

#define scr_wrapper_merge_color
return merge_color(argument[0],argument[1],argument[2]);

#define scr_wrapper_draw_getpixel
return draw_getpixel(argument[0],argument[1]);

#define scr_wrapper_screen_save
screen_save(argument[0]);

#define scr_wrapper_screen_save_part
screen_save_part(argument[0],argument[1],argument[2],argument[3],argument[4]);

#define scr_wrapper_window_set_visible
window_set_visible(argument[0]);

#define scr_wrapper_window_get_visible
return window_get_visible();

#define scr_wrapper_window_set_fullscreen
window_set_fullscreen(argument[0]);

#define scr_wrapper_window_get_fullscreen
return window_get_fullscreen();

#define scr_wrapper_window_set_showborder
window_set_showborder(argument[0]);

#define scr_wrapper_window_get_showborder
return window_get_showborder();

#define scr_wrapper_window_set_showicons
window_set_showicons(argument[0]);

#define scr_wrapper_window_get_showicons
return window_get_showicons();

#define scr_wrapper_window_set_stayontop
window_set_stayontop(argument[0]);

#define scr_wrapper_window_get_stayontop
return window_get_stayontop();

#define scr_wrapper_window_set_sizeable
window_set_sizeable(argument[0]);

#define scr_wrapper_window_get_sizeable
return window_get_sizeable();

#define scr_wrapper_window_get_width
return window_get_width();

#define scr_wrapper_window_get_height
return window_get_height();

#define scr_wrapper_display_get_width
return display_get_width();

#define scr_wrapper_display_get_height
return display_get_height();

#define scr_wrapper_display_get_colordepth
return display_get_colordepth();

#define scr_wrapper_display_get_frequency
return display_get_frequency();

#define scr_wrapper_display_set_size
display_set_size(argument[0],argument[1]);

#define scr_wrapper_display_set_colordepth
display_set_colordepth(argument[0]);

#define scr_wrapper_display_set_frequency
display_set_frequency(argument[0]);

#define scr_wrapper_display_set_all
display_set_all(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_display_test_all
return display_test_all(argument[0],argument[1],argument[2],argument[3]);

#define scr_wrapper_display_reset
display_reset();

#define scr_wrapper_display_mouse_get_x
return display_mouse_get_x();

#define scr_wrapper_display_mouse_get_y
return display_mouse_get_y();

#define scr_wrapper_display_mouse_set
display_mouse_set(argument[0],argument[1]);

#define scr_wrapper_mouse_check_button
return mouse_check_button(argument[0]);

#define scr_wrapper_mouse_check_button_pressed
return mouse_check_button_pressed(argument[0]);

#define scr_wrapper_mouse_check_button_released
return mouse_check_button_released(argument[0]);

#define scr_wrapper_mouse_wheel_up
return mouse_wheel_up();

#define scr_wrapper_mouse_wheel_down
return mouse_wheel_down();

#define scr_wrapper_keyboard_check
return keyboard_check(argument[0]);

#define scr_wrapper_keyboard_check_pressed
return keyboard_check_pressed(argument[0]);

#define scr_wrapper_keyboard_check_released
return keyboard_check_released(argument[0]);

#define scr_wrapper_joystick_exists
return joystick_exists(argument[0]);

#define scr_wrapper_joystick_axes
joystick_axes(argument[0]);

#define scr_wrapper_joystick_buttons
return joystick_buttons(argument[0]);

#define scr_wrapper_joystick_has_pov
return joystick_has_pov(argument[0]);

#define scr_wrapper_joystick_direction
return joystick_direction(argument[0]);

#define scr_wrapper_joystick_check_button
return joystick_check_button(argument[0],argument[1]);

#define scr_wrapper_joystick_xpos
return joystick_xpos(argument[0]);

#define scr_wrapper_joystick_ypos
return joystick_ypos(argument[0]);

#define scr_wrapper_joystick_zpos
return joystick_zpos(argument[0]);

#define scr_wrapper_joystick_rpos
return joystick_rpos(argument[0]);

#define scr_wrapper_joystick_upos
return joystick_upos(argument[0]);

#define scr_wrapper_joystick_vpos
return joystick_vpos(argument[0]);

#define scr_wrapper_joystick_pov
return joystick_pov(argument[0]);

#define scr_wrapper_game_end
game_end();

#define scr_wrapper_link_leave_wall
link_leave_wall(argument[0]);

#define scr_wrapper_get_keyboard_lastkey
return keyboard_lastkey;

#define scr_wrapper_set_keyboard_lastkey
//keyboard_lastkey = argument[0];

#define scr_wrapper_get_mouse_x
return mouse_x;

#define scr_wrapper_set_mouse_x
//mouse_x = argument[0];

#define scr_wrapper_get_mouse_y
return mouse_y;

#define scr_wrapper_set_mouse_y
//mouse_y = argument[0];

#define scr_wrapper_get_fa_left
return fa_left;

#define scr_wrapper_set_fa_left
//fa_left = argument[0];

#define scr_wrapper_get_fa_center
return fa_center;

#define scr_wrapper_set_fa_center
//fa_center = argument[0];

#define scr_wrapper_get_fa_right
return fa_right;

#define scr_wrapper_set_fa_right
//fa_right = argument[0];

#define scr_wrapper_get_fa_top
return fa_top;

#define scr_wrapper_set_fa_top
//fa_top = argument[0];

#define scr_wrapper_get_fa_middle
return fa_middle;

#define scr_wrapper_set_fa_middle
//fa_middle = argument[0];

#define scr_wrapper_get_fa_bottom
return fa_bottom;

#define scr_wrapper_set_fa_bottom
//fa_bottom = argument[0];

#define scr_wrapper_get_vk_left
return vk_left;

#define scr_wrapper_set_vk_left
//vk_left = argument[0];

#define scr_wrapper_get_vk_right
return vk_right;

#define scr_wrapper_set_vk_right
//vk_right = argument[0];

#define scr_wrapper_get_vk_up
return vk_up;

#define scr_wrapper_set_vk_up
//vk_up = argument[0];

#define scr_wrapper_get_vk_down
return vk_down;

#define scr_wrapper_set_vk_down
//vk_down = argument[0];

#define scr_wrapper_get_vk_enter
return vk_enter;

#define scr_wrapper_set_vk_enter
//vk_enter = argument[0];

#define scr_wrapper_get_vk_escape
return vk_escape;

#define scr_wrapper_set_vk_escape
//vk_escape = argument[0];

#define scr_wrapper_get_vk_space
return vk_space;

#define scr_wrapper_set_vk_space
//vk_space = argument[0];

#define scr_wrapper_get_vk_shift
return vk_shift;

#define scr_wrapper_set_vk_shift
//vk_shift = argument[0];

#define scr_wrapper_get_vk_control
return vk_control;

#define scr_wrapper_set_vk_control
//vk_control = argument[0];

#define scr_wrapper_get_pr_pointlist
return pr_pointlist;

#define scr_wrapper_set_pr_pointlist
//pr_pointlist = argument[0];

#define scr_wrapper_get_pr_linelist
return pr_linelist;

#define scr_wrapper_set_pr_linelist
//pr_linelist = argument[0];

#define scr_wrapper_get_pr_linestrip
return pr_linestrip;

#define scr_wrapper_set_pr_linestrip
//pr_linestrip = argument[0];

#define scr_wrapper_get_pr_trianglelist
return pr_trianglelist;

#define scr_wrapper_set_pr_trianglelist
//pr_trianglelist = argument[0];

#define scr_wrapper_get_pr_trianglestrip
return pr_trianglestrip;

#define scr_wrapper_set_pr_trianglestrip
//pr_trianglestrip = argument[0];

#define scr_wrapper_get_pr_trianglefan
return pr_trianglefan;

#define scr_wrapper_set_pr_trianglefan
//pr_trianglefan = argument[0];

