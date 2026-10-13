search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, min: 0.15, max: 0.36, seed: 3591)
let osc2 = osc(type: oscKind.sawInv, seed: 4518)
let osc3 = osc(type: oscKind.noise, min: 0.63, max: 0.65, seed: 7333)
let osc4 = osc(type: oscKind.sine, min: 0.9, speed: 2)

perlin(
  scale: 83.18,
  colorMode: mono,
  dimensions: 3,
  ridges: true,
  seed: 50,
  speed: 4
)
  .subchain(name: "flow field particles", id: "2n58") {
    .pointsEmit(stateSize: x128, attrition: 1)
    .flow(
      behavior: chaotic,
      stride: 36,
      strideDeviation: 0.5
    )
    .pointsBillboardRender(
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 5.34,
      sizeVariation: 100,
      density: 9.67,
      intensity: osc4
    )
  }
  .write(o0)

read(o0)
  .palette(
    index: hazySunset,
    rotation: back,
    offset: 100,
    repeat: 2
  )
  .write(o2)

solid(color: #000000ff)
  .subchain(name: "flow field particles", id: "n1fi") {
    .pointsEmit(stateSize: x512)
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      gridScale: 44
    )
    .pointsBillboardRender(
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 1,
      density: 100,
      intensity: 31.88,
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
      threshold: 0.45,
      intensity: 1.05,
      radius: 64,
      taps: 45,
      tint: #81c3ffff
    )
    .lens(displacement: -0.54)
    .vignette(brightness: 0.43, alpha: 0.46)
  }
  .write(o1)

render(o1)