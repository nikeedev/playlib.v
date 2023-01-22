module playlib

import gg
import gx
import os


// not implemented yet
// pub struct Scene {
// pub mut:

// }


pub fn draw_filled(rect gg.Rect, ctx &gg.Context, color gx.Color) {
	ctx.draw_rect_filled(rect.x, rect.y, rect.x, rect.y, color)
}

pub fn draw_empty(rect gg.Rect, ctx &gg.Context, color gx.Color) {
	ctx.draw_rect_empty(rect.x, rect.y, rect.x, rect.y, color)
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

