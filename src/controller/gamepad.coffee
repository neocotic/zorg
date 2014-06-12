Cylon = require('cylon')
utils = require('../utils')

GamePad = Cylon.robot({
  connection: {
    name: 'joystick'
    adaptor: 'joystick'
    controller: 'xbox360'
  }

  device: {
    name: 'controller'
    driver: 'xbox360'
  }

  events: {
    'a:press b:press x:press y:press': 'pressed'
    'a:release b:release x:release y:release': 'released'
    'left:move': 'movedLeft'
    'right:move': 'movedRight'
  }

  lastPosition: {
    left: {
      x: 0
      y: 0
    }
    right: {
      x: 0
      y: 0
    }
  }

  work: ->
    utils.delegateEvents(@, 'controller')

  movedLeft: (position) ->
    last = @lastPosition.left

    unless position.x is last.x and position.y is last.y
      console.log('Moved left:', position)

  movedRight: (position) ->
    last = @lastPosition.right

    unless position.x is last.x and position.y is last.y
      console.log('Moved right:', position)

  pressed: (button) ->
    console.log("Pressed button: #{button}")

  released: (button) ->
    console.log("Released button: #{button}")
})

module.exports = GamePad