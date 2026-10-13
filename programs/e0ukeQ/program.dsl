search synth, filter, synth3d, render, points, mixer

let osc1 = osc(type: oscKind.noise, max: 0.15, speed: 2, seed: 8659)
let osc2 = osc(type: oscKind.noise, min: 0.29, max: 0.75, seed: 1342)
let osc3 = osc(type: oscKind.noise, min: 0.27, max: 0.72, seed: 7366)
let osc4 = osc(type: oscKind.noise, min: 0.26, max: 0.79, seed: 3287)
let osc5 = osc(type: oscKind.noise, min: 0.29, max: 0.8, seed: 3188)
let osc6 = osc(type: oscKind.noise, min: 0.26, max: 0.77, seed: 6278)
let osc7 = osc(type: oscKind.noise, min: 0.42, max: 0.67, seed: 9999)
let osc8 = osc(type: oscKind.noise, min: 0.87, seed: 6954)

bitwise(
  operation: and,
  scale: 100,
  offsetY: 154,
  speed: 5
)
  .tile(
    symmetry: rotate6,
    scale: 0.4,
    offsetX: osc6,
    offsetY: osc5,
    angle: osc1,
    repeat: 1
  )
  .write(o0)

read(o0)
  .palette(index: darkSatin)
  .write(o2)

solid(color: #000000ff)
  .subchain(name: "flow field particles", id: "uvdh") {
    .pointsEmit(stateSize: x2048)
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      heightScale: 100,
      heightOffset: -75.6
    )
    .pointsRender(
      density: 100,
      intensity: 0,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: 1.5,
      rotateY: osc8,
      rotateZ: osc7,
      viewScale: 2.5,
      posZ: 25,
      fieldOfView: 90
    )
  }
  .write(o3)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 0.68
)
  .renderLandscape3d(
    zoom: 2.5,
    bgColor: #222222ff,
    viewMode: perspective,
    rotateX: 1.5,
    rotateY: osc8,
    rotateZ: osc7,
    posZ: 25,
    fieldOfView: 90
  )
  .sobel(amount: 0.59, alpha: 0.81)
  .blendMode(
    tex: read(o3),
    mode: lighten,
    mix: -68.88
  )
  .subchain(name: "lens effects", id: "7efo") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.95,
      intensity: 0.9,
      taps: 15
    )
    .lens(displacement: -1, aspectLens: false)
    .vignette(brightness: 0.58, alpha: 0.44)
  }
  .write(o1)

render(o1)