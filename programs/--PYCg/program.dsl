search filter, mixer, points, render, synth

solid()
  .subchain(name: "life", id: "zxnr") {
    .pointsEmit(
      stateSize: x64,
      layout: center,
      seed: 11,
      attrition: 2.26
    )
    .life(
      typeCount: 8,
      attractionScale: 1.9,
      repulsionScale: 3.2,
      minRadius: 0.021,
      friction: 0.25,
      matrixSeed: 78.425
    )
    .lenia(
      muK: 9,
      sigmaK: 3.4,
      repulsion: 0.6,
      dt: 0.08,
      searchRadius: 19,
      depositAmount: 1.4
    )
    .pointsRender(
      density: 100,
      intensity: 94.45,
      inputIntensity: 0,
      rotateX: 4.221,
      rotateY: 0.646,
      rotateZ: 1.316,
      viewScale: 1.546,
      posX: -25.066,
      posY: -19.438,
      matteOpacity: 0.839
    )
  }
  .write(o0)

render(o0)