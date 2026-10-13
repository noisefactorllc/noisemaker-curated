search synth, filter, mixer, render, points

let osc1 = osc(type: oscKind.saw)

cell(
  shape: diamond,
  scale: 81.26,
  cellScale: 100,
  cellSmooth: 66.5,
  variation: 100,
  speed: 5,
  seed: 16
)
  .tetraCosine(
    colorMode: oklch,
    offsetR: 0.032,
    offsetG: 0.546,
    offsetB: 0.953,
    ampR: 0.708,
    ampG: 0.323,
    ampB: 0.509,
    freqR: 3,
    freqG: 4,
    freqB: 2,
    phaseR: 0.311,
    phaseG: 0.332,
    phaseB: 0.127,
    rotation: back,
    repeat: 1.04,
    offset: osc1
  )
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
    focalDistance: 27.87,
    aperture: 2.98,
    sampleBias: 64
  )
  .feedback(
    blendMode: lighten,
    mix: 73.9,
    intensity: -6.03
  )
  .subchain(name: "lens effects", id: "1kos") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.12, alpha: 0.66)
  }
  .adjust(brightness: 1.77, contrast: 0.75)
  .write(o2)

render(o2)