search synth, filter

let osc1 = osc(type: oscKind.sine, speed: 4)

perlin(
  scale: 38.57,
  ridges: true,
  seed: 35
)
  .adjust(rotation: osc1, hueRange: 200)
  .celShading(levels: 2, edgeThreshold: 0.01)
  .palette(index: sherbetDouble, rotation: fwd)
  .write(o0)

render(o0)