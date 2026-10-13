search synth, points, render, filter, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.noise, max: 0.43, seed: 9140)
let osc2 = osc(type: oscKind.tri, min: 0.53)
let osc3 = osc(type: oscKind.noise, max: 0.1, seed: 7632)
let osc4 = osc(type: oscKind.noise, min: 0.2, max: 0.25)

shape(
  loopAOffset: hexagon,
  loopAScale: 82.228,
  loopBScale: 23.96,
  speedA: 57,
  speedB: -59,
  seed: 67,
  wrap: false
)
  .tile(
    symmetry: rotate6,
    scale: 1.45,
    offsetY: -0.26,
    angle: osc3,
    repeat: 7
  )
  .write(o1)

read(o1)
  .palette(
    index: organic,
    rotation: back,
    repeat: 2,
    alpha: 0.58
  )
  .write(o2)

solid(color: #000000ff)
  .pointsEmit(stateSize: x512)
  .heightGrid(
    heightTex: read(o1),
    diffuseTex: read(o2),
    gridScale: osc2,
    heightScale: 100,
    heightOffset: 30.4
  )
  .pointsBillboardRender(
    shapeMode: star,
    blendMode: alpha,
    depositOpacity: 100,
    pointSize: 6.48,
    sizeVariation: 100,
    rotationVar: 100,
    density: 100,
    intensity: 80.82,
    inputIntensity: 100,
    viewMode: perspective,
    rotateX: osc4,
    rotateZ: osc1,
    viewScale: 0.32,
    posY: -2,
    posZ: -94.9,
    fieldOfView: 21
  )
  .subchain(name: "lens effects", id: "k6ns") {
    .temporalAberration(greenDelay: 1, blueDelay: 2)
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