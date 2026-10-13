search synth, filter, render, points, mixer

perlin(
  scale: 19.08,
  ridges: true,
  seed: 47
)
  .adjust(hueRange: 200, saturation: 0.62)
  .palette(
    index: summoning,
    offset: 100,
    alpha: 0.7
  )
  .lighting(
    normalStrength: 5,
    smoothing: 2,
    specularIntensity: 0.99,
    reflection: 20.4,
    refraction: 16.8,
    aberration: 19.4
  )
  .write(o1)

render(o1)