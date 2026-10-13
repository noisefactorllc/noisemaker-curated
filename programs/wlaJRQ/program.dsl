search filter, synth

gabor(
  scale: 100,
  orientation: 180,
  bandwidth: 12.06,
  isotropy: 100,
  density: 8,
  octaves: 2,
  seed: 17
)
  .tetraCosine(
    colorMode: hsv,
    offsetR: 0.422,
    offsetG: 0.905,
    offsetB: 0.946,
    ampR: 0.37,
    ampG: 0.798,
    ampB: 0.17,
    freqR: 2,
    freqG: 0,
    freqB: 4,
    phaseR: 0.322,
    phaseG: 0.023,
    phaseB: 0.711,
    repeat: 0.23,
    offset: 0.1,
    alpha: 0.82
  )
  .lighting(
    normalStrength: 1.96,
    smoothing: 3.735,
    diffuseColor: #35816d,
    specularColor: #8b7a7e,
    specularIntensity: 0.648,
    shininess: 12.284,
    ambientColor: #f39923,
    lightDirection: vec3(0.01, 0.845, 0.868),
    reflection: 10.316,
    refraction: 4.108,
    aberration: 26.346
  )
  .texture(
    mode: soft,
    alpha: 0.22,
    scale: 0.1,
    intensity: 18.44
  )
  .write(o0)

render(o0)