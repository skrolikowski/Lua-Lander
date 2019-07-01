--

-- __randomColor()
-- returns random color
--
-- @private
-- @return number(r, g, b)
local __randomColor = function()
    return _.random(),
           _.random(),
           _.random()
end

-- Attempt to resolve color
--   else error out
--
-- @private
-- @param string(value)
-- @return number(r, g, b)
local __resolveColor = function(value)
    _:assertNotNil('value', value)
    --
    local stat, r, g, b

    -- hex test
    stat, r, g, b = pcall(_.colorByHex, _, value)
    if stat then return r, g, b end

    -- name test
    stat, r, g, b = pcall(_.colorByName, _, value)
    if stat then return r, g, b end

    -- failure to find color..
    assert(false, 'Requested color `' .. value .. '` could not be resolved.')
end

-- __colorMixer([...])
-- returns set of r, g, b values based
--  off of the mean of all colors
--
-- @private
-- @param  string(...)
-- @return number(r,g,b)
local __colorMixer = function(...)
    local color  = {}
    local cnt    = 0
    local ra, ga, ba

    table.foreach({...}, function(_, color)
        r, g, b = __resolveColor(color)
        ra = (ra or 0) + r
        ga = (ga or 0) + g
        ba = (ba or 0) + b
        cnt = cnt + 1
    end)

    return ra / cnt, ga / cnt, ba / cnt
end

--

-- _:color([...])
-- spins up new color
--
-- arguments:
--  - 0  => random color
--  - 1  => color by name
--  - 2+ => mix multiple colors by name
--
-- @param  mixed(...)
-- @return number(r,g,b)
function _:color(...)
    local args = {...}

    if #args == 0 then
        -- spin up random r, g, b values
        return __randomColor()
    elseif #args == 1 then
        -- find color by name
        return __resolveColor(args[1])
    elseif #args >= 2 then
        -- mix multiple colors together
        return __colorMixer(...)
    end

    return __colorByName('black')
end

-- returns color by `hint`
function _:colorByName(hint)
    _:assertArgument('hint', hint, 'string')
    --
    assert(_.C[hint], 'Color `' .. hint .. '` does not exist.')

    return unpack(_.C[hint])
end

-- returns color by hex
function _:colorByHex(hint)
    _:assertArgument('hint', hint, 'string')
    --
    hint = string.match(hint, "^#([%w]+)")

    if hint == nil then
        error("Invalid hex format; acceptable formats: (i.e. #FFEEEE, #AAA)")
    end

    if hint:len() == 3 then
        r = string.sub(hint, 1, 1)
        g = string.sub(hint, 2, 2)
        b = string.sub(hint, 3, 3)
    else
        r = string.sub(hint, 1, 2)
        g = string.sub(hint, 3, 4)
        b = string.sub(hint, 5, 6)
    end

    return tonumber(r, 16) / 255,
           tonumber(g, 16) / 255,
           tonumber(b, 16) / 255
end

--
-- Default Color Palette
-- Inspired by `tailwindcss`
--

_.C = {}
-- Common
_.C['white'] = { 1.0, 1.0, 1.0 }
_.C['black'] = { 0.0, 0.0, 0.0 }
-- Grey
_.C['gray-100'] = { _:colorByHex('#F7FAFC') }
_.C['gray-200'] = { _:colorByHex('#EDF2F7') }
_.C['gray-300'] = { _:colorByHex('#E2E8F0') }
_.C['gray-400'] = { _:colorByHex('#CBD5E0') }
_.C['gray-500'] = { _:colorByHex('#A0AEC0') }
_.C['gray-600'] = { _:colorByHex('#718096') }
_.C['gray-700'] = { _:colorByHex('#4A5568') }
_.C['gray-800'] = { _:colorByHex('#2D3748') }
_.C['gray-900'] = { _:colorByHex('#1A202C') }
-- Red
_.C['red-100'] = { _:colorByHex('#FFF5F5') }
_.C['red-200'] = { _:colorByHex('#FED7D7') }
_.C['red-300'] = { _:colorByHex('#FEB2B2') }
_.C['red-400'] = { _:colorByHex('#FC8181') }
_.C['red-500'] = { _:colorByHex('#F56565') }
_.C['red-600'] = { _:colorByHex('#E53E3E') }
_.C['red-700'] = { _:colorByHex('#C53030') }
_.C['red-800'] = { _:colorByHex('#9B2C2C') }
_.C['red-900'] = { _:colorByHex('#742A2A') }
-- Orange
_.C['orange-100'] = { _:colorByHex('#FFFAF0') }
_.C['orange-200'] = { _:colorByHex('#FEEBC8') }
_.C['orange-300'] = { _:colorByHex('#FBD38D') }
_.C['orange-400'] = { _:colorByHex('#F6AD55') }
_.C['orange-500'] = { _:colorByHex('#ED8936') }
_.C['orange-600'] = { _:colorByHex('#DD6B20') }
_.C['orange-700'] = { _:colorByHex('#C05621') }
_.C['orange-800'] = { _:colorByHex('#9C4221') }
_.C['orange-900'] = { _:colorByHex('#7B341E') }
-- Yellow
_.C['yellow-100'] = { _:colorByHex('#FFFFF0') }
_.C['yellow-200'] = { _:colorByHex('#FEFCBF') }
_.C['yellow-300'] = { _:colorByHex('#FAF089') }
_.C['yellow-400'] = { _:colorByHex('#F6E05E') }
_.C['yellow-500'] = { _:colorByHex('#ECC94B') }
_.C['yellow-600'] = { _:colorByHex('#D69E2E') }
_.C['yellow-700'] = { _:colorByHex('#B7791F') }
_.C['yellow-800'] = { _:colorByHex('#975A16') }
_.C['yellow-900'] = { _:colorByHex('#744210') }
-- Green
_.C['green-100'] = { _:colorByHex('#F0FFF4') }
_.C['green-200'] = { _:colorByHex('#C6F6D5') }
_.C['green-300'] = { _:colorByHex('#9AE6B4') }
_.C['green-400'] = { _:colorByHex('#68D391') }
_.C['green-500'] = { _:colorByHex('#48BB78') }
_.C['green-600'] = { _:colorByHex('#38A169') }
_.C['green-700'] = { _:colorByHex('#2F855A') }
_.C['green-800'] = { _:colorByHex('#276749') }
_.C['green-900'] = { _:colorByHex('#22543D') }
-- Blue
_.C['blue-100'] = { _:colorByHex('#EBF8FF') }
_.C['blue-200'] = { _:colorByHex('#BEE3F8') }
_.C['blue-300'] = { _:colorByHex('#90CDF4') }
_.C['blue-400'] = { _:colorByHex('#63B3ED') }
_.C['blue-500'] = { _:colorByHex('#4299E1') }
_.C['blue-600'] = { _:colorByHex('#3182CE') }
_.C['blue-700'] = { _:colorByHex('#2B6CB0') }
_.C['blue-800'] = { _:colorByHex('#2C5282') }
_.C['blue-900'] = { _:colorByHex('#2A4365') }
-- Purple
_.C['purple-100'] = { _:colorByHex('#FAF5FF') }
_.C['purple-200'] = { _:colorByHex('#E9D8FD') }
_.C['purple-300'] = { _:colorByHex('#D6BCFA') }
_.C['purple-400'] = { _:colorByHex('#B794F4') }
_.C['purple-500'] = { _:colorByHex('#9F7AEA') }
_.C['purple-600'] = { _:colorByHex('#805AD5') }
_.C['purple-700'] = { _:colorByHex('#6B46C1') }
_.C['purple-800'] = { _:colorByHex('#553C9A') }
_.C['purple-900'] = { _:colorByHex('#44337A') }