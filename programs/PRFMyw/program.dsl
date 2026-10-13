search synth, filter, render, points, mixer

perlin(scale: 34.78, dimensions: 3)
  .palette(
    index: sulphur,
    offset: 32,
    alpha: 0.63
  )
  .chroma(
    targetHue: 0,
    range: 0.5,
    feather: 0.06
  )
  .subchain(name: "flow field particles", id: "7kwl") {
    .pointsEmit(attrition: 4.15)
    .flow(
      behavior: crosshatch,
      stride: 20,
      kink: 0.2
    )
    .pointsRender(
      density: 31.68,
      intensity: 84.63,
      inputIntensity: 89.98
    )
  }
  .fibers(density: 0.13, alpha: 0.15)
  .hatch(
    mode: crosshatch,
    strokeLength: 6.08,
    balance: 64.33,
    pressure: 49.34
  )
  .warp(
    strength: 1.55,
    scale: 4.07,
    seed: 33,
    speed: 3
  )
  .texture(
    mode: regular,
    alpha: 0.13,
    scale: 2.1,
    intensity: 64.47,
    contrast: 77.156
  )
  .write(o1)

render(o1)