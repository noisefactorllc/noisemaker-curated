search synth, filter, synth3d, render

perlin(
  scale: 27.31,
  octaves: 4,
  colorMode: mono,
  ridges: true
)
  .write(o0)

perlin(
  scale: 99.07,
  octaves: 2,
  colorMode: mono,
  seed: 1,
  speed: 5
)
  .palette(
    index: springtime,
    offset: 11,
    repeat: 2,
    alpha: 0.62
  )
  .write(o1)

heightmap3d(heightTex: read(o0), tex: read(o1))
  .renderLandscape3d(
    zoom: 4,
    panY: -0.46,
    diffuseIntensity: 1.15
  )
  .motionBlur(amount: 95.86)
  .write(o2)

render(o2)