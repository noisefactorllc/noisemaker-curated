search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, max: 0.03, seed: 7164)

perlin(
  scale: 100,
  dimensions: 3,
  ridges: true,
  warpIterations: 1,
  warpScale: 100,
  warpIntensity: 58.21
)
  .palette(
    index: skykissed,
    offset: 53.696,
    repeat: 3,
    alpha: 0.846
  )
  .halftone(frequency: 59.93, sharpness: 100)
  .invert()
  .adjust(rotation: 147.66)
  .rotate(rotation: osc1)
  .wobble(speed: 2, wrap: clamp)
  .subchain(name: "lens effects", id: "tc46") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -1)
    .vaseline()
  }
  .grain(alpha: 0.22)
  .write(o0)

render(o0)