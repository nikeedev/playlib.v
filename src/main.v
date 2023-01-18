module main

import vgamedev


fn main() {
	mut pos := vgamedev.Vec3{5, 5, 6}
	mut vecs := [Vec2{5, 5}, Vec2{6, 6}, Vec2{7, 7}]
	// pos += vgamedev.Vec3{10, 10, 11}

	vecs.looper()
	// println(pos.str())
}
