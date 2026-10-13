search synth, filter, mixer, render, points

let osc1 = osc(type: oscKind.sawInv)

cell(
  scale: 71.02,
  cellScale: 100,
  cellSmooth: 71.07,
  variation: 100,
  speed: 5,
  seed: 15
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
    offset: osc1
  )
  .invert()
  .write(o0)

read(o0)
  .lighting(
    normalStrength: 5,
    smoothing: 10,
    specularIntensity: 0.83,
    shininess: 133,
    reflection: 14.8,
    refraction: 41,
    aberration: 64.6
  )
  .focusBlur(
    tex: read(o0),
    aperture: 1.85,
    sampleBias: 58.75
  )
  .feedback(
    blendMode: lighten,
    mix: 58.57,
    intensity: -9.27
  )
  .subchain(name: "lens effects", id: "1kos") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.12, alpha: 0.66)
  }
  .adjust(
    mode: oklab,
    rotation: -19.8,
    saturation: 0.84,
    brightness: 1.36,
    contrast: 0.71
  )
  .write(o2)

render(o2)