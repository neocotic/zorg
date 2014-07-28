Cylon = require('cylon')
utils = require('./utils')

zorg = Cylon.robot({
  name: 'Zorg'

  connection: {
    name: 'sphero'
    adaptor: 'sphero'
    port: 'COM3'
  }

  device: {
    name: 'sphero'
    driver: 'sphero'
  }

  commands: [
    'move'
    'stop'
  ]

  _heading: 0
  _refreshRate: 0.5
  _speed: 0
  _stopped: yes

  work: ->
    every (@_refreshRate).second(), =>
      @sphero.roll(@_speed, @_heading) unless @_stopped

  decrementThrottle: (step = 10) ->
    @throttle(@_speed - step)

  heading: (heading) ->
    oldHeading = @_heading
    @_heading = utils.minMax(0, 359, heading)

    console.log("Set heading: #{@_heading}") if oldHeading isnt @_heading

    @

  incrementThrottle: (step = 10) ->
    @throttle(@_speed + step)

  rotate: (degrees) ->
    @heading(utils.roll(0, 359, @_heading + degrees))

  stop: ->
    unless @_stopped
      @_stopped = yes

      @sphero.stop()

      console.log('Stopped!')

    @

  throttle: (speed) ->
    oldSpeed = @_speed
    oldStopped = @_stopped
    @_speed = utils.minMax(0, 100, speed)
    @_stopped = no

    console.log('Started!') if oldStopped
    console.log("Set speed: #{@_speed}") if oldSpeed isnt @_speed

    @
})

module.exports = zorg