search synth, filter, user, classicNoisedeck, render, points, mixer

let osc1 = osc(type: oscKind.noise, max: 0.42)
let osc2 = osc(type: oscKind.noise, max: 0.42, seed: 3711)
let osc3 = osc(type: oscKind.noise, max: 0.39, seed: 4943)

from(classicNoisedeck, noise(
  type: constant,
  octaves: 3,
  xScale: 100,
  yScale: 100,
  ridges: true,
  refractAmt: 20.62,
  loopScale: 36.15,
  speed: 100,
  hueRotation: 161.11,
  hueRange: 30.19,
  colorMode: mono
))
  .translate(x: osc1, y: osc2)
  .rotate(rotation: osc3, speed: -1)
  .smooth(
    type: blur,
    strength: 0.87,
    threshold: 0.26,
    radius: 1.4
  )
  .parallax(direction: vec3(-0.734, -0.679, 0), pivot: 0.78)
  .write(o0)

read(o0)
  .palette(
    index: darkSatin,
    offset: 40,
    alpha: 0.68
  )
  .celShading(
    levels: 8,
    antialias: true,
    edgeThreshold: 0.01,
    edgeColor: #000333ff,
    _skip: true
  )
  .lighting(
    normalStrength: 5,
    specularIntensity: 1.46,
    shininess: 40,
    reflection: 15,
    refraction: 15,
    aberration: 18.1,
    heightMap: read(o0)
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 83.29,
    aperture: 1.55,
    sampleBias: 18.43
  )
  .subchain(name: "lens effects", id: "vlqd") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.2)
  }
  .write(o2)

render(o2)