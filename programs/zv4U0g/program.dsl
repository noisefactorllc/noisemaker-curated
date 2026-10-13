search synth, filter, mixer, classicNoisedeck, synth3d, render, points

let osc1 = osc(type: oscKind.saw)
perlin(
  colorMode: mono,
  dimensions: 3,
  seed: 1
)
  .write(o0)

read(o0)
  .palette(index: california, repeat: 10)
  .write(o1)

heightmap3d(
  heightTex: read(o0),
  tex: read(o1),
  volumeSize: x128,
  heightScale: 0.25,
  baseHeight: 0.47
)
  .renderLandscape3d(
    bgColor: #3c00d0,
    viewMode: perspective,
    rotateX: 0.25,
    viewScale: 1,
    posY: -10,
    posZ: 35,
    fieldOfView: 75
  )
  .write(o2)

solid(color: #800047)
  .subchain(name: "flow field particles", id: "t5qa") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o1),
      gridScale: 100,
      heightScale: 25,
      heightOffset: -6.7
    )
    .pointsRender(
      density: 100,
      intensity: 96.45,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: 0.25,
      viewScale: 1,
      posY: -10,
      posZ: 35,
      fieldOfView: 75
    )
    .pointsBillboardRender(
      depositOpacity: 20.18,
      pointSize: 22.35,
      sizeVariation: 100,
      density: 0.71,
      intensity: 71.04,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: 0.25,
      viewScale: 1,
      posY: -10,
      posZ: 35,
      fieldOfView: 75,
      aperture: 7,
      focalDistance: 106
    )
  }
  .split(
    tex: read(o2),
    rotation: osc1,
    softness: 1
  )
  .subchain(name: "lens effects", id: "c4ow") {
    .temporalAberration()
    .bloom(
      threshold: 0.9,
      radius: 22,
      taps: 49
    )
    .lens(displacement: -0.5, aspectLens: false)
    .vignette(alpha: 0.49)
    .vaseline()
  }
  .write(o3)

render(o3)