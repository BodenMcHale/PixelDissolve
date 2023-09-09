shader_type canvas_item;

uniform float time_offset : hint_range(0.0, 1.0, 0.001) = 1.0;
uniform float dissolve_speed = 1.0;

float random_coord(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898,96.233))) * 43758.5453);
}

void fragment() {
	vec2 texture_resolution = 1.0 / TEXTURE_PIXEL_SIZE;
	vec2 pixel_within_texture = floor(UV * texture_resolution);
	vec4 texture_color = texture(TEXTURE, UV);

	if (sin((TIME * dissolve_speed) + time_offset) < random_coord(pixel_within_texture)) {
		// Set to the original texture color
//		COLOR = texture_color;
		// Set to a new color
		COLOR = vec4(0.0, 0.0, 0.0, 0.0); 
	}
	else {
		// German flag
		if (UV.y < 0.33) {
			COLOR.r = 0.0;
			COLOR.g = 0.0;
			COLOR.b = 0.0;
		} 
		else if (UV.y < 0.66) {
			COLOR.r = 1.0;
		}
		else {
			COLOR.r = 1.0;
			COLOR.g = 1.0;
		}
	}
}