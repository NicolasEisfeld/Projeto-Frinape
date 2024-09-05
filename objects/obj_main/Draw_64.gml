
var mX = device_mouse_x_to_gui(0),
	mY = device_mouse_x(0),
	
	gW = display_get_gui_width(),
	gH = display_get_gui_height(),
	
	spr = spr_button,
	num = sprite_get_number(spr);	
	
	sprW = sprite_get_width(spr);
	sprH = sprite_get_height(spr);


var _y = gH*0.5;

var pointing = -1;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(gW*.5, gH*.25, pergunta, 5, 5, 0);
for(var i = 0; i < 4; i++) {
	var _x = (gW/num) * (i+.5);
	
	draw_text_transformed(_x, _y - sprH, alternativas[i], 5, 5, 0);
	draw_sprite(spr, i, _x, _y);
	
	if (
		point_in_rectangle(mX, mY, _x -sprW*.5, _y - sprH*.5, _x + sprW*5, _y + sprH*.5)
	) {
		pointing = i;
	} 
}
if(mcbp(mb_left) && pointting == correta) {
	game_end();
}