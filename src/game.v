module main

import playlib
import gg
import gx
import os

const (
	window_size = playlib.Vec2{800, 600}
	speed       = 5
)

fn main() {
	mut vel   := playlib.Vec2{0, 0}

	mut rect  := playlib.Rect{
		pos: playlib.Vec2{120, 120}
		size: playlib.Vec2{60, 60}
		color: gx.blue
	}

	mut rect2 := playlib.Rect{
		pos: playlib.Vec2{120, 120}
		size: playlib.Vec2{90, 60}
		color: gx.red
	}

	mut game := playlib.new_app(window_size, 'Playlib.v Test')

	mut main_scene := playlib.Scene{
		draw: fn [mut rect, mut vel] (ctx &gg.Context, dt f32) {
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
		init: fn (mut app &playlib.App) {
			app.current_scene = 2
		}
	}

	mut main_scene2 := playlib.Scene{
		draw: fn [mut rect2, mut vel] (ctx &gg.Context, dt f32) {
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
		init: fn (mut app playlib.App) {

		}
	}

	game.scenes << main_scene
	game.scenes << main_scene2

	game.run()
}
