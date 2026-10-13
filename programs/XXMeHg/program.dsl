search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, seed: 8404)
let osc2 = osc(type: oscKind.noise, offset: -1, seed: 3971)
let osc4 = osc(type: oscKind.noise, min: 0.47, max: 0.68, seed: 2745)
let osc6 = osc(type: oscKind.sine, min: 0.45, max: 0.55)

cell(
  shape: square,
  scale: 100,
  cellScale: 82.38,
  speed: 4
)
  .write(o0)

cellularAutomata(
  tex: read(o0),
  ruleIndex: maze,
  speed: 78.34,
  weight: 39.16
)
  .palette(
    index: darkSatin,
    offset: 25,
    alpha: 0.48
  )
  .tile(symmetry: rotate6, offsetY: -0.53)
  .seamless(
    blend: 0.16,
    repeat: 1,
    _skip: true
  )
  .tunnel(
    shape: triangle,
    scale: -1,
    speed: 5,
    rotation: 2,
    center: -100
  )
  .warp(
    strength: 5.67,
    scale: 0.46,
    speed: 4
  )
  .wobble(speed: 3.8)
  .rotate(rotation: osc4, speed: -2)
  .parallax(direction: vec3(-0.006, -0.367, 0.93), pivot: 0.57)
  .write(o1)

read(o1)
  .palette(
    index: dealerHat,
    rotation: fwd,
    repeat: 3
  )
  .lighting(
    normalStrength: 5,
    diffuseColor: #e78934,
    specularColor: #4e44ec,
    specularIntensity: 1.36,
    shininess: 84,
    ambientColor: #3645a0,
    lightDirection: vec3(0.272, 0.4, 0.875),
    reflection: 17.4,
    refraction: 5.1,
    aberration: 11.678,
    heightMap: read(o1)
  )
  .sharpen(amount: 2.48)
  .smooth(type: smaa)
  .focusBlur(
    tex: read(o1),
    focalDistance: 44.6,
    aperture: 1,
    sampleBias: 18.65
  )
  .subchain(name: "lens effects", id: "4ahh") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.45,
      intensity: 0.7,
      radius: 23,
      taps: 34
    )
    .lens(displacement: -1)
    .vignette()
    .vaseline(alpha: 0.65)
  }
  .grain(alpha: 0.09)
  .grade(preset: sunset, alpha: 0.82)
  .adjust(
    saturation: 0.97,
    brightness: 0.95,
    contrast: 0.59
  )
  .write(o2)

render(o2)