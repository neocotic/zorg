Cylon = require('cylon')
Zorg = require('../zorg')
utils = require('../utils')

move = (heading) ->
  -> Zorg.move(heading)

Keyboard = Cylon.robot({
  connection: {
    name: 'keyboard'
    adaptor: 'keyboard'
  }

  device: {
    name: 'keyboard'
    driver: 'keyboard'
  }

  events: {
    'a up': move(0)
    'd right': move(90)
    's down': move(180)
    'a left': move(270)
    'space': 'stop'
  }

  work: ->
    utils.delegateEvents(@, 'keyboard')

  stop: ->
    Zorg.stop()
})

module.exports = Keyboard