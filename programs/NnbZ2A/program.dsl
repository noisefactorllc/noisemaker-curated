search synth, filter, render, points, mixer

perlin(
  scale: 67.93,
  octaves: 5,
  dimensions: 3,
  seed: 47
)
  .adjust(
    hueRange: 200,
    saturation: 0.62,
    brightness: 1.06
  )
  .palette(
    index: tungsten,
    offset: 100,
    repeat: 8,
    alpha: 0.67
  )
  .subchain(name: "physarum particles", id: "9msz") {
    .pointsEmit()
    .physarum(
      moveSpeed: 0.87,
      turnSpeed: 0.64,
      sensorAngle: 0.49,
      sensorDistance: 0.017,
      inputWeight: 50,
      deposit: 0.39,
      decay: 0.22
    )
    .pointsRender(intensity: 88.47, inputIntensity: 10.7)
    .pointsBillboardRender(
      depositOpacity: 80.36,
      pointSize: 25.23,
      density: 0,
      inputIntensity: 100
    )
  }
  .blur()
  .write(o1)

navierStokes(
  tex: read(o1),
  iterations: 40,
  speed: 138.1,
  dyeDecay: 99.53,
  inputForce: 0.76,
  inputIntensity: 8.08
)
  .blendMode(
    tex: read(o1),
    mode: diff,
    mix: -7.73
  )
  .lighting(
    normalStrength: 5,
    smoothing: 3.6,
    reflection: 18,
    refraction: 20.6,
    aberration: 12.1
  )
  .adjust(brightness: 1.39, contrast: 0.49)
  .write(o0)

render(o0)