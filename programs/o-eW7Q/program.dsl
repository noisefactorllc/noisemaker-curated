search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.noise, min: 0.2, max: 0.31, seed: 3591)
let osc2 = osc(type: oscKind.sawInv, seed: 4518)
let osc3 = osc(type: oscKind.sine, min: 0.64, max: 0.66)

perlin(
  scale: 15.53,
  colorMode: mono,
  dimensions: 3,
  seed: 50,
  speed: 2
)
  .subchain(name: "flow field particles", id: "2n58") {
    .pointsEmit(stateSize: x128, attrition: 0.25)
    .flow(
      stride: 42,
      strideDeviation: 0,
      quantize: true
    )
    .pointsBillboardRender(
      shapeMode: soft,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 14.19,
      density: 9.67,
      intensity: 96.61
    )
  }
  .write(o0)

read(o0)
  .palette(
    index: fiveG,
    rotation: back,
    offset: 100,
    alpha: 0.59
  )
  .write(o2)

solid(color: #000000ff)
  .subchain(name: "flow field particles", id: "n1fi") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      gridScale: 38
    )
    .pointsBillboardRender(
      shapeMode: soft,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 6.88,
      sizeVariation: 100,
      intensity: 13.2,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: osc1,
      rotateZ: osc2,
      viewScale: 1.51,
      posZ: osc3,
      fieldOfView: 120,
      sizeDistance: 30,
      brightnessDistance: 33
    )
  }
  .subchain(name: "lens effects", id: "wsjm") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.45,
      intensity: 0.65,
      radius: 64,
      taps: 45,
      tint: #81c3ffff
    )
    .lens(displacement: -0.54)
    .vignette(brightness: 0.23, alpha: 0.63)
  }
  .write(o1)

render(o1)