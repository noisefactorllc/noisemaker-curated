search synth, filter, synth3d, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.saw)
let osc2 = osc(type: oscKind.noise, seed: 3310)
let osc3 = osc(type: oscKind.noise)
let osc4 = osc(type: oscKind.noise, seed: 2104)
let osc5 = osc(type: oscKind.noise, seed: 7169)
let osc6 = osc(type: oscKind.noise, seed: 8125)

perlin(scale: 49.82, speed: 5)
  .kaleido(
    sides: 17,
    metric: hexagon,
    loopScale: 16.91,
    speed: 37.52,
    seed: 99,
    kernel: outline,
    effectWidth: 3.347
  )
  .write(o0)

read(o0)
  .palette(index: sherbet, repeat: 2)
  .write(o2)

heightmap3d(
  heightTex: read(o0),
  tex: read(o2),
  volumeSize: x128,
  heightScale: 1
)
  .renderLandscape3d(
    zoom: 1.1,
    bgColor: #ed793b,
    viewMode: perspective,
    rotateX: 1.56,
    filtering: isosurface
  )
  .subchain(name: "lens effects", id: "7efo") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -1, aspectLens: false)
    .vignette(brightness: 0.28, alpha: 0.42)
  }
  .write(o1)

render(o1)