search synth, filter, render, points, mixer, classicNoisedeck

cell(
  shape: hexagon,
  scale: 73.67,
  cellScale: 100,
  cellSmooth: 64.61,
  speed: 2
)
  .adjust(hueRange: 200, contrast: 0.6)
  .palette(index: darkSatin, offset: 37)
  .write(o1)

navierStokes(
  tex: read(o1),
  iterations: 40,
  speed: 145,
  dyeDecay: 93.86,
  inputForce: 1,
  inputDye: 1,
  inputIntensity: 0
)
  .palette(
    index: mars,
    offset: 17,
    repeat: 3
  )
  .lighting(
    normalStrength: 4.42,
    smoothing: 5.5,
    diffuseColor: #ffc096,
    specularColor: #ffd798,
    specularIntensity: 1.63,
    lightDirection: vec3(-0.439, -0.494, 0.75),
    reflection: 34.6,
    refraction: 19.1,
    aberration: 44.4
  )
  .focusBlur(
    tex: read(o1),
    focalDistance: 92.59,
    aperture: 1.45,
    sampleBias: 64
  )
  .subchain(name: "lens effects", id: "sz43") {
    .temporalAberration()
    .bloom(
      threshold: 0.45,
      softKnee: 0.23,
      intensity: 0.6,
      taps: 33
    )
    .lens(displacement: -0.43)
    .vignette(alpha: 0.48)
  }
  .adjust(
    saturation: 0.57,
    brightness: 2.31,
    contrast: 0.63
  )
  .write(o0)

render(o0)