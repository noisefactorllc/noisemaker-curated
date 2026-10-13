search synth, filter, mixer, classicNoisedeck, render, points

let osc1 = osc(type: oscKind.sawInv)

noise(
  type: catmullRom3x3,
  scaleX: 1,
  scaleY: 54.65,
  ridges: true,
  loopScale: 100,
  speed: 34
)
  .translate(y: osc1)
  .write(o0)

navierStokes(
  tex: read(o0),
  iterations: 40,
  speed: 145,
  dyeDecay: 98.52,
  inputForce: 0.49,
  inputDye: 1,
  inputIntensity: 0
)
  .write(o1)

read(o1)
  .palette(
    index: sherbet,
    rotation: fwd,
    offset: 10,
    repeat: 10,
    alpha: 0.81
  )
  .coalesce(
    tex: read(o0),
    blendMode: softLight,
    mix: 7.73,
    refractBAmt: 26.61
  )
  .sharpen()
  .lighting(
    normalStrength: 5,
    smoothing: 3.1,
    specularIntensity: 0.87,
    shininess: 72,
    reflection: 15.1,
    refraction: 14.1,
    aberration: 26.6,
    heightMap: read(o1)
  )
  .subchain(name: "lens effects", id: "pn80") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.85,
      intensity: 0.6,
      taps: 15
    )
    .lens(displacement: -0.2)
    .vignette(brightness: 0.39, alpha: 0.25)
  }
  .vaseline(alpha: 0.68)
  .write(o2)

render(o2)