search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, min: 0.15, max: 0.36, seed: 3591)
let osc2 = osc(type: oscKind.sawInv, seed: 4518)
let osc3 = osc(type: oscKind.noise, min: 0.63, max: 0.65, seed: 7333)
let osc4 = osc(type: oscKind.sine, min: 0.9, speed: 2)
let osc5 = osc(type: oscKind.sine, min: 0.05, max: 0.45, speed: 2)

perlin(
  scale: 43.06,
  octaves: 2,
  colorMode: mono,
  dimensions: 3,
  ridges: true,
  seed: 50,
  speed: 2
)
  .subchain(name: "flow field particles", id: "2n58") {
    .pointsEmit(stateSize: x128, attrition: 0.25)
    .flow(
      behavior: unruly,
      stride: 50,
      strideDeviation: 0.5,
      kink: 2
    )
    .pointsBillboardRender(
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 9.77,
      sizeVariation: 100,
      density: 100,
      intensity: osc4
    )
  }
  .write(o0)

read(o0)
  .palette(
    index: neptune,
    rotation: back,
    offset: 100,
    repeat: 3,
    alpha: 0.42
  )
  .write(o2)

solid(color: #000000ff)
  .subchain(name: "flow field particles", id: "n1fi") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      gridScale: osc5,
      heightScale: 25
    )
    .pointsBillboardRender(
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 2.35,
      sizeVariation: 100,
      density: 100,
      intensity: 76.97,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: osc1,
      rotateZ: osc2,
      viewScale: 1.51,
      posZ: osc3,
      fieldOfView: 120,
      sizeDistance: 57,
      brightnessDistance: 28,
      aperture: 11,
      focalDistance: 5
    )
  }
  .subchain(name: "lens effects", id: "wsjm") {
    .temporalAberration(greenDelay: 1, blueDelay: 2)
    .bloom(
      threshold: 0.5,
      intensity: 1.05,
      radius: 64,
      taps: 45,
      tint: #81c3ffff
    )
    .lens(displacement: -0.54, aspectLens: false)
    .vignette(brightness: 0.43, alpha: 0.46)
  }
  .write(o1)

render(o1)