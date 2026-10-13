search synth, filter, render, points, mixer, classicNoisedeck

let osc1 = osc(type: oscKind.noise, seed: 6797)
let osc2 = osc(type: oscKind.noise, offset: -1, seed: 7676)
let osc3 = osc(type: oscKind.sawInv)
let osc4 = osc(type: oscKind.noise, min: 0.47, max: 0.57, seed: 3520)

bitEffects(
  speed: 100,
  maskFormula: wideInvaders,
  tiles: 1,
  complexity: 100,
  maskColorScheme: blackWhite,
  baseHueRange: 58.21
)
  .write(o0)

cellularAutomata(
  tex: read(o0),
  ruleIndex: pondLife,
  speed: 36.86,
  weight: 56.37
)
  .translate(x: 0.46, y: osc3)
  .palette(
    index: darkSatin,
    offset: 91,
    repeat: 3,
    alpha: 0.48
  )
  .parallax(direction: vec3(-0.53, -0.848, 0))
  .write(o1)

read(o1)
  .palette(
    index: sherbetDouble,
    rotation: fwd,
    offset: 32,
    alpha: 0.63
  )
  .lighting(
    normalStrength: 5,
    diffuseColor: #e78934,
    specularColor: #4e44ec,
    specularIntensity: 2,
    shininess: 34,
    ambientColor: #3645a0,
    lightDirection: vec3(-0.456, 0.467, 0.758),
    reflection: 20.555,
    refraction: 14.2,
    aberration: 11.678,
    heightMap: read(o1)
  )
  .focusBlur(
    tex: read(o1),
    focalDistance: 79.3,
    aperture: 1,
    sampleBias: 31.83
  )
  .subchain(name: "lens effects", id: "4ahh") {
    .temporalAberration(redDelay: 8, blueDelay: 0)
    .bloom(taps: 15)
    .lens(displacement: -0.34)
    .vignette(brightness: 0.18, alpha: 0.69)
    .vaseline(alpha: 0.79)
  }
  .adjust(contrast: 0.66)
  .write(o2)

render(o2)