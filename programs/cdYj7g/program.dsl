search synth, filter, render, points, mixer

perlin(
  scale: 46.61,
  octaves: 2,
  dimensions: 3,
  ridges: true,
  seed: 36,
  speed: 2
)
  .subchain(name: "flow field particles", id: "lkjw") {
    .pointsEmit()
    .flock(
      alignment: 2.5,
      cohesion: 1.6,
      perceptionRadius: 45,
      separationRadius: 47,
      maxSpeed: 10,
      maxForce: 1,
      noiseWeight: 0.47
    )
    .life(
      typeCount: 8,
      attractionScale: 1.2,
      repulsionScale: 5,
      minRadius: 0.027,
      maxRadius: 0.16,
      maxSpeed: 0.004,
      friction: 0.82
    )
    .flow(
      behavior: unruly,
      stride: 1,
      strideDeviation: 0.35
    )
    .pointsRender(
      density: 35.38,
      intensity: 76.84,
      inputIntensity: 56.75
    )
    .pointsBillboardRender(
      shapeMode: soft,
      depositOpacity: 91.31,
      pointSize: 24.13,
      sizeVariation: 100,
      seed: 0,
      density: 0.2,
      intensity: 85.12,
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
  speed: 138.66,
  dyeDecay: 99.2,
  velocityDecay: 100,
  inputForce: 0.94,
  inputDye: 1,
  inputIntensity: 7.45
)
  .palette(
    index: afterimage,
    offset: 100,
    repeat: 2,
    alpha: 0.64
  )
  .lighting(
    normalStrength: 5,
    smoothing: 1.8,
    specularIntensity: 0.7,
    shininess: 130,
    reflection: 21.8,
    refraction: 23,
    aberration: 18.4
  )
  .adjust()
  .grain(alpha: 0.09)
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
  .adjust(
    rotation: -74.85,
    brightness: 0.85,
    contrast: 0.62
  )
  .write(o1)

render(o1)