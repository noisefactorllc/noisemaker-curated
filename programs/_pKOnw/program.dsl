search filter, synth, render, points, mixer

cell(
  scale: 95.69,
  cellSmooth: 75.95,
  seed: 15
)
  .subchain(name: "feedback loop", id: "4knm") {
    .loopBegin(alpha: 51.01)
    .plasticWrap(
      highlight: 26.564,
      detail: 0,
      smoothness: 45.022,
      lightDirection: vec3(-0.2888888889, 0.1222222222, 0.949528798)
    )
    .loopEnd()
  }
  .relief(smoothness: 34.25, detail: 100)
  .palette(
    index: mars,
    rotation: fwd,
    offset: 25.214,
    alpha: 0.925
  )
  .lighting(
    normalStrength: 3.79,
    smoothing: 10,
    refraction: 38.5
  )
  .write(o0)

render(o0)