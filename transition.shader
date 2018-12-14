shader_type canvas_item;

uniform float value;

void fragment() 
{
	if (distance(UV,vec2(0.5,0.5)) > value) 
	{
		COLOR = vec4(0.0);
	} else 
	{
		COLOR = vec4(vec3(0.0), 1.0);
	}
}