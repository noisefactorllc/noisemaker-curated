search synth, filter, synth3d, render

perlin(
  scale: 100,
  octaves: 4,
  colorMode: mono,
  dimensions: 3,
  ridges: true
)
  .write(o0)

perlin(
  scale: 17.07,
  colorMode: mono,
  dimensions: 3,
  seed: 3,
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
    zoom: 2.08,
    panY: -0.23,
    diffuseIntensity: 0.82,
    specularIntensity: 0.1,
    viewMode: perspective,
    rotateX: 0.24,
    posY: 18.3,
    posZ: 44.2
  )
  .edge(
    channel: luminance,
    amount: 54.64,
    blend: darken
  )
  .write(o2)

render(o2)