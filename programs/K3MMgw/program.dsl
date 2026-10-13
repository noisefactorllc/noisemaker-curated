search synth, filter, synth3d, render, points, mixer

let osc1 = osc(type: oscKind.saw)

cell(
  shape: triangle,
  scale: 81.67,
  cellScale: 100,
  speed: 5
)
  .write(o0)

perlin(
  scale: 57.13,
  colorMode: mono,
  speed: 3
)
  .palette(
    index: vibrant,
    rotation: back,
    offset: 94.412,
    repeat: 2,
    alpha: 0.536
  )
  .write(o2)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  heightScale: 0.5,
  baseHeight: 0.08
)
  .renderLandscape3d(
    zoom: 2.43,
    ambient: 0.16,
    diffuseIntensity: 1.02,
    specularIntensity: 0.2,
    bgColor: #000000,
    viewMode: perspective,
    rotateX: 1.47,
    rotateZ: osc1,
    posZ: 83.2,
    fieldOfView: 114
  )
  .sobel(amount: 1.96)
  .subchain(name: "lens effects", id: "m56y") {
    .temporalAberration()
    .bloom(
      threshold: 0.15,
      softKnee: 0.18,
      intensity: 1.55,
      taps: 15
    )
    .lens(displacement: -0.61, aspectLens: false)
    .vaseline()
  }
  .write(o1)

render(o1)