draw_set_color(c_black);
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_text(x, y, "I ONLY HAVE 3 LEVELS :) THANKS FOR PLAYING!");
draw_text(x, y + 60, "YOUR TIME WAS " + string(obj_timer.end_time) + " SECONDS.");
draw_set_font(font_small);
draw_text(x, 890, "PRESS 'R' TO RESTART THE GAME AND GET A BETTER TIME");
draw_text(x, 950, "PRESS SPACE TO EXIT");