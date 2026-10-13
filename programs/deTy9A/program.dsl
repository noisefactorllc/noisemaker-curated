search synth, filter, mixer, render, points

let osc1 = osc(type: oscKind.sine, min: 0.46, max: 0.61)
let osc2 = osc(type: oscKind.sine, max: 0.2)

perlin(
  scale: 17.23,
  octaves: 2,
  dimensions: 3,
  ridges: true,
  speed: 3
)
  .lowPoly(
    scale: 95,
    seed: 10,
    mode: distance2,
    edgeStrength: 0.69,
    alpha: 0.78,
    speed: 2
  )
  .texture(alpha: 0.51, scale: 8.6)
  .rotate(rotation: osc1)
  .parallax(direction: vec3(-0.886, 0.464, 0))
  .write(o0)

read(o0)
  .palette(index: jester, alpha: 0.76)
  .lighting(
    normalStrength: 5,
    smoothing: 1.9,
    specularIntensity: 0.34,
    shininess: 88,
    reflection: 26.1,
    refraction: 42.4,
    aberration: 26.6,
    heightMap: read(o0)
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 72.63,
    aperture: 1.68,
    sampleBias: 11.52
  )
  .subchain(name: "lens effects", id: "5yux") {
    .temporalAberration()
    .bloom(threshold: 0.65, taps: 29)
    .lens(displacement: -0.73)
    .vignette(brightness: 0.16, alpha: 0.84)
  }
  .adjust(
    rotation: osc2,
    saturation: 0.4,
    brightness: 1.15,
    contrast: 0.63
  )
  .write(o1)

render(o1)