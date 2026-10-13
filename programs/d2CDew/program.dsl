search synth, filter, mixer, render, points

cell(
  scale: 53.09,
  cellScale: 100,
  cellSmooth: 56.83,
  variation: 0,
  speed: 5,
  seed: 20
)
  .subchain(name: "flow field particles", id: "yz6a") {
    .pointsEmit(attrition: 0.25)
    .flow(
      behavior: chaotic,
      stride: 20,
      strideDeviation: 0.5,
      kink: 10
    )
    .pointsBillboardRender(
      shapeMode: soft,
      depositOpacity: 6,
      pointSize: 17.43,
      density: 29.24,
      intensity: 84.65,
      inputIntensity: 100
    )
  }
  .write(o1)

polygon(
  sides: 6,
  radius: 0.74,
  smooth: 0.3,
  rotation: 34.66
)
  .write(o0)

read(o0)
  .blendMode(
    tex: read(o1),
    mode: multiply,
    mix: -26.57
  )
  .subchain(name: "particle life", id: "s2ma") {
    .pointsEmit(attrition: 6.5)
    .flow(
      behavior: chaotic,
      stride: 25,
      strideDeviation: 0.5,
      kink: 0.1
    )
    .pointsBillboardRender(
      depositOpacity: 72.22,
      pointSize: 7.07,
      sizeVariation: 100,
      density: 3.96,
      intensity: 89.42,
      inputIntensity: 100
    )
  }
  .blendMode(
    tex: read(o1),
    mode: darken,
    mix: 1.25
  )
  .warp(
    strength: 15.79,
    scale: 1.14,
    speed: 5
  )
  .write(o2)

navierStokes(
  tex: read(o2),
  iterations: 37,
  speed: 91.53,
  dyeDecay: 99.05,
  inputForce: 0.57,
  inputDye: 0.95,
  inputIntensity: 9.57
)
  .write(o4)

read(o4)
  .palette(index: darkSatin, offset: 86)
  .sharpen(amount: 5)
  .lighting(
    normalStrength: 2.82,
    smoothing: 3.1,
    refraction: 25.5,
    heightMap: read(o4)
  )
  .subchain(name: "lens effects", id: "198n") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.59)
  }
  .adjust(brightness: 1.22, contrast: 0.48)
  .write(o3)

render(o3)