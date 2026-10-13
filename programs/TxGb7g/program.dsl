search synth, filter

let osc1 = osc(type: oscKind.saw)

perlin(scale: 65.36, seed: 19)
  .adjust(rotation: osc1, hueRange: 200)
  .celShading(levels: 2, edgeThreshold: 0.01)
  .palette(
    index: springtime,
    rotation: fwd,
    repeat: 10
  )
  .write(o0)

render(o0)