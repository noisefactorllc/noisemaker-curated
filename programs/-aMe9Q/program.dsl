search synth, filter, render, mixer, points

perlin(
  scale: 44.22,
  octaves: 3,
  dimensions: 3,
  ridges: true,
  speed: 3
)
  .adjust(
    mode: hsv,
    rotation: 66.34,
    hueRange: 46.16,
    contrast: 0.67
  )
  .write(o0)

navierStokes(
  tex: read(o0),
  zoom: x2,
  iterations: 40,
  speed: 145,
  dyeDecay: 98.92,
  inputForce: 0.94,
  inputDye: 1,
  inputIntensity: 0
)
  .write(o1)

read(o1)
  .blendMode(
    tex: read(o0),
    mode: softLight,
    mix: -3.81
  )
  .parallax(
    heightMap: read(o1),
    direction: vec3(0, -1, 0),
    pivot: 0.35
  )
  .write(o2)

read(o2)
  .palette(
    index: afterimage,
    repeat: 10,
    alpha: 0.62
  )
  .lighting(
    normalStrength: 5,
    smoothing: 10,
    specularIntensity: 1.35,
    shininess: 81,
    reflection: 100,
    refraction: 89.8,
    aberration: 57.5,
    heightMap: read(o2)
  )
  .focusBlur(
    tex: read(o2),
    focalDistance: 37.11,
    aperture: 2.15,
    sampleBias: 33.86
  )
  .adjust(saturation: 0.74, contrast: 0.71)
  .feedback(
    blendMode: lighten,
    mix: 63.98,
    intensity: -19.01
  )
  .write(o3)

render(o3)