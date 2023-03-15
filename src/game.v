module main

import playlibv { Vec2, Rect, create_app, App }
import gg
import gx
import os

const (
	window_size = Vec2{800, 600}
	speed = 5
)


__global (
	vel = Vec2{0, 0}

	rect = Rect{
		pos: Vec2{120, 120}
		size: Vec2{60, 60}
		color: gx.blue
	}

	rect2 = Rect{
		pos: Vec2{120, 120}
		size: Vec2{90, 60}
		color: gx.red
	}
)

fn draw(ctx &gg.Context, dt f32) {

	rect.draw_filled(ctx)

	if ctx.pressed_keys[int(gg.KeyCode.up)] {
		vel.y -= speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.down)] {
		vel.y += speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.left)] {
		vel.x -= speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.right)] {
		vel.x += speed
	}

	if ctx.pressed_keys[int(gg.KeyCode.escape)] {
		exit(0)
	}

	vel.x *= 0.7
	vel.y *= 0.7

	rect.pos.x += vel.x
	rect.pos.y += vel.y

}

fn draw2(ctx &gg.Context, dt f32) {

	rect2.draw_filled(ctx)

	if ctx.pressed_keys[int(gg.KeyCode.up)] {
		vel.y -= speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.down)] {
		vel.y += speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.left)] {
		vel.x -= speed
	}
	if ctx.pressed_keys[int(gg.KeyCode.right)] {
		vel.x += speed
	}

	if ctx.pressed_keys[int(gg.KeyCode.escape)] {
		exit(0)
	}

	vel.x *= 0.7
	vel.y *= 0.7

	rect2.pos.x += vel.x
	rect2.pos.y += vel.y

}

fn init(mut app &App) {

}

fn init2(mut app &App) {

}


fn main() {

	mut game := playlibv.create_app(window_size, "Playlib.v Test")

	mut main_scene := playlibv.Scene{draw: draw, init: init}

	mut main_scene2 := playlibv.Scene{draw: draw2, init: init2}

	game.scenes << main_scene

	game.scenes << main_scene2

	game.current_scene = 0

	game.run()

}
