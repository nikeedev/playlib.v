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

	for i := 0; i < vecs.len; i++ {
		vecs[i] += playlib.Vec2{1, 1}
	}
	println("\nNew: ")

	for vec in vecs {
		println(vec.str())
	}

	// println(pos.str())
}
