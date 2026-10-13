search synth, filter, synth3d, render, points, mixer

let osc1 = osc(type: oscKind.noise, max: 0.15, speed: 2, seed: 8659)
let osc2 = osc(type: oscKind.noise, min: 0.29, max: 0.75, seed: 1342)
let osc3 = osc(type: oscKind.noise, min: 0.27, max: 0.72, seed: 7366)
let osc4 = osc(type: oscKind.noise, min: 0.26, max: 0.79, seed: 3287)
let osc5 = osc(type: oscKind.noise, min: 0.29, max: 0.8, seed: 3188)
let osc6 = osc(type: oscKind.noise, min: 0.21, max: 0.86, seed: 6278)
let osc7 = osc(type: oscKind.sine)
let osc8 = osc(type: oscKind.sine, min: 0.84)

subdivide(
  tex: read(o2),
  fill: arc,
  speed: 19
)
  .tile(
    symmetry: rotate6,
    scale: 4,
    offsetX: osc6,
    offsetY: osc5,
    angle: osc1,
    repeat: 1
  )
  .write(o0)

read(o0)
  .palette(index: santaCruz)
  .write(o2)

solid(color: #000000)
  .subchain(name: "flow field particles", id: "uvdh") {
    .pointsEmit(stateSize: x64)
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      gridScale: 100,
      heightScale: -35
    )
    .pointsRender(
      density: 100,
      intensity: 84.12,
      viewMode: perspective,
      rotateX: 1.56,
      rotateY: osc8,
      rotateZ: osc7,
      viewScale: 1
    )
  }
  .write(o3)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 1
)
  .renderLandscape3d(
    zoom: 0.95,
    bgColor: #35001a,
    viewMode: perspective,
    rotateX: 1.56,
    rotateY: osc8,
    rotateZ: osc7
  )
  .rotate(speed: 2)
  .sobel(alpha: 0.44)
  .split(
    tex: read(o3),
    rotation: osc8,
    softness: 1
  )
  .subchain(name: "lens effects", id: "7efo") {
    .temporalAberration(
      redDelay: 4,
      greenDelay: 2,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.3,
      intensity: 2.65,
      taps: 15
    )
    .lens(displacement: -1, aspectLens: false)
    .vignette(brightness: 0.58, alpha: 0.44)
  }
  .write(o1)

render(o1)