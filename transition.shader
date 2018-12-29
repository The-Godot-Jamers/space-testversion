/*shader_type canvas_item;

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
}*/
shader_type canvas_item;
uniform float value;
uniform int NUM_OCTAVES = 5;
float random (in vec2 _st) {
    return fract(sin(dot(_st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}
float noise (in vec2 _st) {
    vec2 i = floor(_st);
    vec2 f = fract(_st);
    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(a, b, u.x) +
            (c - a)* u.y * (1.0 - u.x) +
            (d - b) * u.x * u.y;
}
float fbm ( in vec2 _st) {
    float v = 0.0;
    float a = 0.5;
    vec2 shift = vec2(100.0);
    mat2 rot = mat2(vec2(cos(0.5), sin(0.5)),
                    vec2(-sin(0.5), cos(0.50)));
    for (int i = 0; i < NUM_OCTAVES; ++i) {
        v += a * noise(_st);
        _st = rot * _st * 2.0 + shift;
        a *= 0.5;
    }
    return v;
}
void fragment() {
	if (distance(UV,vec2(0.5,0.5)) > value) 
	{
		COLOR = vec4(0.0);
	} else 
	{
    vec2 st = UV;
    vec3 color = vec3(0.0);
    vec2 q = vec2(0.);
    q.x = fbm( st + 0.00*TIME);
    q.y = fbm( st + vec2(1.0));
    vec2 r = vec2(0.);
    r.x = fbm( st + 1.0*q + vec2(1.7,9.2)+ 0.15*TIME );
    r.y = fbm( st + 1.0*q + vec2(8.3,2.8)+ 0.126*TIME);
    float f = fbm(st+r);
    color = mix(vec3(0.701961,0.819608,0.666667),
                vec3(0.966667,0.666667,0.498039),
                clamp((f*f)*4.0,0.0,1.0));
    color = mix(color,
                vec3(0.3,0,0.164706),
                clamp(length(q),0.0,1.0));
    color = mix(color,
                vec3(0.466667,1,1),
                clamp(length(r),0.0,1.0));
		COLOR = vec4((f*f*f+.6*f*f+.5*f)*color,1.) * texture(SCREEN_TEXTURE, SCREEN_UV);
	}
}