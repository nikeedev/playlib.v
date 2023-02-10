module playlibv

import gg
import gx
import os

type DrawFn = fn (ctx &gg.Context, dt f32)

type IninFn = fn (mut app &App)

pub struct App {
pub mut:
	ctx    &gg.Context = unsafe { nil }
	draw DrawFn
	init IninFn
}

pub fn create_app(window_size Vec2, window_title string, draw DrawFn, init IninFn) &App {
	mut app := &App{
		ctx: 0
		init: init
		draw: draw
	}

	app.ctx = gg.new_context(
		bg_color: gx.white
		width: window_size.x
		height: window_size.y
		create_window: true
		window_title: window_title
		frame_fn: frame
		user_data: app
		init_fn: init
	)

	return app
}

pub fn (mut app App) run() {
	app.ctx.run()
}


fn frame(app &App) {
	app.ctx.begin()

	app.draw(app.ctx, 0.01)

	app.ctx.end()
}


// not implemented yet
// pub struct Scene {
// pub mut:

// }


pub struct Rect {
pub mut:
	pos Vec2
	size Vec2
	color gx.Color
}

pub fn (rect &Rect) draw_filled(ctx &gg.Context) {
	ctx.draw_rect_filled(rect.pos.x, rect.pos.y, rect.size.x, rect.size.y, rect.color)
}

pub fn (rect &Rect) draw_empty(ctx &gg.Context) {
	ctx.draw_rect_empty(rect.pos.x, rect.pos.y, rect.size.x, rect.size.y, rect.color)
}


pub struct Vec2 {
pub mut:
	x int
	y int
}

// converts a Vec2 object to string
pub fn (vec Vec2) str() string {
	return '{x: $vec.x, y: $vec.y}'
}

pub fn (vec1 Vec2) + (vec2 Vec2) Vec2 {
	return Vec2{vec1.x + vec2.x, vec1.y + vec2.y}
}

