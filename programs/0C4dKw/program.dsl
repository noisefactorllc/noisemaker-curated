search synth, filter, synth3d, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.saw)
let osc2 = osc(type: oscKind.noise, seed: 3310)
let osc3 = osc(type: oscKind.noise)
let osc4 = osc(type: oscKind.noise, seed: 2104)
let osc5 = osc(type: oscKind.noise, seed: 7169)
let osc6 = osc(type: oscKind.noise, seed: 8125)
let osc7 = osc(type: oscKind.sine, min: 0.07, max: 0.39)
let osc8 = osc(type: oscKind.sawInv)

perlin(scale: 26.15, speed: 5)
  .kaleido(
    sides: 20,
    metric: triangle,
    loopOffset: triangle,
    loopScale: 100,
    speed: -100,
    seed: 99,
    direction: counterclock,
    kernel: outline,
    effectWidth: 3.347
  )
  .write(o0)

read(o0)
  .palette(index: grayscale, repeat: 2)
  .write(o2)

solid(color: #000000)
  .subchain(name: "flow field particles", id: "myse") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      gridScale: 100,
      heightScale: 74.7,
      heightOffset: -49.4
    )
    .pointsRender(
      density: 100,
      intensity: 66.62,
      viewMode: perspective,
      rotateX: osc7,
      rotateZ: osc8,
      viewScale: 1.43
    )
    .pointsBillboardRender(
      shapeMode: square,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 10.05,
      sizeVariation: 100,
      density: 1.98,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: osc7,
      rotateZ: osc8,
      viewScale: 1.43,
      aperture: 3.2,
      focalDistance: 255
    )
  }
  .write(o3)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 0.67
)
  .renderLandscape3d(
    zoom: 2,
    bgColor: #000000,
    viewMode: perspective,
    rotateX: osc7,
    rotateZ: osc8
  )
  .split(
    tex: read(o3),
    invert: on,
    rotation: osc8,
    softness: 1,
    speed: 2
  )
  .subchain(name: "lens effects", id: "7efo") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(taps: 15)
    .lens(displacement: -0.46, aspectLens: false)
    .vignette(alpha: 0.69)
  }
  .write(o1)

render(o1)