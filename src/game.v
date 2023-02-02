module main

import playlib
import gg
import gx
import os

fn draw(ctx gg.Context, dt f32) {
	ctx
}

fn init( &App) {

}

const (
	window_size = playlib.Vec2{800, 600}
)

fn main() {

	game := playlib.create_app(window_size, "Playlib.v Test", draw(), init())

}
