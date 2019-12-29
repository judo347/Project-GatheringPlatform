//https://www.youtube.com/watch?v=K9FBpJ2Ypb4

shader_type canvas_item;
render_mode unshaded; //Unaffected by light

uniform float cutoff : hint_range(0.0, 1.0); //Values above this threshold will be visable 
uniform float smooth_size : hint_range(0.0, 1.0);
uniform sampler2D mask : hint_albedo; //Texture

//Fragment shader that controls pixels one by one
//Fragment() scans all pixels on the screen
void fragment()
{
	float value = texture(mask, UV).r; //Only grapping red, will give os a grey scale
	//float alpha = step(cutoff, value);
	float alpha = smoothstep(cutoff, cutoff + smooth_size, value * (1.0 - smooth_size) + smooth_size);
	COLOR = vec4(COLOR.rgb, alpha);
}