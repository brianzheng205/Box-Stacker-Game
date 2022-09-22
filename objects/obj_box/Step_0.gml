//destroy box
if ((keyboard_check_pressed(vk_space))
and (place_meeting(x + 24, y, obj_player))
and (obj_player.sprite_index == spr_player_left or obj_player.sprite_index == spr_player_left_idle))
{
	instance_destroy();
	obj_player.sprite_index = spr_player_left_box;
}

if ((keyboard_check_pressed(vk_space))
and (place_meeting(x - 24, y, obj_player))
and (obj_player.sprite_index == spr_player_right or obj_player.sprite_index == spr_player_right_idle))
{
	instance_destroy();
	obj_player.sprite_index = spr_player_right_box;
}

//vertical collision
vsp = 5;
if (place_meeting(x, y + vsp, obj_collision))
{
	while(!place_meeting(x, y + sign(vsp), obj_collision))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
else if (place_meeting(x, y + vsp, obj_box))
{
	while(!place_meeting(x, y + sign(vsp), obj_box))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//dropped box
if y > 1050
{
	obj_room_description.droppedBox = true;
	room_restart();
}