module playlibv

import gg
import gx
import os

type DrawFn = fn (ctx &gg.Context, dt f32)

type IninFn = fn (mut app &App)

pub struct App {
pub mut:
	current_scene int
	scene Scene
	ctx    &gg.Context = unsafe { nil }
	scenes []Scene
}


pub fn create_app(window_size Vec2, window_title string) &App {
	mut app := &App{
		ctx: 0
	}

	app.ctx = gg.new_context(
		bg_color: gx.white
		width: int(window_size.x)
		height: int(window_size.y)
		create_window: true
		window_title: window_title
		frame_fn: frame
		user_data: app
	)

	return app
}

pub fn (mut app App) run() {
	app.scene = app.scenes[app.current_scene]

	app.ctx.config = gg.Config{
		bg_color: gx.white
		width: app.ctx.config.width
		height: app.ctx.config.height
		create_window: true
		window_title: app.ctx.config.window_title
		frame_fn: app.ctx.config.frame_fn
		user_data: app.ctx.config.user_data
		init_fn: app.scene.init
	}

	app.ctx.run()
}

pub fn (mut app App) load(old &App) {
	app.scene = app.scenes[app.current_scene]

	app.ctx.config = gg.Config{
		bg_color: gx.white
		width: app.ctx.config.width
		height: app.ctx.config.height
		create_window: false
		window_title: app.ctx.config.window_title
		frame_fn: app.ctx.config.frame_fn
		user_data: app.ctx.config.user_data
		init_fn: app.scene.init
	}

	app.run()
}

fn frame(app &App) {
	app.ctx.begin()

	app.scene.draw(app.ctx, 1 / 60)

	app.ctx.end()
}

pub struct Scene {
pub mut:
	draw DrawFn
	init IninFn
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
	x f32
	y f32
}

// converts a Vec2 object to string
pub fn (vec Vec2) str() string {
	return '{x: $vec.x, y: $vec.y}'
}

pub fn (vec1 Vec2) + (vec2 Vec2) Vec2 {
	return Vec2{vec1.x + vec2.x, vec1.y + vec2.y}
}

pub struct Image {
pub mut:
	image gg.Image
	rect Rect
}

pub fn (mut img Image) load(file_name string, ctx &gg.Context) {
	img.image = ctx.create_image(os.resource_abs_path(file_name))
}


fn (mut img Image) draw(ctx &gg.Context) {
	ctx.draw_image(img.rect.pos.x, img.rect.pos.y, img.image.width, img.image.height, img.image)
}


/*
pub struct Player {
	rect Rect
	image gg.Image = unsafe { nil }
	vel Vec2
}
*/


