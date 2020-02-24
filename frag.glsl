#ifdef GL_ES
precision mediump float;
#endif

#pragma glslify: fbm = require( glsl-fractal-brownian-noise/3d )

uniform float time;
uniform vec2 resolution;
uniform vec2 umouse;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  vec2 mouse = vec2( umouse.x, 1.-umouse.y );
  float d = distance( uv, mouse );
  float t = time / 1000.;
  
  float f1 = fbm( vec3(uv.x,uv.y, t), 4 );
  float f2 = fbm( vec3(uv.x,uv.y, f1*d ), 8 );
  float f3 = fbm( vec3(uv.x,uv.y, f2*d ), 12 );
  
  gl_FragColor = vec4( f1,f2,f3, 1. );
}