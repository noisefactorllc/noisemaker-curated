search synth, filter, mixer, render, points

gabor(
  scale: 93.35,
  orientation: -72.4,
  bandwidth: 47.67,
  isotropy: 58.66,
  density: 1,
  octaves: 3,
  speed: 3,
  seed: 31
)
  .tetraCosine(
    colorMode: hsv,
    offsetR: 0.018,
    offsetG: 0.028,
    offsetB: 0.699,
    ampR: 0.601,
    ampG: 0.167,
    ampB: 0.616,
    freqR: 4,
    freqB: 0,
    phaseR: 0.227,
    phaseG: 0.412,
    phaseB: 0.427,
    rotation: back,
    repeat: 2,
    offset: 0.69,
    alpha: 0.652
  )
  .warp(
    strength: 8.76,
    scale: 2.05,
    speed: 3
  )
  .subchain(name: "flow field particles", id: "40mu") {
    .pointsEmit(stateSize: x64, attrition: 0.1)
    .flow(
      behavior: chaotic,
      stride: 114,
      strideDeviation: 0.5,
      kink: 4.1
    )
    .pointsBillboardRender(
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 33.23,
      sizeVariation: 100,
      rotationVar: 100,
      seed: 0,
      density: 1,
      intensity: 73.2,
      inputIntensity: 100
    )
  }
  .feedback(
    blendMode: lighten,
    mix: 40.75,
    intensity: -38.13
  )
  .write(o0)

read(o0)
  .lighting(
    normalStrength: 3.46,
    smoothing: 3.4,
    specularIntensity: 1.18,
    shininess: 133,
    lightDirection: vec3(0.439, -0.428, 0.79),
    reflection: 34.5,
    refraction: 57.9,
    aberration: 53.1
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 34.82,
    aperture: 1.34,
    sampleBias: 64
  )
  .subchain(name: "lens effects", id: "1kos") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.23, alpha: 0.66)
  }
  .adjust(brightness: 1.33, contrast: 0.86)
  .write(o2)

render(o2)