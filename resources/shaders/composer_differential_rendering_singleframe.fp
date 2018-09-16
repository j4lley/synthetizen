//varying lowp vec4 col;
varying mediump vec4 texc;
uniform sampler2D tex_background;  // RGB base image
uniform sampler2D tex_background_depth;  // RGB base image
uniform sampler2D tex_irpv; 
uniform sampler2D tex_irpv_depth; 
uniform sampler2D tex_ir;
uniform sampler2D tex_alpha;

//uniform sampler2D tex_diffuse_hero;
//uniform sampler2D tex_diffuse_direct_hero;
//uniform sampler2D tex_diffuse_indirect_hero;
//uniform sampler2D tex_diffuse_filter_hero;

//uniform sampler2D tex_reflection_hero;
//uniform sampler2D tex_reflection_direct_hero;
//uniform sampler2D tex_reflection_indirect_hero;
//uniform sampler2D tex_reflection_filter_hero;

//uniform sampler2D tex_materials_hero;

/*
const highp float gZNear = 0.01;
const highp float gZFar = 10000;

float DepthToZPosition(float depth) {
	// https://mynameismjp.wordpress.com/2010/09/05/position-from-depth-3/
	float NearClipDistance = gZNear;
	float FarClipDistance = gZFar;
	float ProjectionA = FarClipDistance / (FarClipDistance - NearClipDistance);
	float ProjectionB = (-FarClipDistance * NearClipDistance) / (FarClipDistance - NearClipDistance);
	float linearDepth = ProjectionB / (depth - ProjectionA);
	return (linearDepth);
}
*/

// Ford material ID: 241, 187, 225
// Ford material ID: 128, 224, 192
// Ford material ID: 136, 187, 0, 255
// New Car ID: 0 99 136
const ivec4 hero_material_id = vec4(0, 99, 136, 255);
const float thres = 1e-7;

void main() 
{
	//gl_FragColor = vec4(vec2(texc.st),0.0f,1.0f);
   
	//vec4 rgb_color = texture2D(texture, texc.st);
	//vec4 depth = texture2D(textureA, texc.st);
   //vec4 ss_color = texture2D(textureB, texc.st);
	
	vec4 background = texture2D(tex_background, texc.st);
	vec4 background_depth = texture2D(tex_background_depth, texc.st) /*float((1 << 16) - 1)*/; // normalize using maximum representable value using 32 bits;   
	vec4 irpv = texture2D(tex_irpv, texc.st);
	vec4 irpv_depth = texture2D(tex_irpv_depth, texc.st)/* / float((1 << 32) - 1)*/;
	vec4 ir = texture2D(tex_ir, texc.st);
	/*vec4*/float alpha = texture2D(tex_alpha, texc.st);	
	
	//vec4 diffuse_hero = texture2D(tex_diffuse_hero, texc.st);	
	//vec4 diffuse_direct_hero = texture2D(tex_diffuse_direct_hero, texc.st);	
	//vec4 diffuse_indirect_hero = texture2D(tex_diffuse_indirect_hero, texc.st);	
	//vec4 diffuse_filter_hero = texture2D(tex_diffuse_filter_hero, texc.st);	

	//vec4 reflection_hero = texture2D(tex_reflection_hero, texc.st);	
	//vec4 reflection_direct_hero = texture2D(tex_reflection_direct_hero, texc.st);	
	//vec4 reflection_indirect_hero = texture2D(tex_reflection_indirect_hero, texc.st);	
	//vec4 reflection_filter_hero = texture2D(tex_reflection_filter_hero, texc.st);	
	
	//vec4 materials_hero = texture2D(tex_materials_hero, texc.st);	
	
	//vec4 beauty_diffuse_raw = ((diffuse_direct_hero + diffuse_indirect_hero) / diffuse_filter_hero);
	//vec4 beauty_reflection_raw = (reflection_direct_hero + reflection_indirect_hero) / (reflection_filter_hero + vec4(thres));
	
	//vec4 hero = vec4(0,0,0,0);
	
//	if (dot(normalize(materials_hero), normalize(hero_material_id)) > (0.98-thres))
//	{
//		diffuse_filter_hero    *= vec4(0.98,0.02,0.01,1);
//		reflection_filter_hero *= vec4(0.7,0.6,0.6,1);
//		//hero = materials_hero; //hero_material_id/vec4(255.0);
//	}

	//gl_FragColor = vec4(rgb_color.r, rgb_color.g, rgb_color.b, 1);
	//gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
	//float A = 1.0;
	//float gamma = 1.0;
	//gl_FragColor = vec4(A * pow(rgb_color.r, gamma), A * pow(rgb_color.g, gamma), A * pow(rgb_color.b, gamma), 1.0);
	//gl_FragColor = vec4(vec3(A * pow(depth.r, 1.0/gamma)), 1.0);
	
	//gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
	
	// float z         = DepthToZPosition(background_depth);
	
	// final = alpha * Irpv + (1-alpha) * (R + Irpv - Ir)   
	//vec4 hero = irpv;
	//vec4 hero = (diffuse_direct_hero + diffuse_indirect_hero) + (reflection_direct_hero + reflection_indirect_hero);
	//vec4 hero = beauty_diffuse_raw * diffuse_filter_hero + beauty_reflection_raw * reflection_filter_hero/* + (diffuse_direct_hero + diffuse_indirect_hero) + reflection_filter_hero * (reflection_direct_hero + reflection_indirect_hero)*/;				
	
	gl_FragColor = alpha/*.a*/*/*hero*/irpv + (1.0 - alpha/*.a*/)*(background + (irpv - ir));    // testing VZ car+streets screenshots	
	//gl_FragColor = alpha.x*irpv + (1.0 - alpha.x)*(background + (irpv - ir));    // testing VZ car+streets screenshots

//	gl_FragColor = background;
	
	// restore background if needed
//	if (background_depth.r > irpv_depth.r)
//		gl_FragColor = background;
}
