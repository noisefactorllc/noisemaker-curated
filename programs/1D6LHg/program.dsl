search filter, mixer, points, render, synth, classicNoisedeck

let osc1 = osc(type: oscKind.sine, speed: 17)
let osc2 = osc(type: oscKind.noise, speed: 3)
let osc3 = osc(type: oscKind.noise, max: 0.19, speed: 7, seed: 7066)

let osc4 = osc(type: oscKind.sine, speed: 4)
noise(
  loopOffset: circle,
  loopScale: 90.55,
  speed: 100,
  colorMode: mono
)
  .palette(
    index: sherbet,
    offset: 75.952,
    repeat: 3,
    alpha: 0.892
  )
  .subchain(name: "life", id: "zxnr") {
    .pointsEmit(
      stateSize: x64,
      layout: center,
      seed: 11,
      attrition: osc3
    )
    .life(
      typeCount: 8,
      attractionScale: 2.2,
      repulsionScale: osc1,
      minRadius: 0.021,
      maxSpeed: osc2,
      friction: 0.98,
      matrixSeed: 78.425
    )
    .lenia(
      muK: 7.5,
      sigmaK: 9.1,
      repulsion: 0.6,
      dt: 0.08,
      searchRadius: 11,
      depositAmount: 1.4
    )
    .pointsRender(
      density: 100,
      intensity: osc4,
      inputIntensity: 0,
      rotateX: 4.221,
      rotateY: 0.646,
      rotateZ: 1.316,
      viewScale: 1.546,
      posX: -25.066,
      posY: -19.438,
      matteOpacity: 0.839
    )
    .pointsBillboardRender(
      shapeMode: soft,
      blendMode: alpha,
      depositOpacity: 19.76,
      pointSize: 45.8,
      sizeVariation: 100,
      density: 0,
      intensity: 40.23,
      inputIntensity: 100
    )
  }
  .rotate(speed: 1)
  .subchain(name: "lens effects", id: "a2sw") {
    .temporalAberration(
      redDelay: 3,
      greenDelay: 1.5,
      blueDelay: 0
    )
    .bloom(
      threshold: 0.55,
      intensity: 1.05,
      taps: 45
    )
    .lens(displacement: 0.24)
    .vignette()
  }
  .write(o0)

render(o0)