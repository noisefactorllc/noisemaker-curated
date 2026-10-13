search synth, filter, render, points, mixer

let osc1 = osc(type: oscKind.sine, min: 0.14, max: 0.29)

perlin(
  scale: 75,
  octaves: 2,
  ridges: true
)
  .palette(
    index: silvermane,
    offset: 89.103,
    repeat: 4,
    alpha: 0.605
  )
  .tile(symmetry: rotate6, repeat: 1)
  .scale(
    x: 1,
    y: 0.57,
    centerY: 1,
    wrap: mirror
  )
  .scroll()
  .rotate(rotation: osc1)
  .warp(
    strength: 6.62,
    scale: 5,
    speed: 5
  )
  .subchain(name: "flow field particles", id: "171s") {
    .pointsEmit(
      stateSize: x512,
      layout: center,
      seed: 13,
      attrition: 3.62
    )
    .flow(
      behavior: randomMix,
      stride: 17,
      strideDeviation: 0.5,
      quantize: true
    )
    .pointsRender(intensity: 95.52, inputIntensity: 0)
    .pointsBillboardRender(
      shapeMode: soft,
      blendMode: alpha,
      depositOpacity: 100,
      pointSize: 2.11,
      sizeVariation: 100,
      seed: 0,
      density: 14.78,
      intensity: 90.56,
      inputIntensity: 100
    )
  }
  .adjust(brightness: 0.84)
  .invert()
  .grain(alpha: 0.2)
  .subchain(name: "lens effects", id: "xq95") {
    .temporalAberration()
    .bloom(
      threshold: 1.05,
      intensity: 0.45,
      taps: 15
    )
    .lens(displacement: -0.5)
    .vignette(brightness: 0.31)
  }
  .adjust(
    rotation: -13.86,
    saturation: 0.73,
    brightness: 1.03,
    contrast: 0.64
  )
  .write(o0)

render(o0)