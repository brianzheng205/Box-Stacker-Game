if (mouse_x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 48) {x += 4;}
if (mouse_x < __view_get( e__VW.XView, 0 ) + 48) {x -= 4;}

if (mouse_y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 48) {y += 4;}
if (mouse_y < __view_get( e__VW.YView, 0 ) + 48) {y -= 4;}

if (x < __view_get( e__VW.WView, 0 ) / 2) {x = __view_get( e__VW.WView, 0 ) / 2;}
if (x > room_width - __view_get( e__VW.WView, 0 ) / 2) {x = room_width - __view_get( e__VW.WView, 0 ) / 2;}

if (y < __view_get( e__VW.HView, 0 ) / 2) {y = __view_get( e__VW.HView, 0 ) / 2;}
if (y > room_height - __view_get( e__VW.HView, 0 ) / 2) {y = room_height - __view_get( e__VW.HView, 0 ) / 2;}

