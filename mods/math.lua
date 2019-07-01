--
-- Math Functions
--

-- Native lua API pre-loaded for speed..
local __abs    = math.abs
local __ceil   = math.ceil
local __deg    = math.deg
local __floor  = math.floor
local __max    = math.max
local __min    = math.min
local __rad    = math.rad
local __random = math.random

--

-- _:abs(value)
-- returns absolute value of `value`
--
-- @param  number(value)
-- @return number
function _:abs(value)
    value = _:assertArgument('value', value, 'number')
    --
    return __abs(value)
end

-- _:add(...)
-- adds all values in `...`
--
-- note:
--   if `other` is missing, `value` will
--   be added against itself
--
-- @param  number(value)
-- @param  number(other)
-- @return number
function _:add(...)
    return _:sum({...})
end

-- _:ceil(value, [precision=0])
-- computes `value` rounded up to `precision`
--
-- @param  number(value)
-- @param  number(precision)
-- @return number
function _:ceil(value, precision)
    value     = _:assertArgument('value', value, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __ceil(value * factor) / factor
end

-- _:floor(value, [precision=0])
-- computes `value` rounded down to `precision`
--
-- @param  number(value)
-- @param  number(precision)
-- @return number
function _:floor(value, precision)
    value     = _:assertArgument('value', value, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __floor(value * factor) / factor
end

-- _:max(tabl)
-- computes maximum value in `tabl`
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:max(...)
    return _:maxBy({...})
end

-- _:maxBy(tabl, [iteratee])
-- computes maximum number of `table`,
--  every element invoked by `iteratree`
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:maxBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local max

    table.foreach(tabl, function(k, v)
        if _:isNaN(v) then
            v = _:toNumber(v)
        end

        max = __max(max or 0, iteratee(v))
    end)

    return max
end

-- _:mean(tabl, [iteratee])
-- computes mean of numbers in `tabl`
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:mean(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    if #tabl > 0 then
        return _:sum(tabl, iteratee) / #tabl
    end

    return 0
end

-- _:min(tabl, [iteratee])
-- computes minimum number of `table`
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:min(tabl)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local min

    table.foreach(tabl, function(k, v)
        if type(v) == 'number' then
            min = __min(min or 0, iteratee(v))
        end
    end)

    return min
end

-- _:multiply(...)
-- multiply all values in `...`
--
-- @param  mixed(...)
-- @return number
function _:multiply(...)
    local mul

    table.foreach({...}, function(k, v)
        if type(v) == 'number' then
            mul = mul * v
        end
    end)

    return mul
end

-- _:round(value, [precision=0])
-- computes `value` rounded to `precision`
--
-- @param  number(value)
-- @param  number(precision)
-- @return number
function _:round(value, precision)
    value     = _:assertArgument('value', value, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __floor(value * factor + 0.5) / factor
end

-- _:subtract(...)
-- subtract all values in `...`
--
-- @param  mixed(...)
-- @return number
function _:subtract(...)
    local sub

    table.foreach({...}, function(k, v)
        if type(v) == 'number' then
            sub = sub - v
        end
    end)

    return sub
end

-- _:sum(tabl, [iteratee])
-- computes sum of all values in `tabl`
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:sum(tabl)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local sum = 0

    table.foreach(tabl, function(k, v)
        if type(v) == 'number' then
            sum = sum + iteratee(v)
        end
    end)

    return sum
end

-- _:toDeg(rad)
-- converts `rad` to degrees
--
-- @param  number(rad) - radians
-- @return number
function _:toDeg(rad)
    return __deg(rad)
end

-- _:toRad(deg)
-- converts `deg` to radians
--
-- @param  number(deg) - degrees
-- @return number
function _:toRad(deg)
    return __rad(deg)
end