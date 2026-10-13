search synth, filter
let midsReact = audio(band: 1, min: 24.225, max: 82.365)

perlin(scale: midsReact, octaves: 2)
  .tetraCosine(
    colorMode: hsv,
    offsetR: 0.645,
    offsetG: 0.694,
    offsetB: 0.2,
    ampR: 0.479,
    ampG: 0.707,
    ampB: 0.399,
    freqR: 4,
    phaseR: 0.186,
    phaseG: 0.132,
    phaseB: 0.62,
    repeat: 5,
    offset: 0.799,
    alpha: 0.662
  )
  .lighting(
    normalStrength: 4.25,
    smoothing: 4.1,
    specularIntensity: 1.17,
    shininess: 182,
    lightDirection: vec3(-0.111, 0.167, 0.98),
    reflection: 37.6,
    refraction: 42.1,
    aberration: 40.1
  )
  .write(o0)

render(o0)