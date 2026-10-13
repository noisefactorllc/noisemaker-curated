search synth, filter, classicNoisedeck, user

let osc1 = osc(type: oscKind.saw)

chromeicosahedroninterior(
  reflections: 4,
  glowIntensity: 3,
  chromeShift: 0,
  cameraOffset: 0.3
)
  .adjust(
    rotation: osc1,
    hueRange: 25,
    saturation: 1.93
  )
  .celShading(
    levels: 7,
    edgeWidth: 0,
    edgeThreshold: 1
  )
  .palette(
    index: dealerHat,
    rotation: fwd,
    repeat: 7
  )
  .outline(thickness: 2.2)
  .smooth()
  .write(o0)

render(o0)