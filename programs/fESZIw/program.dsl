search synth, filter, mixer, classicNoisedeck, render, points

let osc1 = osc(type: oscKind.noise)
let osc2 = osc(type: oscKind.noise, seed: 343)
let osc3 = osc(type: oscKind.noise, seed: 3)

subdivide(
  density: 79.504,
  seed: 46,
  fill: mixed,
  outline: 2.11,
  inputMix: 4.555
)
  .translate(x: osc1, y: osc2)
  .rotate(rotation: osc3, speed: 4)
  .warp(
    strength: 25.93,
    scale: 0.27,
    seed: 48,
    speed: 3,
    wrap: repeat
  )
  .adjust(mode: oklch, contrast: 1)
  .write(o0)

read(o0)
  .palette(
    index: columbia,
    rotation: fwd,
    offset: 67,
    repeat: 2,
    alpha: 0.67
  )
  .lighting(
    normalStrength: 2.98,
    smoothing: 2.7,
    specularIntensity: 1.75,
    shininess: 83,
    lightDirection: vec3(0.372, 0.422, 0.827),
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
  .parallax(heightMap: read(o0), direction: vec3(0.272, -0.322, 0.907))
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