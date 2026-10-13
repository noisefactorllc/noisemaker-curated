search synth, filter, render, points, mixer, synth3d

let osc1 = osc(type: oscKind.noise, min: 0.69, max: 0.72)
let osc2 = osc(type: oscKind.noise, max: 0.13)

perlin(
  scale: 9.51,
  octaves: 3,
  colorMode: mono,
  seed: 70,
  speed: 5
)
  .write(o0)

perlin(
  scale: 13.05,
  colorMode: mono,
  speed: 5
)
  .palette(
    index: mars,
    rotation: back,
    offset: 41.51,
    alpha: 0.669
  )
  .write(o2)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 0.17,
  baseHeight: 0.42
)
  .renderLandscape3d(
    viewMode: perspective,
    rotateX: 1,
    rotateY: osc2,
    rotateZ: osc2,
    posY: -10,
    posZ: osc1,
    fieldOfView: 96
  )
  .write(o3)

solid(color: #000000ff)
  .subchain(name: "strange attractor particles", id: "9xcv") {
    .pointsEmit(stateSize: x128)
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      heightOffset: -11.1
    )
    .pointsBillboardRender(
      shapeMode: square,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 9.05,
      sizeVariation: 100,
      rotationVar: 100,
      density: 100,
      intensity: 92.19,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: 1,
      rotateY: osc2,
      rotateZ: osc2,
      viewScale: 0.75,
      posY: -10,
      posZ: osc1,
      fieldOfView: 96,
      sizeDistance: 116,
      brightnessDistance: 45,
      aperture: 1.1,
      focalDistance: 22
    )
  }
  .split(
    tex: read(o3),
    invert: on,
    rotation: -131.76,
    softness: 1,
    speed: 4
  )
  .subchain(name: "lens effects", id: "6uyj") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vaseline()
  }
  .write(o1)

render(o1)