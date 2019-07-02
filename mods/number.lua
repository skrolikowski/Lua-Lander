--

-- _:clamp(num, min, max)
-- Performs clamp on `num` so it fits
--  between `min` and `max` values.
--
-- @param  number(num)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:clamp(num, min, max)
    num   = _:assertArgument('num', num, 'number')
    min   = _:assertArgument('min', min, 'number')
    max   = _:assertArgument('max', max, 'number')
    --
    local trueMin = _:min(min, max)
    local trueMax = _:max(min, max)

    return _:max(trueMin, _:min(num, trueMax))
end

-- _:lerp(num, min, max)
-- Performs linear interpolation on a `number`
--  between `min` and `max` values.
--
-- @param  number(num)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:lerp(num, min, max)
    num   = _:assertArgument('num', num, 'number')
    min   = _:assertArgument('min', min, 'number')
    max   = _:assertArgument('max', max, 'number')
    --
    local trueMin = _:min(min, max)
    local trueMax = _:max(min, max)

    return (max - min) * num + min
end

-- _:mapTo(num, minSource, maxSource, minDest, maxDest)
-- Maps `num` from source range (`minSource/maxSource`)
--  to destination range (`minDest/maxDest`).
--
-- @param  number(num)
-- @param  number(minSource)
-- @param  number(maxSource)
-- @param  number(minDest)
-- @param  number(maxDest)
-- @return number
function _:mapTo(num, minSource, maxSource, minDest, maxDest)
    num        = _:assertArgument('num', num, 'number')
    minSource  = _:assertArgument('minSource', minSource, 'number')
    maxSource  = _:assertArgument('maxSource', maxSource, 'number')
    minDest    = _:assertArgument('minDest', minDest, 'number')
    maxDest    = _:assertArgument('maxDest', maxDest, 'number')
    --
    local trueSourceMin = _:min(minSource, maxSource)
    local trueSourceMax = _:max(minSource, maxSource)
    local trueDestMin   = _:min(minDest, maxDest)
    local trueDestMax   = _:max(minDest, maxDest)
    local norm          = _:norm(num, trueSourceMin, trueSourceMax)

    return _:lerp(norm, trueDestMin, trueDestMax)
end

-- _:norm(num, [min=0], [max=1])
-- Computes normalized `num` between `min/max` range.
--
-- @param  number(num)
-- @param  number(min)
-- @param  number(max)
-- @return number
function _:norm(num, min, max)
    num   = _:assertArgument('num', num, 'number')
    min   = _:assertArgument('min', min, 'number', 0)
    max   = _:assertArgument('max', max, 'number', 1)
    --
    return (num - min) / (max - min)
end