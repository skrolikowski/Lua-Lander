pprint = require 'libs.pprint.pprint'
--
math.randomseed(os.time())
--

_ = {}
_.__index = index

require 'mods.assert'
require 'mods.color'
require 'mods.lang'
require 'mods.math'
require 'mods.number'
require 'mods.string'
require 'mods.table'
require 'mods.util'

print(_:truncate('hi-diddly-ho there, neighborino', {length = 24, separator = ' '}))