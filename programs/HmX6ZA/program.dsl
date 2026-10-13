search synth, filter, user, classicNoisedeck, render, points, mixer

let osc1 = osc(type: oscKind.noise)
let osc3 = osc(type: oscKind.noise, max: 0.39, seed: 4943)
let osc2 = osc(type: oscKind.sawInv, speed: 12.6)

bitwise(
  operation: nand,
  scale: 100,
  seed: 4,
  speed: 1,
  colorOffset: 59
)
  .palette(
    index: darkSatin,
    rotation: fwd,
    offset: osc2
  )
  .subchain(name: "flow field particles", id: "vyce") {
    .pointsEmit(attrition: 1.77)
    .flock(
      alignment: 5,
      cohesion: 3.2,
      perceptionRadius: 99,
      separationRadius: 5,
      maxSpeed: 3.8,
      maxForce: 0.34,
      noiseWeight: 0.27
    )
    .pointsBillboardRender(
      shapeMode: square,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 18.66,
      sizeVariation: 100,
      density: 13.86,
      intensity: 0,
      inputIntensity: 100
    )
  }
  .translate(y: osc1)
  .rotate(rotation: osc3, speed: -1)
  .smooth(
    type: blur,
    strength: 0.87,
    threshold: 0.26,
    radius: 1.4
  )
  .parallax(direction: vec3(-0.667, 0.611, 0.427), pivot: 0.78)
  .write(o0)

read(o0)
  .palette(
    index: darkSatin,
    offset: 34,
    alpha: 0.68
  )
  .lighting(
    normalStrength: 5,
    specularIntensity: 1.46,
    shininess: 40,
    lightDirection: vec3(-0.378, -0.567, 0.732),
    reflection: 15,
    refraction: 15,
    aberration: 18.1,
    heightMap: read(o0)
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 88.21,
    aperture: 1,
    sampleBias: 64
  )
  .subchain(name: "lens effects", id: "vlqd") {
    .temporalAberration(
      redDelay: 1,
      greenDelay: 2,
      blueDelay: 0
    )
    .bloom(threshold: 0.7, taps: 37)
    .lens(displacement: -0.67)
    .vignette(brightness: 0.21)
  }
  .adjust(
    rotation: 70.86,
    brightness: 1.06,
    contrast: 0.74
  )
  .write(o2)

render(o2)