search synth, filter, render, points, mixer, synth3d

let osc1 = osc(type: oscKind.sine, min: 0.68, max: 0.76)
let osc2 = osc(type: oscKind.saw)

perlin(
  scale: 9.51,
  octaves: 3,
  colorMode: mono,
  seed: 70,
  speed: 5
)
  .write(o0)

perlin(scale: 13.05, speed: 5)
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
    rotateX: 0.25,
    rotateY: osc2,
    rotateZ: osc2,
    posZ: osc1,
    fieldOfView: 96
  )
  .write(o3)

solid(color: #000000)
  .subchain(name: "strange attractor particles", id: "9xcv") {
    .pointsEmit()
    .heightGrid(
      heightTex: read(o0),
      diffuseTex: read(o2),
      heightOffset: -11.1
    )
    .pointsBillboardRender(
      shapeMode: star,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 5.69,
      sizeVariation: 100,
      rotationVar: 100,
      density: 100,
      intensity: 84.43,
      inputIntensity: 100,
      viewMode: perspective,
      rotateX: 0.25,
      rotateY: osc2,
      rotateZ: osc2,
      viewScale: 0.75,
      posZ: osc1,
      fieldOfView: 96,
      sizeDistance: 116,
      brightnessDistance: 45,
      aperture: 1.1,
      focalDistance: 22
    )
  }
  .blendMode(
    tex: read(o3),
    mode: lighten,
    mix: 3.41
  )
  .write(o1)

render(o1)