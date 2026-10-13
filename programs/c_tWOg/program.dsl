search filter, mixer, synth, classicNoisedeck

polygon(
  sides: 52,
  radius: 0.842,
  smooth: 0.2,
  rotation: 135.426,
  fgColor: #e4e593,
  fgAlpha: 0.988,
  bgColor: #3e9e89,
  bgAlpha: 0.977
)
  .write(o0)

polygon(
  radius: 0.77,
  smooth: 0.029,
  rotation: 23,
  fgColor: #379ba3,
  fgAlpha: 0.928,
  bgColor: #a1991a,
  bgAlpha: 0.989
)
  .split(
    tex: read(o0),
    invert: on,
    position: -0.142,
    rotation: 180,
    softness: 1,
    speed: 3
  )
  .texture(
    mode: clumped,
    alpha: 0.408,
    scale: 1.417,
    intensity: 63.53,
    contrast: 26.009,
    mono: false
  )
  .chrome(
    detail: 73.341,
    smoothness: 53.295,
    distortion: 33.419
  )
  .scatter(
    radius: 16.934,
    smoothness: 9.709,
    seed: 18
  )
  .write(o1)

render(o1)