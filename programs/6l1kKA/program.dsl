search synth, points, render, filter, mixer

shape(
  loopAOffset: verticalScan,
  loopBOffset: noiseSimplex,
  loopBScale: 100,
  speedA: 100,
  speedB: -43
)
  .write(o1)

read(o1)
  .palette(
    index: afterimage,
    rotation: fwd,
    alpha: 0.58
  )
  .write(o2)

solid(color: #000000)
  .pointsEmit(stateSize: x128)
  .heightGrid(
    heightTex: read(o1),
    diffuseTex: read(o2),
    gridScale: 100,
    heightScale: 10.7,
    heightOffset: 29.3
  )
  .pointsBillboardRender(
    blendMode: alpha,
    pointSize: 4.16,
    density: 100,
    inputIntensity: 100,
    viewMode: perspective,
    rotateX: 0.37,
    viewScale: 2.19,
    posY: -31.3
  )
  .subchain(name: "lens effects", id: "k6ns") {
    .temporalAberration()
    .bloom(
      threshold: 0.3,
      intensity: 1.5,
      taps: 15
    )
    .lens(displacement: -0.71, aspectLens: false)
    .vaseline(alpha: 1)
  }
  .write(o0)

render(o0)