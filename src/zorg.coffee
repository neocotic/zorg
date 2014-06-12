Cylon = require('cylon')

Zorg = Cylon.robot({
  name: 'Zorg'

  connection: {
    name: 'sphero'
    adaptor: 'sphero'
    port: 'COM4'
  }

  device: {
    name: 'sphero'
    driver: 'sphero'
  }

  commands: [
    'move'
    'stop'
  ]

  heading: 0
  speed: 100
  stopped: yes

  work: ->
    every 1.second(), =>
      @sphero.roll(@speed, @heading) unless @stopped

  move: (@heading) ->
    @stopped = no
    console.log(@heading)

  stop: ->
    @stopped = yes
    @sphero.stop()
})

module.exports = Zorg