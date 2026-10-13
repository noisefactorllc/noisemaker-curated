search filter, synth, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.sawInv)
let osc3 = osc(type: oscKind.sine, max: 0.27, speed: 4)

mandala(
  scale: 20,
  rotation: 157.955,
  thickness: 0.19,
  smoothness: 0.752,
  symmetry: 21,
  bindu: true,
  layers: 12,
  layerSpacing: 0.55,
  twist: 43.092,
  shapeGrowth: 0.386,
  fgColor: #79a719ff,
  bgColor: #2b0e82ff,
  animation: rotate,
  speed: -1,
  pulseDepth: 0.976
)
  .polar(
    mode: vortex,
    rotation: 2,
    speed: 2,
    aspectLens: false
  )
  .translate(y: osc1, wrap: mirror)
  .rotate(wrap: mirror, speed: -1)
  .pinch(strength: osc3)
  .warp(
    strength: 34.36,
    scale: 0.94,
    speed: 3,
    wrap: repeat
  )
  .cellRefract(
    amount: 40.87,
    shape: octagon,
    scale: 88.38,
    cellScale: 100,
    smooth: 56.28,
    variation: 100
  )
  .smooth()
  .palette(
    index: ghostly,
    offset: 23,
    repeat: 2,
    alpha: 0.503
  )
  .chrome(
    detail: 3.39,
    smoothness: 23.11,
    distortion: 53.077
  )
  .palette(
    index: mars,
    offset: 24,
    alpha: 0.547
  )
  .feedback(
    blendMode: lighten,
    mix: 30.17,
    distortion: 0.84
  )
  .subchain(name: "lens effects", id: "7ark") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.45,
      intensity: 1.45,
      taps: 15
    )
    .lens(displacement: -0.8)
    .vignette(brightness: 0.07)
  }
  .vaseline(alpha: 0.58)
  .write(o0)

render(o0)