search synth, filter, synth3d, render, points, mixer

let osc1 = osc(type: oscKind.noise, min: 0.55, max: 0.7, seed: 1997)
let osc2 = osc(type: oscKind.noise, min: 0.53, max: 0.87)
let osc3 = osc(type: oscKind.noise, seed: 7877)
let osc4 = osc(type: oscKind.noise, min: 0.46, max: 0.56, speed: 2, seed: 8236)

perlin(
  scale: 100,
  octaves: 4,
  colorMode: mono,
  dimensions: 3,
  ridges: true
)
  .write(o0)

perlin(
  scale: 17.07,
  colorMode: mono,
  dimensions: 3,
  seed: 3,
  speed: 5
)
  .palette(
    index: springtime,
    offset: 11,
    repeat: 2,
    alpha: 0.62
  )
  .write(o1)

heightmap3d(heightTex: read(o0), tex: read(o1))
  .renderLandscape3d(
    zoom: 3.16,
    panY: -0.36,
    viewMode: perspective,
    rotateX: 0,
    rotateY: osc3,
    posX: osc1,
    posY: 11.8,
    posZ: osc2
  )
  .edge(
    channel: luminance,
    amount: 54.64,
    blend: darken
  )
  .wobble()
  .rotate(rotation: osc4)
  .subchain(name: "lens effects", id: "yq5n") {
    .temporalAberration(
      redDelay: 2,
      greenDelay: 1,
      blueDelay: 0
    )
    .bloom(taps: 15)
    .lens(displacement: -0.44)
    .vaseline()
  }
  .write(o2)

render(o2)