module main

import playlib
import gg
import gx
import os


fn main() {
	mut vecs := [playlib.Vec2{5, 5}, playlib.Vec2{6, 6}, playlib.Vec2{7, 7}]

	for vec in vecs {
		println(vec.str())
	}

	// println(pos.str())
}
