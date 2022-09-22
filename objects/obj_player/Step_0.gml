key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));
key_use = keyboard_check_pressed(vk_space);

var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

if !((sprite_index == spr_player_right_idle) or (sprite_index == spr_player_left_idle) or (sprite_index == spr_player_right_idle_box) or (sprite_index == spr_player_left_idle_box))
{
	image_speed = .5;
}

//idle
if (!(key_left) and !(key_right) //not moving
and (place_meeting(x, y + 1, obj_collision) or place_meeting(x, y + 1, obj_box))) //on ground
{
	image_speed = .1;
	if sprite_index == spr_player_right
	{
		sprite_index = spr_player_right_idle;
	}
	else if sprite_index == spr_player_right_box
	{
		sprite_index = spr_player_right_idle_box;
	} 
	else if sprite_index == spr_player_left
	{
		sprite_index = spr_player_left_idle;
	}
	else if sprite_index == spr_player_left_box
	{
		sprite_index = spr_player_left_idle_box;
	}
}

//left
if ((key_left) and (sprite_index != spr_player_left_box))
{
	if sprite_index == spr_player_right_box or sprite_index == spr_player_left_idle_box or sprite_index == spr_player_right_idle_box
	{
		sprite_index = spr_player_left_box;
	}
	else
	{
		sprite_index = spr_player_left;
	}
}

//right
if ((key_right) and (sprite_index != spr_player_right_box))
{
	if sprite_index == spr_player_left_box or sprite_index == spr_player_left_idle_box or sprite_index == spr_player_right_idle_box
	{
		sprite_index = spr_player_right_box;
	}
	else
	{
		sprite_index = spr_player_right;
	}
}

//jumping
if (place_meeting(x, y + 1, obj_collision) or place_meeting(x, y + 1, obj_box)) and (key_jump)
{
	vsp = -6;
}

//horizontal collision
if (place_meeting(x + hsp, y, obj_collision))
{
	while(!place_meeting(x + sign(hsp), y, obj_collision))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
else if (place_meeting(x + hsp, y, obj_box))
{
	while(!place_meeting(x + sign(hsp), y, obj_box))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertical collision
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


if key_use
{
	if sprite_index == spr_player_right_box or sprite_index == spr_player_right_idle_box
	{
		offset = ceil((x + 24) / 32) * 32;
	}
	else if sprite_index == spr_player_left_box or sprite_index == spr_player_left_idle_box
	{
		offset = floor((x - 56) / 32) * 32;
	}
}

//put down box
if ((key_use) //press spacebar
and (place_meeting(x, y + 1, obj_collision) or place_meeting(x, y + 1, obj_box)) // do not place while in air
and (place_meeting(offset, y + 1, obj_collision) or place_meeting(offset, y + 1, obj_box)) //do not place box in air
and (sprite_index == spr_player_right_box or sprite_index == spr_player_right_idle_box)) //if player facing right
{
	sprite_index = spr_player_right;
	if (!place_meeting(offset, y - 8, obj_collision) and !place_meeting(offset, y - 8, obj_box)) //do not place box in wall or box
	{
		instance_create_layer(offset, y - 8, "Boxes", obj_box);
	}
	else
	{
		if x >= offset - 32
		{
			x -= 32 + x % 32 - 8;
		}
		else
		{
			x -= x % 32 - 8;
		}
		instance_create_layer(offset - 32, y - 8, "Boxes", obj_box);
	}
}

if ((key_use) //press spacebar
and (place_meeting(x, y + 1, obj_collision) or place_meeting(x, y + 1, obj_box)) // do not place while in air
and (place_meeting(offset, y + 1, obj_collision) or place_meeting(offset, y + 1, obj_box)) //do not place box in air
and (sprite_index == spr_player_left_box or sprite_index == spr_player_left_idle_box)) //if player facing left
{
	sprite_index = spr_player_left;
	if (!place_meeting(offset + 32, y - 8, obj_collision) and !place_meeting(offset + 32, y - 8, obj_box)) //do not place box in wall or box
	{
		instance_create_layer(offset, y - 8, "Boxes", obj_box);
	}
	else
	{
		x += 32;
		instance_create_layer(offset + 32, y - 8, "Boxes", obj_box);
	}
}

//die
if y > 1050
{
	room_restart();
	if obj_room_description.trollDeath == true
	{
		obj_room_description.trollDeath = false;
	}
	if obj_room_description.restart == true
	{
		obj_room_description.restart = false;
	}
	if room = Level_2
	{
		if x < 1000
		{
			obj_room_description.deaths++;
		}
		if x > 1000
		{
			obj_room_description.trollDeath = true;
		}
	}
	else
	{
		obj_room_description.deaths++;
	}
	if obj_room_description.droppedBox == true
	{
		obj_room_description.droppedBox = false;
	}
}