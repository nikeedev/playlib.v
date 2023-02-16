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

fn init(mut app &App) {

}


fn main() {

	mut game := playlibv.create_app(window_size, "Playlib.v Test", draw, init)

	game.run()

}
