//varying lowp vec4 col;
varying mediump vec4 texc;
uniform sampler2D texture;  // RGB base image
uniform sampler2D IRPV; 
uniform sampler2D IR;
uniform sampler2D Alpha;


void main() 
{
   //gl_FragColor = vec4(vec2(texc.st),0.0f,1.0f);
   
   //vec4 rgb_color = texture2D(texture, texc.st);
   //vec4 depth = texture2D(textureA, texc.st);
   //vec4 ss_color = texture2D(textureB, texc.st);
   
   vec4 rgb_color = texture2D(texture, texc.st);
   vec4 full_render = texture2D(IRPV, texc.st);
   vec4 surface = texture2D(IR, texc.st);
   vec4 alpha = texture2D(Alpha, texc.st);
   
   //gl_FragColor = vec4(rgb_color.r, rgb_color.g, rgb_color.b, 1);
   //gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
   //float A = 1.0;
   //float gamma = 1.0;
   //gl_FragColor = vec4(A * pow(rgb_color.r, gamma), A * pow(rgb_color.g, gamma), A * pow(rgb_color.b, gamma), 1.0);
   //gl_FragColor = vec4(vec3(A * pow(depth.r, 1.0/gamma)), 1.0);
   
   //gl_FragColor = 0.75*rgb_color + 0.25*ss_color;
   
   gl_FragColor = alpha*full_render + (1-alpha)*(rgb_color + full_render - surface);   
}
