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

minMax = (min, max, value) ->
  if value < min
    min
  else if value > max
    max
  else
    value

roll = (min, max, value) ->
  if value < min
    rollDown(min, max, value)
  else if value > max
    rollUp(min, max, value)
  else
    value

rollDown = (min, max, value) ->
  value = max - value

  if value < min then rollDown(min, max, value) else value

rollUp = (min, max, value) ->
  value = min + (max - value)

  if value > max then rollUp(min, max, value) else value

module.exports = {
  delegateEvents
  minMax
  roll
}