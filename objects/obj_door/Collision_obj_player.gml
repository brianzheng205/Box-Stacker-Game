if (keyboard_check_pressed(vk_space))
{
	obj_level.level++;
	room_goto(targetRoom);
	if targetRoom == Finish
	{
		obj_timer.end_time = floor((current_time - obj_timer.start_time) / 10) / 100;
	}
}