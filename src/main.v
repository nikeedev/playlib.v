module main

import playlib { Vec2, Vec3 }


fn main() {
	mut pos := playlib.Vec3{5, 5, 6}
	mut vecs := [Vec2{5, 5}, Vec2{6, 6}, Vec2{7, 7}]
	// pos += playlib.Vec3{10, 10, 11}

	for vec in vecs {
		println(vec.str())
	}

	// println(pos.str())
}
