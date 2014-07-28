Cylon = require('cylon')
utils = require('../utils')
zorg = require('../zorg')

keyboard = Cylon.robot({
  connection: {
    name: 'keyboard'
    adaptor: 'keyboard'
  }

  device: {
    name: 'keyboard'
    driver: 'keyboard'
  }

  events: {
    'up': 'speedUp'
    'right': 'turnRight'
    'down': 'slowDown'
    'left': 'turnLeft'
    'space': 'stop'
  }

  rotation: 10

  work: ->
    utils.delegateEvents(@, 'keyboard')

  slowDown: ->
    zorg.decrementThrottle()

  speedUp: ->
    zorg.incrementThrottle()

  stop: ->
    zorg.stop()

  turnLeft: ->
    zorg.rotate(-@rotation)

  turnRight: ->
    zorg.rotate(@rotation)
})

module.exports = keyboard