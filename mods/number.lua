--

-- _:clamp(...)
-- performs clamp on `value` so it falls
--  between `min` and `max`
--
-- @param  number(value)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:lerp(value, min, max)
    return _:max(min, _:min(value, max))
end

-- _:lerp(...)
-- performs linear interpolation on a `number`
--  between `min` and `max` values
--
-- @param  number(value)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:lerp(value, min, max)
    value = _:assertArgument('value', value, 'number')
    min   = _:assertArgument('min', min, 'number')
    max   = _:assertArgument('max', max, 'number')
    --
    return (max - min) * value + min
end

-- _:map(...)
-- converts `value` from source range (`sMin/sMax`)
--  to destination range (`dMin/dMax`)
--
-- @param  number(value)
-- @param  number(sMin)
-- @param  number(sMax)
-- @param  number(dMin)
-- @param  number(dMax)
-- @return number
function _:map(value, sMin, sMax, dMin, dMax)
    value = _:assertArgument('value', value, 'number')
    sMin  = _:assertArgument('sMin', sMin, 'number')
    sMax  = _:assertArgument('sMax', sMax, 'number')
    dMin  = _:assertArgument('dMin', dMin, 'number')
    dMax  = _:assertArgument('dMax', dMax, 'number')
    --
    local norm = _:norm(value, sMin, sMax)

    return _:lerp(norm, dMin, dMax)
end

-- _:norm(value, [min=0], [max=1])
-- computes normalized `value` between `min/max` range
--
-- @param  number(value)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:norm(value, min, max)
    value = _:assertArgument('value', value, 'number')
    min   = _:assertArgument('min', min, 'number', 0)
    max   = _:assertArgument('max', max, 'number', 1)
    --
    return (value - min) / (max - min)
end