search synth, filter, render, points, mixer

perlin(
  scale: 62.13,
  colorMode: mono,
  ridges: true,
  seed: 36,
  speed: 2
)
  .subchain(name: "flow field particles", id: "lkjw") {
    .pointsEmit(stateSize: x64, attrition: 0.15)
    .flock(
      separation: 4.3,
      alignment: 1.5,
      cohesion: 1.4,
      perceptionRadius: 145,
      separationRadius: 62,
      maxSpeed: 10,
      maxForce: 1,
      noiseWeight: 0.47
    )
    .life(
      typeCount: 8,
      attractionScale: 0.9,
      repulsionScale: 5,
      minRadius: 0.027,
      maxRadius: 0.18,
      maxSpeed: 0.01,
      friction: 1
    )
    .pointsRender(
      density: 17.6,
      intensity: 85.92,
      inputIntensity: 22.17
    )
    .pointsBillboardRender(
      shapeMode: square,
      depositOpacity: 71.16,
      pointSize: 40.95,
      sizeVariation: 100,
      rotationVar: 100,
      seed: 0,
      density: 0,
      intensity: 13.82,
      inputIntensity: 100
    )
  }
  .blur()
  .write(o0)

navierStokes(
  tex: read(o0),
  zoom: x4,
  iterations: 40,
  smoothing: bSpline4x4,
  speed: 68.41,
  dyeDecay: 97.52,
  velocityDecay: 100,
  inputForce: 0.32,
  inputDye: 1,
  inputIntensity: 4.23
)
  .palette(
    index: eventHorizon,
    offset: 82,
    repeat: 6,
    alpha: 0.64
  )
  .lighting(
    normalStrength: 4.04,
    smoothing: 4.3,
    specularIntensity: 0.71,
    shininess: 130,
    reflection: 21.8,
    refraction: 23,
    aberration: 18.4
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 15.35,
    aperture: 2.62,
    sampleBias: 33.51
  )
  .adjust(brightness: 1.9, contrast: 0.8)
  .grain(alpha: 0.18)
  .subchain(name: "lens effects", id: "dpxp") {
    .temporalAberration(
      redDelay: 4,
      greenDelay: 2,
      blueDelay: 0
    )
    .bloom(taps: 15)
    .lens(displacement: -0.52)
    .vignette(brightness: 0.44, alpha: 0.67)
  }
  .write(o1)

render(o1)