pprint = require 'libs.pprint.pprint'
--
math.randomseed(os.time())
--

_ = {}
_.__index = index

-- variables
require 'mods.variables'

--- modules
require 'mods.assert'
require 'mods.color'
require 'mods.lang'
require 'mods.math'
require 'mods.number'
require 'mods.string'
require 'mods.table'
require 'mods.util'
