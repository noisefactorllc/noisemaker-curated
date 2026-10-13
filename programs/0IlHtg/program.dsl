search synth, filter, synth3d, render, points, mixer

let posX = osc(type: oscKind.noise, min: 0.47, max: 0.53, seed: 1997)
let posZ = osc(type: oscKind.noise, min: 0.47, max: 0.53)
let rotY = osc(type: oscKind.noise, min: 0.49, max: 0.64, seed: 7877)
let wobbleRot = osc(type: oscKind.noise, min: 0.46, max: 0.56, speed: 2, seed: 8236)
let height = osc(type: oscKind.noise, seed: 5487)

cell(
  shape: square,
  scale: 31.65,
  cellScale: 65.23,
  speed: 5,
  seed: 26
)
  .write(o0)

cell(
  shape: square,
  scale: 22.38,
  speed: 4
)
  .palette(
    index: toxic,
    offset: 11,
    alpha: 0.62
  )
  .write(o1)

heightmap3d(
  heightTex: read(o0),
  tex: read(o1),
  volumeSize: x128,
  heightScale: height
)
  .renderLandscape3d(
    zoom: 2.72,
    panX: -0.04,
    panY: 0.06,
    ambient: 0.49,
    diffuseIntensity: 0.8,
    specularIntensity: 0.22,
    viewMode: perspective,
    rotateX: 4.43,
    rotateY: rotY,
    rotateZ: 2.56,
    posX: posX,
    posY: 11.8,
    posZ: posZ
  )
  .edge(
    kernel: fine,
    channel: luminance,
    amount: 97.24,
    threshold: 67.23,
    blend: multiply,
    mix: 70.08
  )
  .wobble(wrap: clamp)
  .rotate(
    rotation: wobbleRot,
    wrap: mirror,
    speed: 1
  )
  .subchain(name: "lens effects", id: "yq5n") {
    .temporalAberration(
      redDelay: 3.7,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(
      threshold: 1,
      softKnee: 0.09,
      intensity: 0.7,
      radius: 55,
      taps: 38
    )
    .lens(displacement: -1)
    .vaseline(alpha: 0.25)
  }
  .write(o2)

render(o2)