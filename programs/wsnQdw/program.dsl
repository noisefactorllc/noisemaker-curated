search synth, filter, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.noise, min: 0.21, max: 0.48)
let osc2 = osc(type: oscKind.sine)
let osc3 = osc(type: oscKind.noise, min: 0.3, max: 0.58, seed: 6654)
let osc4 = osc(type: oscKind.sine, max: 0.28, speed: 3)
let osc5 = osc(type: oscKind.sawInv)

perlin(colorMode: mono, speed: 5)
  .kaleido(
    sides: 32,
    loopScale: 13.77,
    speed: 100
  )
  .write(o0)

read(o0)
  .palette(
    index: santaCruz,
    rotation: fwd,
    offset: 100,
    alpha: 0.46
  )
  .write(o1)

solid(color: #000000ff)
  .subchain(name: "flow field particles", id: "ad6y") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o1),
      gridScale: 400,
      heightScale: osc2
    )
    .pointsBillboardRender(
      shapeMode: square,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 44.95,
      sizeVariation: 100,
      rotationVar: 100,
      seed: 0,
      density: 65.1,
      intensity: 0,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: osc1,
      rotateZ: osc5,
      viewScale: 0.77,
      posX: osc3,
      posY: -7.8,
      posZ: -14.4,
      fieldOfView: 120,
      focalDistance: 1
    )
  }
  .subchain(name: "lens effects", id: "g4l0") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.7,
      intensity: 1.8,
      taps: 15
    )
    .lens(displacement: -1)
    .vignette(brightness: 0.19, alpha: 0.72)
  }
  .crt(alpha: 0.28)
  .write(o2)

render(o2)