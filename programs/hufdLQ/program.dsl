search synth, filter, synth3d, render, points, mixer

let osc1 = osc(type: oscKind.saw)

cell(
  scale: 75.97,
  cellScale: 59.8,
  cellSmooth: 100,
  speed: 5
)
  .write(o0)

perlin(scale: 26.39, speed: 3)
  .write(o2)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 0.5,
  baseHeight: 0.08
)
  .renderLandscape3d(
    zoom: 0.66,
    ambient: 0.16,
    diffuseIntensity: 1.02,
    specularIntensity: 0.2,
    bgColor: #000000ff,
    bgAlpha: 0.51,
    viewMode: perspective,
    rotateX: 1.47,
    rotateZ: osc1,
    posZ: 83.2,
    fieldOfView: 114
  )
  .subchain(name: "lens effects", id: "m56y") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vaseline()
  }
  .write(o1)

render(o1)