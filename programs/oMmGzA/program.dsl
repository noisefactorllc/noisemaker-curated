search filter, synth

modPattern(
  scale1: 19.33,
  repeat1: 3.19,
  shape2: diamond,
  scale2: 9.096,
  repeat2: 1.97,
  shape3: square,
  scale3: 1.518,
  repeat3: 0.885,
  blend: rgb,
  animMode: pan,
  speed: 0
)
  .palette(
    index: dreamy,
    rotation: back,
    offset: 96.164,
    repeat: 6,
    alpha: 0.956
  )
  .pondRipples(
    amount: 100,
    ridges: 3,
    speed: 5,
    style: aroundCenter
  )
  .lighting(
    normalStrength: 0.41,
    smoothing: 10,
    diffuseColor: #80a410,
    specularColor: #079237,
    specularIntensity: 0.186,
    shininess: 17.708,
    ambientColor: #959fe3,
    lightDirection: vec3(0.305, 0.713, 0.195),
    reflection: 19.395,
    refraction: 27.4,
    aberration: 1.95
  )
  .write(o0)

render(o0)