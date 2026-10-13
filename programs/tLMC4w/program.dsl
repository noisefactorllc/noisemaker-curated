search synth, points, render, filter, mixer

osc2d(
  oscType: noise2d,
  freq: 8,
  speed: 1,
  rotation: -31.628,
  seed: 944
)
  .write(o1)

read(o1)
  .palette(
    index: dreamy,
    rotation: fwd,
    alpha: 0.58
  )
  .write(o2)

solid(color: #000000ff)
  .pointsEmit(stateSize: x128)
  .heightGrid(
    heightTex: read(o1),
    diffuseTex: read(o2),
    gridScale: 100,
    heightScale: 10.7,
    heightOffset: 29.3
  )
  .pointsBillboardRender(
    shapeMode: square,
    blendMode: alpha,
    depositOpacity: 100,
    pointSize: 2.58,
    sizeVariation: 100,
    density: 100,
    intensity: 75.58,
    inputIntensity: 100,
    viewMode: perspective,
    rotateX: 0.36,
    rotateZ: 0.05,
    viewScale: 2.53,
    posY: -25,
    posZ: 2.2,
    fieldOfView: 73,
    sizeDistance: 226,
    brightnessDistance: 120,
    aperture: 9.6,
    focalDistance: 1
  )
  .subchain(name: "lens effects", id: "k6ns") {
    .temporalAberration()
    .bloom(
      threshold: 0.3,
      intensity: 1.5,
      taps: 15
    )
    .lens(displacement: -0.32, aspectLens: false)
    .vaseline(alpha: 1)
  }
  .pixelSort(angled: 15)
  .write(o0)

render(o0)