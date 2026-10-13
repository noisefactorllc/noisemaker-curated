search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, seed: 8404)
let osc2 = osc(type: oscKind.noise, offset: -1, seed: 3971)
let osc3 = osc(type: oscKind.sawInv)
let osc4 = osc(type: oscKind.noise, min: 0.47, max: 0.57, seed: 7539)

perlin(
  scale: 56.06,
  octaves: 2,
  dimensions: 3,
  ridges: true,
  warpScale: 54.963,
  warpIntensity: 48.736,
  seed: 38
)
  .write(o0)

reactionDiffusion(
  tex: read(o0),
  zoom: x16,
  smoothing: bSpline4x4,
  speed: 89.98,
  sourceF: brightness,
  feed: 65.38,
  kill: 63.45,
  rate1: osc2,
  rate2: osc1,
  iterations: 13,
  weight: 72.01,
  inputIntensity: 45.64
)
  .seamless(blend: 0.2, repeat: 1)
  .translate(x: osc3)
  .rotate(rotation: osc4)
  .palette(
    index: darkSatin,
    offset: 91,
    repeat: 3,
    alpha: 0.48
  )
  .parallax(direction: vec3(-0.717, 0.697, 0), pivot: 0.34)
  .write(o1)

read(o1)
  .palette(
    index: silvermane,
    offset: 14,
    alpha: 0.82
  )
  .lighting(
    normalStrength: 4.905,
    smoothing: 1.096,
    diffuseColor: #e78934ff,
    specularColor: #4e44ecff,
    specularIntensity: 1.641,
    shininess: 71.662,
    ambientColor: #3645a0ff,
    lightDirection: vec3(0.408, 0.353, 0.703),
    reflection: 20.555,
    refraction: 14.345,
    aberration: 11.678,
    heightMap: read(o1)
  )
  .subchain(name: "lens effects", id: "4ahh") {
    .temporalAberration(redDelay: 8, blueDelay: 0)
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette()
  }
  .write(o2)

render(o2)