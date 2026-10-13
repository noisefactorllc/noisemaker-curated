search synth, points, render, filter, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.tri, max: 0.13, seed: 9140)
let osc2 = osc(type: oscKind.noise, min: 0.08, max: 0.59, seed: 5435)
let osc4 = osc(type: oscKind.noise, min: 0.26, max: 0.65, seed: 6030)
let osc3 = osc(type: oscKind.noise, max: 0.3, speed: 2, offset: 0.49, seed: 7647)

from(classicNoisedeck, noise(
  type: constant,
  octaves: 3,
  xScale: 79.99,
  yScale: 100,
  refractAmt: osc3,
  hueRotation: 129.97,
  hueRange: 68.35
))
  .write(o1)

read(o1)
  .palette(
    index: solaris,
    rotation: back,
    repeat: 2,
    alpha: 0.58
  )
  .write(o2)

solid(color: #000000ff)
  .pointsEmit()
  .heightGrid(
    heightTex: read(o1),
    diffuseTex: read(o2),
    gridScale: osc2,
    heightScale: 100,
    heightOffset: -100
  )
  .pointsBillboardRender(
    shapeMode: soft,
    blendMode: alpha,
    depositOpacity: 100,
    pointSize: 8.06,
    sizeVariation: 100,
    rotationVar: 100,
    density: 100,
    intensity: 80.82,
    inputIntensity: 100,
    viewMode: perspective,
    rotateX: osc4,
    rotateZ: osc1,
    viewScale: 1.03,
    posX: 16.3,
    posY: -50,
    posZ: -42.5,
    fieldOfView: 21
  )
  .subchain(name: "lens effects", id: "k6ns") {
    .temporalAberration(greenDelay: 1, blueDelay: 2)
    .bloom(
      threshold: 0.55,
      intensity: 1.55,
      taps: 15
    )
    .lens(displacement: -1, aspectLens: false)
    .vaseline(alpha: 1)
  }
  .write(o0)

render(o0)