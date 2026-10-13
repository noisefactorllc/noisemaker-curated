search synth, filter, synth3d, render, points, mixer

let zRotation = osc(type: oscKind.saw)
let noiseScale = osc(type: oscKind.sine, min: 0.45, max: 0.84, speed: 2)
let zPosition = osc(type: oscKind.noise, min: 0.57, max: 0.78, seed: 2995)
let offsetX = osc(type: oscKind.noise, min: 0.31, max: 0.62, seed: 7785)
let offsetY = osc(type: oscKind.noise, min: 0.5, max: 0.63, seed: 5611)

cell(
  shape: triangle,
  scale: noiseScale,
  cellScale: 100,
  variation: 0,
  speed: 5,
  seed: 46
)
  .write(o0)

perlin(
  scale: 100,
  colorMode: mono,
  dimensions: 3,
  ridges: true,
  speed: 2
)
  .palette(
    index: eventHorizon,
    rotation: back,
    offset: 83.098,
    repeat: 3,
    alpha: 0.66
  )
  .write(o2)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 0.5,
  baseHeight: 0.08
)
  .renderLandscape3d(
    zoom: zPosition,
    ambient: 0.37,
    diffuseIntensity: 1.2,
    specularIntensity: 0.2,
    bgColor: #000000,
    viewMode: perspective,
    rotateX: 1.47,
    rotateZ: zRotation,
    posX: offsetX,
    posY: offsetY,
    posZ: zPosition,
    fieldOfView: 94
  )
  .edge(
    kernel: fine,
    size: kernel7x7,
    channel: luminance,
    amount: 17.89,
    mix: 84.15
  )
  .wobble()
  .subchain(name: "lens effects", id: "m56y") {
    .temporalAberration()
    .bloom(
      threshold: 0.15,
      softKnee: 0.18,
      intensity: 1.55,
      taps: 15
    )
    .lens(displacement: -1)
    .vaseline()
  }
  .write(o1)

render(o1)