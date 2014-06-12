delegateEvents = (robot, deviceName) ->
  device = robot[deviceName]

  return unless device and robot.events

  for event, method of robot.events
    events = event.split(/\s+/)

    if typeof method isnt 'function'
      method = robot[method]

    continue unless method

    method = method.bind(robot)

    for name in events
      device.on(name, method)

module.exports = {
  delegateEvents
}