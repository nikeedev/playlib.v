module main

import playlib
import gg
import gx
import os

struct App {
mut:
	ctx    &gg.Context = unsafe { nil }
	image gg.Image
}

const (
	win_title = "Game"
	win_width = 800
	win_height = 600
)

fn main() {
	// mut pos := playlib.Vec3{5, 5, 6}
	// mut vecs := [Vec2{5, 5}, Vec2{6, 6}, Vec2{7, 7}]
	// pos += playlib.Vec3{10, 10, 11}

	// for vec in vecs {
	// 	println(vec.str())
	// }

	mut app := &App{
		ctx: 0
	}

	app.ctx = gg.new_context(
		bg_color: gx.white
		width: win_width
		height: win_height
		create_window: true
		window_title: win_title
		frame_fn: frame
		user_data: app
		init_fn: init
	)

	// println(pos.str())

	app.ctx.run()
}

fn init(mut app &App) {
	mut logo_path := os.resource_abs_path(os.join_path('assets', 'trains.png'))
	app.image = app.ctx.create_image(logo_path)
}

pub fn (app &App) draw() {
	mut rect := gg.Rect{x: 20, y: 20, width: 60, height: 60}

	// rect.pos.x = 60

	playlib.draw_filled(rect, app.ctx, gx.blue)

	mut img_size := gg.Rect{ 0, 0, 128, 128 }
	mut part_size := gg.Rect{ 6, 4, 26, 14 }

	app.ctx.draw_image_part(img_size, part_size, app.image)

	app.ctx.draw_text_def(10, 25, 'game.')
}

fn frame(app &App) {
	app.ctx.begin()
	app.draw()
	app.ctx.end()
}
