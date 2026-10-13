search synth, filter, mixer, classicNoisedeck, render, points

let osc1 = osc(type: oscKind.sine, max: 0.45)
let osc2 = osc(type: oscKind.sine, max: 0.35)
let osc3 = osc(type: oscKind.noise, max: 0.21)

from(classicNoisedeck, noise(
  type: linear,
  xScale: 100,
  yScale: 100,
  ridges: true,
  seed: 81,
  refractAmt: 31.42,
  loopScale: 100,
  speed: 100,
  colorMode: oklab
))
  .translate()
  .write(o0)

navierStokes(
  tex: read(o0),
  iterations: 40,
  speed: 145,
  dyeDecay: 98.52,
  inputForce: 1,
  inputDye: 1,
  inputIntensity: 0
)
  .write(o1)

read(o1)
  .palette(
    index: sherbet,
    rotation: fwd,
    offset: 50,
    alpha: 0.53
  )
  .subchain(name: "particle life", id: "3t1l") {
    .pointsEmit(attrition: 1.07)
    .flock()
    .pointsBillboardRender(
      shapeMode: soft,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 15.88,
      sizeVariation: 100,
      rotationVar: 100,
      density: 0.34,
      intensity: 83.87,
      inputIntensity: 40.83
    )
  }
  .coalesce(
    tex: read(o0),
    blendMode: overlay,
    mix: -3.52,
    refractAAmt: 7.01
  )
  .sharpen(amount: 5)
  .lighting(
    normalStrength: 5,
    smoothing: 1.9,
    specularIntensity: 0.87,
    shininess: 87,
    reflection: 23.7,
    refraction: 22.3,
    aberration: 46.4,
    heightMap: read(o1)
  )
  .focusBlur(
    tex: read(o1),
    focalDistance: 29.06,
    aperture: 1.56,
    sampleBias: 16.57
  )
  .parallax(heightMap: read(o1), direction: vec3(-0.653, -0.757, 0))
  .seamless(repeat: 1)
  .translate(x: osc1, y: osc3)
  .rotate(rotation: osc2)
  .subchain(name: "lens effects", id: "pn80") {
    .temporalAberration(
      redDelay: 4,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.2,
      softKnee: 0.11,
      intensity: 0.9,
      radius: 34,
      taps: 39
    )
    .lens(displacement: -0.2)
    .vignette(brightness: 0.25, alpha: 0.25)
  }
  .adjust(
    saturation: 0.77,
    brightness: 0.96,
    contrast: 0.58
  )
  .vaseline(alpha: 0.73)
  .write(o2)

render(o2)