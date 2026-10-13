search filter, synth

cellularAutomata(
  zoom: x64,
  ruleIndex: size34Life,
  smoothing: bSpline3x3,
  speed: 13.016
)
  .sine(amount: 9.7, colorMode: mono)
  .ridge(level: 0.46)
  .relief(smoothness: 11.56, detail: 100)
  .temporalAberration()
  .texture(alpha: 0.37, scale: 0.1)
  .write(o0)

render(o0)