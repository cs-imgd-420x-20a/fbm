const glslify = require('glslify')
const toy     = require('gl-toy')

const shader = glslify('./frag.glsl')

let x,y
window.addEventListener( 'mousemove', e => {
  x = e.pageX
  y = e.pageY
})

let count = 0
toy( shader, (gl, shader) => {
  shader.uniforms.resolution = [ gl.drawingBufferWidth, gl.drawingBufferHeight ]
  shader.uniforms.time = count++
  shader.uniforms.umouse = [x/gl.drawingBufferWidth,y/gl.drawingBufferHeight]
})