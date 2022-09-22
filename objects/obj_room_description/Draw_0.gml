draw_set_color(c_black);
draw_set_font(font_main);
draw_set_halign(fa_center);

if room == Level_1
{
	draw_text(x, y, "USE 'A' TO MOVE LEFT, 'D' TO MOVE RIGHT, 'W' TO JUMP, AND SPACEBAR TO USE BOXES AND DOORS");
}

else if room = Level_2
{
	if droppedBox == true
	{
		draw_text(x, y, "WAT IS U DOING? U NEED THAT BOX? TRY NOT DROPPING IT?");
	}
	else if trollDeath == true
	{
		draw_text(x, y, "WAT? U DIDN'T SEE THAT HOLE?");
	}
	else
	{
		if deaths == 0
		{
			draw_text(x, y, "THIS LEVEL IS PRETTY SIMPLE. JUST ONE LITTLE JUMP.");
		}
		else if deaths == 1
		{
			draw_text(x, y, "CAN'T MAKE THAT JUMP? TRY USING THE BOX? NOT THAT HARD? LUL?");
		}
		else if deaths == 2
		{
			draw_text(x, y, "USE UR FEET AND JUST JUMP? LOL?");
		}
		else if deaths > 2
		{
			draw_text(x, y, "PLS BRO. I DON'T HAVE ALL DAY.");
		}
	}
	levelDeaths[2] = deaths;
}

else if room = Level_3
{
	pastDeaths = levelDeaths[2];
	if droppedBox == true
	{
		draw_text(x, y, "WAT IS U DOING? U NEED THAT BOX? TRY NOT DROPPING IT?");
	}
	else if restart == true
	{
		draw_text(x, y, "STOP RESTARTING? JUST DO IT FIRST TRY?");
	}
	else
	{
		if deaths - pastDeaths == 0
		{
			draw_text(x, y, "ANOTHER EASY LEVEL. SHOULDN'T BE THAT HARD. PRESS 'R' TO RESTART IF U NEED TO.");
		}
		else if deaths - pastDeaths == 1
		{
			draw_text(x, y, "HOW IS U DYING? THAT JUMP IS SO EASY.");
		}
		else if deaths - pastDeaths == 2
		{
			draw_text(x, y, "THIS IS LVL 3 BUDDY.");
		}
		else if deaths - pastDeaths > 2
		{
			draw_text(x, y, "PLS BRO. I DON'T HAVE ALL DAY.");
		}
	}
	levelDeaths[3] = deaths - pastDeaths;
}