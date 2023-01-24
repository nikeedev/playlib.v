module main

import playlib
import gg
import gx
import os

struct App {
mut:
	ctx    &gg.Context = unsafe { nil }
	image []gg.Image
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
	mut paths := ["assets/blue_train.png", "assets/red_train.png", "assets/green_train.png", "assets/yellow_train.png"]

	// mut logo_path := os.resource_abs_path(os.join_path('assets', 'trains.png'))

	for path in paths {
		app.image.prepend(app.ctx.create_image(path))
	}

	println(app.image.len)
}

fn (app &App) draw() {
	mut rect := gg.Rect{x: 20, y: 20, width: 60, height: 60}

	// rect.pos.x = 60
	mut size := f32(6.7)
	// playlib.draw_filled(rect, app.ctx, gx.blue)

	mut part_sizes := [gg.Rect{ 0, 0, 27, 16 }, gg.Rect{ 0, 0, 25, 15 }, gg.Rect{ 0, 0, 25, 15 }, gg.Rect{ 0, 0, 26, 16 }]


	for img in app.image {
		mut part_size := part_sizes[app.image.index(img)]

		mut img_index := app.image.index(img)

		mut img_size := gg.Rect{ img_index*part_size.width, img_index*part_size.height, part_size.width * size, part_size.height * size }

		app.ctx.draw_image_part(img_size, part_size, img)
	}

	app.ctx.draw_text_def(10, 25, 'game.')
}

fn frame(app &App) {
	app.ctx.begin()
	app.draw()
	app.ctx.end()
}
