require('coffee-script/register')

Cylon = require('cylon')
Zorg = require('./zorg')
#GamePad = require('./controller/gamepad')
Keyboard = require('./controller/keyboard')

Cylon.start()

module.exports = Zorg