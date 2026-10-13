search synth, filter, mixer, classicNoisedeck, render, points

let osc1 = osc(type: oscKind.noise, max: 0.14)
let osc2 = osc(type: oscKind.noise, max: 0.14, seed: 343)
let osc3 = osc(type: oscKind.noise, max: 0.1, seed: 3)

mnca(
  tex: read(o2),
  zoom: x16,
  speed: 76.31,
  weight: 69,
  n1v1: 42.398,
  n1r1: 99.708,
  n1v2: 47.918,
  n1r2: 71.202,
  n1v3: 58.1,
  n1r3: 63.91,
  n1v4: 29.104,
  n1r4: 6.22,
  n2v1: 61.204,
  n2r1: 86.629,
  n2v2: 88.555,
  n2r2: 74.603
)
  .seamless(blend: 0.13, repeat: 1)
  .translate(x: osc1, y: osc2)
  .rotate(rotation: osc3)
  .warp(
    strength: 3.33,
    scale: 0.72,
    seed: 48,
    speed: 3,
    wrap: repeat,
    _skip: true
  )
  .adjust(
    rotation: 26.62,
    hueRange: 86.73,
    contrast: 1
  )
  .write(o0)

read(o0)
  .palette(
    index: sherbet,
    rotation: fwd,
    alpha: 0.85
  )
  .lighting(
    normalStrength: 2.98,
    smoothing: 2.7,
    specularIntensity: 1.75,
    shininess: 83,
    lightDirection: vec3(-0.383, 0.333, 0.861),
    reflection: 16.8,
    refraction: 13.7,
    aberration: 36.6,
    heightMap: read(o0)
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 44.36,
    aperture: 2.35,
    sampleBias: 22.81
  )
  .parallax(heightMap: read(o0), direction: vec3(0.506, -0.422, 0.752))
  .subchain(name: "lens effects", id: "xrrm") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 1.05,
      softKnee: 0.15,
      intensity: 0.85,
      radius: 26,
      taps: 25
    )
    .lens(displacement: -0.44)
    .vignette(brightness: 0.24, alpha: 0.69)
  }
  .write(o1)

perlin(
  scale: 44.59,
  octaves: 3,
  dimensions: 3,
  ridges: true,
  speed: 5
)
  .write(o2)

render(o1)