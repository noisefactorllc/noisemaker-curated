search synth, filter, classicNoisedeck

let osc1 = osc(type: oscKind.noise, seed: 4238)

from(classicNoisedeck, noise(
  type: sine,
  octaves: 1,
  xScale: 72.24,
  yScale: 26.02,
  seed: 50,
  speed: 100,
  colorMode: srgb
))
  .adjust(
    rotation: osc1,
    hueRange: 200,
    saturation: 2.62,
    brightness: 0.66
  )
  .celShading(
    levels: 3,
    gamma: 0.9,
    antialias: true,
    edgeWidth: 0,
    edgeThreshold: 1
  )
  .palette(index: dealerHat, offset: 29)
  .outline()
  .write(o0)

render(o0)