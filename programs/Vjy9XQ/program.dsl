search synth, filter, mixer, classicNoisedeck, render, points

let osc1 = osc(type: oscKind.noise)
let osc2 = osc(type: oscKind.noise, seed: 343)
let osc3 = osc(type: oscKind.sawInv)

from(classicNoisedeck, noise(
  type: constant,
  octaves: 4,
  xScale: 100,
  yScale: 100,
  ridges: true,
  refractMode: topology,
  refractAmt: 32.63,
  speed: 37.55,
  colorMode: mono
))
  .translate(x: osc1, y: osc2)
  .rotate(rotation: osc3)
  .warp(
    strength: 25.93,
    scale: 0.27,
    seed: 48,
    speed: 3,
    wrap: repeat
  )
  .adjust(mode: oklab, contrast: 1)
  .write(o0)

read(o0)
  .palette(
    index: ghostly,
    rotation: fwd,
    offset: 67,
    repeat: 2,
    alpha: 0.67
  )
  .lighting(
    normalStrength: 5,
    specularIntensity: 0.56,
    shininess: 76,
    lightDirection: vec3(-0.283, -0.444, 0.85),
    reflection: 16.8,
    refraction: 13.7,
    aberration: 36.6,
    heightMap: read(o0)
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 57.71,
    aperture: 1.28,
    sampleBias: 12.12
  )
  .parallax(heightMap: read(o0), direction: vec3(0.128, -0.567, 0.814))
  .subchain(name: "lens effects", id: "xrrm") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 1.05,
      softKnee: 0.15,
      intensity: 0.85,
      radius: 26,
      taps: 25
    )
    .lens(displacement: -0.82)
    .vignette()
  }
  .write(o1)

render(o1)