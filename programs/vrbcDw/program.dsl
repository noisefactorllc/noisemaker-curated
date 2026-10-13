search synth, filter, mixer, render, points

cell(
  scale: 67.66,
  cellScale: 100,
  cellSmooth: 100,
  speed: 5,
  seed: 15
)
  .tetraCosine(
    colorMode: oklch,
    offsetR: 0.34,
    offsetG: 0.35,
    offsetB: 0.786,
    ampR: 0.93,
    ampG: 0.597,
    ampB: 0.678,
    freqR: 4,
    freqB: 2,
    phaseR: 0.855,
    phaseG: 0.765,
    phaseB: 0.82,
    rotation: fwd,
    repeat: 1.28,
    offset: 0.24
  )
  .write(o0)

read(o0)
  .lighting(
    normalStrength: 5,
    smoothing: 10,
    specularIntensity: 0.83,
    shininess: 133,
    reflection: 14.8,
    refraction: 18.2,
    aberration: 64.6
  )
  .focusBlur(
    tex: read(o0),
    focalDistance: 8.43,
    aperture: 2.33,
    sampleBias: 45.76
  )
  .subchain(name: "lens effects", id: "1kos") {
    .temporalAberration()
    .bloom(taps: 15)
    .lens(displacement: -0.5)
    .vignette(brightness: 0.12, alpha: 0.66)
  }
  .adjust(
    rotation: -61.72,
    hueRange: 200,
    brightness: 1.85,
    contrast: 0.71
  )
  .write(o2)

noise(
  type: catmullRom3x3,
  octaves: 1,
  scaleX: 64.59,
  scaleY: 64.88,
  seed: 37,
  loopScale: 70.42,
  speed: 85
)
  .write(o1)

render(o2)