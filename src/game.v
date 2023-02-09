module main

import playlibv
import gg
import gx
import os

fn draw(ctx gg.Context, dt f32) {
/*
	if app.ctx.pressed_keys[int(gg.KeyCode.w)] || app.ctx.pressed_keys[int(gg.KeyCode.up)] {
		println("Up key down")
		app.img.vel.y -= speed
	}
*/
}

fn init(mut app &playlibv.App) {

}

const (
	window_size = playlibv.Vec2{800, 600}
)

fn main() {

	game := playlibv.create_app(window_size, "Playlib.v Test", draw, init)

}
