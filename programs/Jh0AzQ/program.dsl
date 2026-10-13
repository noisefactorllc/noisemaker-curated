search synth, filter, mixer

sacredGeometry(
  geometry: borromean,
  scale: 10.66,
  rings: 6,
  starPoints: 12,
  rotation: -28.373,
  thickness: 0.7,
  smoothness: 0.55,
  fgColor: #436c15,
  bgColor: #7213c9,
  animation: unfold,
  speed: 5,
  pulseDepth: 0.587
)
  .write(o0)

noise(
  type: bSpline4x4,
  octaves: 4,
  scaleX: 59.63,
  scaleY: 53.309,
  seed: 36,
  wrap: false,
  loopOffset: hexagon,
  loopScale: 87.965,
  speed: 0
)
  .palette(
    index: vintagePhoto,
    offset: 60.962,
    repeat: 4,
    alpha: 0.85
  )
  .distortion(
    tex: read(o0),
    mode: displace,
    intensity: 19.55,
    smoothing: 3.5,
    aberration: 23.431,
    antialias: true
  )
  .lighting(
    normalStrength: 2.538,
    smoothing: 6.677,
    diffuseColor: #d1aeda,
    specularIntensity: 0.889,
    shininess: 240.393,
    ambientColor: #b59bac,
    lightDirection: vec3(0.712, 0.756, 0.709),
    reflection: 25.101,
    refraction: 16.666,
    aberration: 13.482
  )
  .write(o1)

render(o1)