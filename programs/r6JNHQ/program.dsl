search synth, filter, render, points, mixer, classicNoisedeck

cell(
  shape: hexagon,
  scale: 28.48,
  cellScale: 100,
  cellSmooth: 82.93,
  variation: 100,
  speed: 5,
  seed: 62
)
  .palette(index: silvermane, offset: 49)
  .write(o1)

navierStokes(
  tex: read(o1),
  iterations: 40,
  speed: 145,
  dyeDecay: 93.86,
  inputForce: 1,
  inputDye: 1,
  inputIntensity: 4.11
)
  .palette(
    index: mars,
    offset: 24,
    repeat: 3
  )
  .lighting(
    normalStrength: 1.81,
    smoothing: 2.4,
    diffuseColor: #ffc096,
    specularColor: #ffd798,
    specularIntensity: 1.63,
    lightDirection: vec3(-0.439, -0.494, 0.75),
    reflection: 32.9,
    refraction: 48.1,
    aberration: 44.4
  )
  .focusBlur(
    tex: read(o1),
    focalDistance: 80.22,
    aperture: 1.35,
    sampleBias: 64
  )
  .subchain(name: "lens effects", id: "sz43") {
    .temporalAberration()
    .bloom(
      threshold: 0.35,
      softKnee: 0.23,
      intensity: 1.9,
      taps: 33
    )
    .lens(displacement: -0.43)
    .vignette(alpha: 0.48)
  }
  .adjust(
    rotation: -0.79,
    saturation: 0.57,
    brightness: 2.24,
    contrast: 0.67
  )
  .write(o0)

render(o0)