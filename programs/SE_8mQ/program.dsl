search synth, filter, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.noise, min: 0.21, max: 0.76)
let osc2 = osc(type: oscKind.noise, max: 0.16)

cell(
  shape: hexagon,
  scale: 94.27,
  cellScale: 100,
  variation: 100,
  speed: 5
)
  .palette(
    index: moss,
    offset: 37,
    alpha: 0.78
  )
  .pixelSort(angled: osc1)
  .deriv(amount: 5)
  .lighting(
    normalStrength: 1.22,
    smoothing: 2.2,
    lightDirection: vec3(0.472, 0.489, 0.733),
    reflection: 17.3,
    refraction: 12.1,
    aberration: 18.2
  )
  .motionBlur(amount: 84.91)
  .rotate(
    rotation: osc2,
    wrap: mirror,
    speed: -1
  )
  .subchain(name: "lens effects", id: "v2uk") {
    .temporalAberration(redDelay: 8, blueDelay: 0)
    .bloom(
      threshold: 0.1,
      softKnee: 0.03,
      intensity: 2,
      radius: 60,
      taps: 45,
      tint: #c5f7ffff
    )
    .lens(displacement: -0.82)
    .vignette(brightness: 0.02, alpha: 0.65)
    .vaseline(alpha: 0.72)
  }
  .adjust(
    rotation: 42.45,
    saturation: 1.01,
    brightness: 3,
    contrast: 0.56
  )
  .write(o0)

render(o0)