search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, seed: 8404)
let osc2 = osc(type: oscKind.noise, offset: -1, seed: 3971)
let osc3 = osc(type: oscKind.sawInv)
let osc4 = osc(type: oscKind.noise, min: 0.47, max: 0.57, seed: 7539)
let osc5 = osc(type: oscKind.noise, max: 0.25, seed: 5950)

perlin(
  scale: 100,
  octaves: 2,
  dimensions: 3,
  ridges: true,
  warpScale: 54.963,
  warpIntensity: 48.736,
  seed: 60,
  speed: 3
)
  .write(o0)

reactionDiffusion(
  tex: read(o0),
  zoom: x16,
  smoothing: bSpline4x4,
  speed: 96.66,
  sourceF: brightness,
  feed: 71.08,
  kill: 57.41,
  rate1: osc2,
  rate2: osc1,
  iterations: 13,
  weight: 72.01,
  inputIntensity: 45.64
)
  .lowPoly(
    scale: 90,
    edgeStrength: 0.61,
    borderWidth: 12,
    alpha: 0.07,
    speed: 2
  )
  .seamless(blend: 0.13, repeat: 1)
  .palette(
    index: darkSatin,
    offset: 25,
    repeat: 2,
    alpha: 0.48
  )
  .tile(
    symmetry: rotate6,
    scale: 1.05,
    offsetX: -0.48,
    offsetY: -0.38,
    repeat: 1,
    _skip: true
  )
  .translate(x: osc3, y: osc5)
  .rotate(rotation: osc4, speed: 1)
  .warp(
    strength: 17.6,
    scale: 0.53,
    speed: 4
  )
  .parallax(direction: vec3(0, -0.567, 0.824), pivot: 0.34)
  .write(o1)

read(o1)
  .palette(
    index: heatmap,
    offset: 52,
    repeat: 2
  )
  .lighting(
    normalStrength: 4.905,
    smoothing: 4.4,
    diffuseColor: #e78934,
    specularColor: #4e44ec,
    specularIntensity: 1.58,
    shininess: 71.662,
    ambientColor: #3645a0,
    lightDirection: vec3(0.408, 0.353, 0.703),
    reflection: 20.555,
    refraction: 14.345,
    aberration: 11.678,
    heightMap: read(o1)
  )
  .focusBlur(
    tex: read(o1),
    focalDistance: 42.81,
    aperture: 1.29,
    sampleBias: 29.5
  )
  .subchain(name: "lens effects", id: "4ahh") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.5,
      radius: 23,
      taps: 15
    )
    .lens(displacement: -0.66)
    .vignette(brightness: 0.22, alpha: 0.61)
  }
  .adjust(
    saturation: 0.59,
    brightness: 0.78,
    contrast: 0.66
  )
  .write(o2)

render(o2)