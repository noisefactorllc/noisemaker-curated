search synth, filter, mixer, render, points

let osc1 = osc(type: oscKind.sawInv, speed: 4)

cell(
  scale: 91.22,
  cellScale: 100,
  cellSmooth: 66.5,
  variation: 100,
  speed: 5,
  seed: 53
)
  .tetraCosine(
    colorMode: oklch,
    offsetR: 0.695,
    offsetG: 0.144,
    offsetB: 0.948,
    ampR: 0.235,
    ampG: 0.103,
    ampB: 0.41,
    freqR: 4,
    freqG: 4,
    freqB: 4,
    phaseR: 0.87,
    phaseG: 0.941,
    phaseB: 0.74,
    rotation: fwd,
    repeat: 1.24,
    offset: osc1
  )
  .invert()
  .write(o0)

read(o0)
  .lighting(
    normalStrength: 5,
    smoothing: 3.7,
    specularIntensity: 1.18,
    shininess: 133,
    lightDirection: vec3(0.439, -0.428, 0.79),
    reflection: 34.5,
    refraction: 57.9,
    aberration: 53.1
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 43.28,
    aperture: 2.98,
    sampleBias: 64
  )
  .feedback(
    blendMode: lighten,
    mix: 72.71,
    intensity: -19.06
  )
  .subchain(name: "lens effects", id: "1kos") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.12, alpha: 0.66)
  }
  .adjust(
    rotation: -19.8,
    saturation: 0.84,
    brightness: 1.46,
    contrast: 0.69
  )
  .write(o2)

render(o2)