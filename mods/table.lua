----------------------
--------------------
-- Table Functions
----------------
--------------
------------
----------
--------
------
----
--


------------------
-- Private Functions
--------
------
----
--

local __insert = function(t, k, v)
    if _:isNumber(k) then
        table.insert(t, v)
    else
        t[k] = v
    end

    return t
end

local __remove = function(t, k, v)
    if _:isNumber(k) then
        table.remove(t, k, v)
    else
        t[k] = nil
    end

    return t
end

-- Returns table of keys from `t` in
--  natural order
--
-- Credit: [lua-users](http://lua-users.org/wiki/SortedIteration)
__orderedKeys = function(t)
    local keys = {}
    _:i('len', 0)

    for k, v in pairs(t) do
        keys[_:up('len')] = k
    end

    -- sort, multi-type
    table.sort(keys, function(a, b)
        local at = _.__type(a)
        local bt = _.__type(b)
        if      at ~= bt       then return at < bt
        elseif _:isString(at) or
               _:isNumber(at)  then return a < b
        elseif _:isBoolean(at) then return at == true
        else                        return tostring(a) < tostring(b)
        end
    end)

    return keys
end

-- Imitates next(t, state).
-- Returns next key/value pair in
--  natural order.
--
-- Credit: [lua-users](http://lua-users.org/wiki/SortedIteration)
local __next = function(t, state)
    local key = nil

    if state == nil then
        t.__orderedIndex = __orderedKeys(t)
        key = t.__orderedIndex[1]
    else
        for i = 1, #t.__orderedIndex do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i + 1]
            end
        end
    end

    -- return next key/value pair..
    if key then
        return key, t[key]
    end

    -- done.
    t.__orderedIndex = nil
    return
end

-- Imitates pairs(t).
-- Iterates over `t` in natural order.
__iterator = function(t)
    return __next, t, nil
end


------------------
-- Public Functions
--------
------
----
--

-- _:chunk(tabl, [size=1])
-- Splits elements of `tabl` into groups of `size`.
--
-- @param  table(tabl)       - table to process
-- @param  number([size=1])  - length of each chunk
-- @return table
function _:chunk(tabl, size)
    tabl = _:assertArgument('tabl', tabl, 'table')
    size = _:assertArgument('size', size, 'number', 1)
    --
    local out, sub = {}, {}
    local max = _:size(tabl)
    local cnt = 0

    for k, v in __iterator(tabl) do
        sub = __insert(sub, k, v)
        cnt = cnt + 1

        if cnt % size == 0 or cnt == max then
            table.insert(out, sub)
            sub = {}  -- reset
        end
    end

    return out
end

-- _:tableCombine(tabl, [size=1])
-- creates new `tabl` with `keys` as the
--  keys and `values` as the values.
--
-- requirement:
--   both tables must be equal in size
--
-- @param  table(keys)    - keys table
-- @param  table(values)  - values table
-- @return table
function _:combine(keys, values)
    keys   = _:assertArgument('keys', keys, 'table')
    values = _:assertArgument('values', values, 'table')
    _:assertEqualSize('tabl', keys, values)
    --
    local out    = {}
    local idx    = 1
    local k1, v1 = next(keys)
    local k2, v2 = next(values)

    while k1 ~= nil and k2 ~= nil do
        out[v1] = v2
        k1, v1  = next(keys, idx)
        k2, v2  = next(values, idx)
        idx     = idx + 1
    end

    return out
end

-- _:conformsTo(value, source)
-- Determines if `value` conforms to `source`,
--  by invoking the predicate properties of source
--  with corresponding propery values of `value`.
--
-- @param  table(value)
-- @param  table(source)
-- @return boolean
function _:conformsTo(tabl, source)
    tabl   = _:assertArgument('tabl', tabl, 'table')
    source = _:assertArgument('source', source, 'table')
    --
    table.foreach(tabl, function(k, v)
        if _.type(source[k]) == 'function' then
            if not source[k](v) then
                return false
            end
        end
    end)

    return true
end

-- _:compact(tabl)
-- Creates copy of `tabl` with Lua-falsy
--  values filtered out.
--
-- @param  table(tabl)
-- @return table
function _:compact(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    return _:filter(tabl, 'isTruthy')
end

-- _:filter(tabl, iteratee)
-- Creates copy of `tabl` with values that fail
--  `iteratee` filtered out.
--
-- Note:
-- `iteratee` will receive arguments:
--  * `value`
--  * `key`

-- Warning:
-- Lua tables are volitile when it comes to
--  manipulating keys manually.
--
-- @param  table(tabl)
-- @param  function(iteratee)
-- @return table
function _:filter(tabl, iteratee)
    tabl = _:assertArgument('tabl', tabl, 'table')
    if _:isString(iteratee) and _[iteratee] then
        _:assertArgument('iteratee', _[iteratee], 'function')
    else
        iteratee = _:assertArgument('iteratee', iteratee, 'function')
    end
    --
    local out = {}

    for k, v in pairs(tabl) do
        if _:isString(iteratee) and _[iteratee](_, v, k) then
            __insert(out, k, v)
        elseif _:isFunction(iteratee) and iteratee(v, k) then
            __insert(out, k, v)
        end
    end

    return out
end

-- _:difference(tabl, [values])
-- creates new `tabl` with incoming values not included
--
-- @param  table(tabl)   - table to process
-- @param  table(other)  - compare table
-- @return table
function _:difference(tabl, other)
    tabl  = _:assertArgument('tabl', tabl, 'table')
    other = _:assertArgument('other', other, 'table', {})

    -- swap key/values
    -- other = __swapKeyValues(other)

    table.foreach(tabl, function(k, v)

    end)
end

-- _:drop(tabl, [n=1])
-- creates new `tabl` dropping `num` of elements from beginning
--
--  notes:
--    - negative `num` redirects to `_:dropRight`
--
-- @param  table(tabl)  - table to process
-- @param  number(num)  - number of elements to drop
-- @return table
function _:drop(tabl, num)
    tabl = _:assertArgument('tabl', tabl, 'table')
    num  = _:assertArgument('num', num, 'number', 1)
    --
    local out = _:copy(tabl)
    local cnt = _:abs(num)

    while cnt > 0 do
        if _:isNegative(num) then
            table.remove(out, 1)
        else
            table.remove(out)
        end

        cnt = cnt - 1
    end

    return out
end

-- _:dropWhile(tabl, [predicate])
-- creates new `tabl` excluding items from beginning
-- elements will be dropped until `predicate` is falsey
--
-- @param  table(tabl)         - table to process
-- @param  function(predicate) - predicate ivoked per element
-- @return table
function _:dropWhile(tabl, predicate)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    predicate = _:assertArgument('predicate', predicate, 'function', _.D['function'])
    --

    -- TODO: ...
end

-- _:flatten(tabl)
-- creates new `tabl` flattened one level deep
--
-- @param  table(tabl)   - table to flatten
-- @return table
function _:flatten(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    local out = {}

    table.foreach(tabl, function(k1, v1)
        if _.type(v1) == 'table' then
            table.foreach({ unpack(v1) }, function(k2, v2)
                table.insert(out, v2)
            end)
        else
            table.insert(out, v1)
        end
    end)

    return out
end

-- _:fill(tabl, value, [start=1], [stop=_:size(tabl)])
-- creates new `tabl` with `value` from
--  `start` position to `stop` position
--
-- @param  table(tabl)    - table to fill
-- @param  mixed(value)   - fill value
-- @param  number(start)  - start position
-- @param  number(stop)   - stop position
-- @return table
function _:fill(tabl, value, start, stop)
    tabl  = _:assertArgument('tabl', tabl, 'table')
    start = _:assertArgument('start', start, 'number', 1)
    stop  = _:assertArgument('stop', stop, 'number', _:size(tabl))
    --
    local out = {}

    table.foreach(tabl, function(k, v)
        idx = idx + 1
        if idx >= start and idx < stop then
            rawset(out, k, v)
        end
    end)

    return out
end

-- _:findIndex(tabl, [predicate], [fromIndex=1])
-- returns first index (starting from `formIndex`)
--  of `tabl` where `predicate` returns a truthy value.
--
-- @param  table(tabl)         - table to fill
-- @param  function(predicate) - function ivoked per element
-- @param  number(fromIndex)   - index to search from
-- @return number
function _:findIndex(tabl, predicate, fromIndex)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    predicate = _:assertArgument('predicate', predicate, 'function', _.T['function'])
    fromIndex = _:assertArgument('fromIndex', fromIndex, 'number', 1)
    --
    local idx = fromIndex

    table.foreach(tabl, function(k, v)
        idx = idx + 1
        if _:isTrue(predicate(v)) and idx >= fromIdex then
            return k
        end
    end)

    return -1
end

-- _:findLastIndex(tabl, [predicate], [fromIndex=#tabl])
-- returns first index (starting from `formIndex`)
--  of `tabl` where `predicate` returns a truthy value.
--
-- @param  table(tabl)         - table to fill
-- @param  function(predicate) - function ivoked per element
-- @param  number(fromIndex)   - index to search from
-- @return number
function _:findLastIndex(tabl, predicate, fromIndex)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    predicate = _:assertArgument('predicate', predicate, 'function', _.T['function'])
    fromIndex = _:assertArgument('fromIndex', fromIndex, 'number', #tabl)
    --
    local idx = fromIndex

    while idx > 0 do
        idx = idx - 1
        if _:isTrue(predicate(v)) then
            return k
        end
    end

    return -1
end

-- _:flattenDeep(tabl)
-- creates new `tabl`, recursively flattening table.
--
-- @param  table(tabl)   - table to flatten
-- @return table
function _:flattenDeep(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    local function flatten(out, values)
        table.foreach(values, function(k, v)
            if _.type(v) == 'table' then
                flatten(out, v)
            else
                table.insert(out, v)
            end
        end)

        return out
    end

    return flatten({}, tabl)
end

-- _:head(tabl)
-- Returns first indexed value of `tabl`.
--
-- Note:
--  Only affects indexed elements of `tabl`.
--
-- @param  table(tabl)
-- @return mixed
function _:head(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    return _:nth(1)
end

-- _:join(tabl, [separator=','])
-- converts all elements in `table` into string
--  separated by `separator`
--
-- @param  table(tabl)
-- @param  string(separator)
-- @return table
function _:join(tabl, separator)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    separator = _:assertArgument('separator', separator, 'string', ',')
    --
    return table.concat(tabl, separator)
end

-- _:indexOf(tabl, value)
-- Returns index of first occurrence* of `value`
--  in `tabl`.
--
-- Note:
--  Only named index elements of `tabl`
--  will be checked.
--
-- Warning:
--  The order of named keys in tables
--  is unreliable.
--
-- @param  table(tabl)
-- @param  mixed(value)
-- @return table
function _:indexOf(tabl, value)
    for k, v in pairs(tabl) do

    end
end

-- _:map(tabl, [iteratee])
-- creates new table executing `iteratee`
--  on every element of `tabl`
--
-- note:
--  `iteratee` is invoked with 3 arguments:
--  - mixed(value)
--  - mixed(key)
--  - table(tabl)
--
-- @param  table(keys)        - keys table
-- @param  function(iteratee) - values table
-- @return table
function _:map(tabl, iteratee)
    _:assertArgument('tabl', tabl, 'table')
    _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])
    --
    local out = {}

    table.foreach(tabl, function(k, v)
        table.insert(out, iteratee(v, k, tabl))
    end)

    return out
end

-- _:nth(tabl, [n=0])
-- Returns `n`-th indexed value of `tabl`.
-- Negative `n`-values will count from the right.
--
-- Note:
--  Only affects indexed elements of `tabl`.
--
-- @param  table(tabl)
-- @param  table(tabl)
-- @return mixed
function _:nth(tabl, n)
    tabl = _:assertArgument('tabl', tabl, 'table')
    n    = _:assertArgument('n', n, 'number', 1)
    --
    local pos = _:abs(n)

    if n < 0 then
        pos = #tabl + 1 - pos
    end

    return tabl[pos]
end

-- _:tail(tabl)
-- Returns last indexed value of `tabl`.
--
-- Note:
--  Only affects indexed elements of `tabl`.
--
-- @param  table(tabl)
-- @return mixed
function _:tail(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    return _:nth(tabl, _:size(tabl))
end

-- _:unique(tabl)
-- Creates unique set of elements, dropping duplicate indices.
--
-- Warning:
--  order of associative key/value pairs is unpredictable
--
-- @param  table(tabl)
-- @return table
function _:unique(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')
    --
    local out    = {}
    local values = {}

    for k, v in pairs(tabl) do
        if not values[v] then
            out[k] = v
            values[v] = true
        end
    end

    return out
end

-- _:resize(tabl, size)
-- Creates copy of `tabl`, resized to `size`.
--
-- @param  table(tabl)
-- @param  number(size)
-- @return table
function _:resize(tabl, size)
    tabl = _:assertArgument('tabl', tabl, 'table')
    size = _:assertArgument('size', size, 'number')
    --
    local currsize = _:size(tabl)
    local newSize  = currsize - _:abs(size)

    if newSize < 0 then
        error('Cannot resize a table to a larger size.')
    end

    if _:isNegative(size) then
        newSize = newSize * -1
    end

    return _:drop(tabl, newSize)
end

