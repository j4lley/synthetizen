//varying lowp vec4 col;
varying mediump vec4 texc;
uniform sampler2D tex_background;  // RGB base image
//uniform sampler2D tex_background_depth;  // RGB base image
uniform sampler2D tex_irpv; 
//uniform sampler2D tex_irpv_depth; 
uniform sampler2D tex_ir;
uniform sampler2D tex_alpha;


void main() 
{
	//gl_FragColor = vec4(vec2(texc.st),0.0f,1.0f);
   
	//vec4 rgb_color = texture2D(texture, texc.st);
	//vec4 depth = texture2D(textureA, texc.st);
   //vec4 ss_color = texture2D(textureB, texc.st);
	
	vec4 background = texture2D(tex_background, texc.st);
//	vec4 background_depth = texture2D(tex_background_depth, texc.st);   
	vec4 irpv = texture2D(tex_irpv, texc.st);
//	vec4 irpv_depth = texture2D(tex_irpv_depth, texc.st);
	vec4 ir = texture2D(tex_ir, texc.st);
	vec4 alpha = texture2D(tex_alpha, texc.st);
	
	//gl_FragColor = vec4(rgb_color.r, rgb_color.g, rgb_color.b, 1);
	//gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
	//float A = 1.0;
	//float gamma = 1.0;
	//gl_FragColor = vec4(A * pow(rgb_color.r, gamma), A * pow(rgb_color.g, gamma), A * pow(rgb_color.b, gamma), 1.0);
	//gl_FragColor = vec4(vec3(A * pow(depth.r, 1.0/gamma)), 1.0);
	
	//gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
	
	/*vec4 foreground = irpv;
	if (background_depth.r < irpv_depth.r)
		foreground = background;
	*/
	// final = alpha * Irpv + (1-alpha) * (R + Irpv - Ir)   
	// gl_FragColor = alpha.a*irpv/*foreground*/ + (1.0 - alpha.a)*(background/* + (irpv - ir)*/);    // testing VZ car+streets screenshots
	gl_FragColor = alpha.a*irpv/*foreground*/ + (1.0 - alpha.a)*(background + (irpv - ir));    // differential rendering
}
