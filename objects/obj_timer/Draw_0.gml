draw_set_color(c_black);
draw_set_font(font_main);
draw_set_halign(fa_center);
draw_text(x, y, floor((current_time - start_time) / 10) / 100);