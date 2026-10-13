search synth, filter, render, mixer

perlin(
  scale: 21.39,
  dimensions: 3,
  ridges: true,
  speed: 2
)
  .adjust(
    mode: hsv,
    rotation: 141.85,
    hueRange: 34.38
  )
  .subchain(name: "feedback loop with warp", id: "rp9q") {
    .loopBegin(alpha: 95.49)
    .warp(
      strength: 1.29,
      scale: 1.7,
      speed: 2
    )
    .feedback(
      blendMode: lighten,
      mix: 60.63,
      refractBAmt: 1.35,
      refractBDir: 170.14,
      intensity: -7.02
    )
    .loopEnd()
  }
  .write(o0)

navierStokes(
  tex: read(o0),
  zoom: x2,
  iterations: 40,
  speed: 73.4,
  dyeDecay: 98.34,
  inputForce: 0.94,
  inputDye: 1,
  inputIntensity: 0
)
  .blendMode(
    tex: read(o0),
    mode: lighten,
    mix: -0.46
  )
  .lighting(
    normalStrength: 5,
    smoothing: 2.5,
    specularIntensity: 1.35,
    shininess: 81,
    reflection: 26.5,
    refraction: 37.6,
    aberration: 31.4
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 28.5,
    aperture: 1.12,
    sampleBias: 64
  )
  .adjust(
    rotation: -24.45,
    saturation: 0.87,
    brightness: 0.98,
    contrast: 0.7
  )
  .write(o1)

render(o1)