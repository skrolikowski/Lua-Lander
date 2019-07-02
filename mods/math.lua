--
-- Math Functions
--

-- Constants
_.PRECISION = 6

-- Native lua API pre-loaded for speed..
local __abs    = math.abs
local __ceil   = math.ceil
local __deg    = math.deg
local __floor  = math.floor
local __huge   = math.huge
local __max    = math.max
local __min    = math.min
local __rad    = math.rad
local __random = math.random

--

-- _:abs(num)
-- Returns absolute value of `num`.
--
-- @param  number(num)
-- @return number
function _:abs(num)
    num = _:assertArgument('num', num, 'number')
    --
    return __abs(num)
end

-- _:add(...)
-- Adds all numbers and returns sum.
--
-- @param  number(...)
-- @return number
function _:add(...)
    return _:sum(...)
end

-- _:ceil(num, [precision=0])
-- Rounds up `num` to desired `precision`.
--
-- @param  number(num)
-- @param  number(precision)
-- @return number
function _:ceil(num, precision)
    num       = _:assertArgument('num', num, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __ceil(num * factor) / factor
end

-- _:divide(...)
-- Divides series of numbers and returns result.
--
-- @param  number(...)
-- @return number
function _:divide(...)
    local out

    table.foreach({...}, function(k, v)
        if _:isNumber(v) then
            if not out then
                out = v
            else
                _:assertNotZero('v', v)
                out = out / v
            end
        end
    end)

    return out
end

-- _:floor(num, [precision=0])
-- Rounds down `num` to desired `precision`.
--
-- @param  number(num)
-- @param  number(precision)
-- @return number
function _:floor(num, precision)
    num       = _:assertArgument('num', num, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __floor(num * factor) / factor
end

-- _:max(...)
-- Finds max in sequence of numbers.
--
-- @param  number(...)
-- @return number
function _:max(...)
    return _:maxBy({...})
end

-- _:maxBy(tabl, [iteratee])
-- Finds max in sequence of numbers, with
--  every element invoked by `iteratree`.
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
        if _:isNumber(v) then
            max = __max(max or 0, iteratee(v))
        end
    end)

    return max
end

-- _:mean(...)
-- Computes mean of sequence of numbers.
--
-- @param  number(...)
-- @return number
function _:mean(...)
    return _:meanBy({...})
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
function _:meanBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    if _:size(tabl) > 0 then
        return (_:sumBy(tabl, iteratee) / _:size(tabl))
    end

    return 0
end

-- _:min(...)
-- Computes minimum of sequence of numbers.
--
-- @param  number(...)
-- @return number
function _:min(...)
    return _:minBy({...})
end

-- _:minBy(tabl, [iteratee])
-- Computes minimum of `tabl` of numbers,
--  with every element invoked by `iteratree`.
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:minBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local min

    table.foreach(tabl, function(k, v)
        if _:isNumber(v) then
            min = __min(min or __huge, iteratee(v))
        end
    end)

    return min
end

-- _:multiply(...)
-- Multiplies sequence of numbers.
--
-- @param  number(...)
-- @return number
function _:multiply(...)
    return _:multiplyBy({...})
end

-- _:multiply(...)
-- Multiplies series of numbers, with every
--  element invoked by `iteratree`.
--
-- Note: Every element of `tabl` will invoke
--  `iteratree`, if provided.
--
-- @param  mixed(...)
-- @return number
function _:multiplyBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local mul

    table.foreach(tabl, function(k, v)
        if _:isNumber(v) then
            if not mul then
                mul = iteratee(v)
            else
                mul = mul * iteratee(v)
            end
        end
    end)

    return mul
end

-- _:round(num, [precision=0])
-- Computes `value` rounded to `precision`.
--
-- @param  number(num)
-- @param  number(precision)
-- @return number
function _:round(num, precision)
    num       = _:assertArgument('num', num, 'number')
    precision = _:assertArgument('precision', precision, 'number', 0)
    --
    local factor = 10 ^ precision

    return __floor(num * factor + 0.5) / factor
end

-- _:subtract(...)
-- Subtracts sequence of numbers
--
-- @param  number(...)
-- @return number
function _:subtract(...)
    return _:subtractBy({...})
end

-- _:subtractBy(tabl, iteratee)
-- Subtracts `tabl` of numbers, with every
--  element invoked by `iteratree`.
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:subtractBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local sub

    table.foreach(tabl, function(k, v)
        if _:isNumber(v) then
            if not sub then
                sub = iteratee(v)
            else
                sub = sub - iteratee(v)
            end
        end
    end)

    return sub
end

-- _:sum(...)
-- Sums sequence of numbers.
--
-- @param  number(...)
-- @return number
function _:sum(...)
    return _:sumBy({...})
end

-- _:sumBy(tabl, [iteratee])
-- computes sum of all values in `tabl`
--
-- note:
--  every element of `tabl` will invoke
--  `iteratree`, if provided
--
-- @param  table(tabl)
-- @param  function(iteratee)  - func to ivoke per element
-- @return number
function _:sumBy(tabl, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local sum = 0

    table.foreach(tabl, function(k, v)
        if _:isNumber(v) then
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
    return _:round(__deg(rad), _.PRECISION)
end

-- _:toRad(deg)
-- converts `deg` to radians
--
-- @param  number(deg) - degrees
-- @return number
function _:toRad(deg)
    return _:round(__rad(deg), _.PRECISION)
end