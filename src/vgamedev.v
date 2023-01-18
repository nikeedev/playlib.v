module vgamedev

pub struct Vec2 {
mut:
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

pub struct Vec3 {
mut:
	x int
	y int
	z int
}


// converts a Vec3 object to string
pub fn (vec Vec3) str() string {
	return '{x: $vec.x, y: $vec.y, z: $vec.z}'
}


pub fn (vec1 Vec3) + (vec2 Vec3) Vec3 {
	return Vec3{vec1.x + vec2.x, vec1.y + vec2.y, vec1.z + vec2.z}
}

