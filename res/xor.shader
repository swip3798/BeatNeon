shader_type canvas_item;

void fragment() {
	vec4 sprite = textureLod(TEXTURE, UV, 0.0);
	vec4 background = textureLod(SCREEN_TEXTURE,SCREEN_UV,0.0);
	vec4 result_color = vec4(abs(sprite.r - background.r), abs(sprite.g - background.g), abs(sprite.b - background.b), sprite.a);
	COLOR = result_color;
}