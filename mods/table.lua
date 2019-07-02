--

-- shallow copy (quick & dirty)
function _:tableCopy(tabl)
    return { unpack(tabl) }
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
    _:assertEqualSize(keys, values)

    -- TODO:
end

--


-- _:chunk(tabl, [size=1])
-- creates new `tabl` of elements split into groups of `size`
--
-- @param  table(tabl)       - table to process
-- @param  number([size=1])  - length of each chunk
-- @return table
function _:chunk(tabl, size)
    tabl = _:assertArgument('tabl', tabl, 'table')
    size = _:assertArgument('size', size, 'number', 1)

    local out = {}
    local sub = {}
    local cnt = 0

    table.foreach(tabl, function(key, value)
        table.insert(sub, value)

        cnt = cnt + 1
        if cnt % size == 0 or cnt == #tabl then
            table.insert(out, sub)
            sub = {}
        end
    end)

    return out
end

-- _:compact(tabl)
-- creates new table without lua-falsy values (i.e. false and nil)
--
-- @param  table(tabl)  - table to process
-- @return table
function _:compact(tabl)
    tabl = _:assertArgument('tabl', tabl, 'table')

    local out = {}

    table.foreach(tabl, function(key, value)
        if value then
            table.insert(out, value)
        end
    end)

    return out
end

-- _:concat(tabl, [size=1])
-- creates new `tabl` concatenating with incoming tables
--  and/or values
--
-- @param  table(tabl)   - table to process
-- @param  mixed([...])  - values to append
-- @return table
function _:concat(tabl, ...)
    tabl = _:assertArgument('tabl', tabl, 'table')

    local out = _:clone(tabl)

    table.foreach({...}, function(k1, v1)
        if type(v1) == 'table' then
            table.foreach({ unpack(v1) }, function(k1, v2)
                table.insert(out, v2)
            end)
        else
            table.insert(out, v1)
        end
    end)

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

-- _:differenceBy(tabl, [values], [iteratee])
-- creates new `tabl` with incoming values not included
--
-- @param  table(tabl)         - table to process
-- @param  table(other)        - compare table
-- @param  function(iteratee)  - func to ivoke per element
-- @return table
function _:differenceBy(tabl, other, iteratee)
    tabl     = _:assertArgument('tabl', tabl, 'table')
    other    = _:assertArgument('other', other, 'table', {})
    iteratee = _:assertArgument('iteratee', iteratee, 'function', _.D['iteratee'])

    -- TODO: ...
end

-- _:differenceWith(tabl, [values], [iteratee])
-- creates new `tabl` with incoming values not included
--
-- @param  table(tabl)          - table to process
-- @param  table(other)         - compare table
-- @param  function(comparator) - comparator ivoked per element
-- @return table
function _:differenceWith(tabl, other, comparator)
    tabl       = _:assertArgument('tabl', tabl, 'table')
    other      = _:assertArgument('other', other, 'table', {})
    comparator = _:assertArgument('comparator', comparator, 'function', _.D['function'])

    -- TODO: ...
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

    -- redirect when `num` is negative..
    if num < 0 then
        return _:dropRight(tabl, _.abs(num))
    end

    local out = {}
    local idx = 0

    table.foreach(tabl, function(k, v)
        idx = idx + 1

        if idx > num then
            rawset(out, k, v)
        end
    end)

    return out
end

-- _:dropRight(tabl, [n=1])
-- creates new `tabl` dropping `num` of elements from end
--
--  notes:
--    - negative `num` redirects to `_:drop`
--
-- @param  table(tabl)  - table to process
-- @param  number(num)  - number of elements to drop
-- @return table
function _:dropRight(tabl, num)
    tabl = _:assertArgument('tabl', tabl, 'table')
    num  = _:assertArgument('num', num, 'number', 1)

    -- redirect when `num` is negative..
    if num < 0 then
        return _:drop(tabl, _:abs(num))
    end

    local out = _:tableCopy(tabl)
    local idx = 0

    while num > 0 do
        table.remove(out)
        num = num - 1
    end

    return out
end

-- _:dropWhile(tabl, [predicate=function])
-- creates new `tabl` excluding items from beginning
-- elements will be dropped until `predicate` is falsey
--
-- @param  table(tabl)         - table to process
-- @param  function(predicate) - predicate ivoked per element
-- @return table
function _:dropWhile(tabl, predicate)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    predicate = _:assertArgument('predicate', predicate, 'function', _.D['function'])

    -- TODO: ...
end

-- _:dropWhileRight(tabl, [predicate])
-- creates new `tabl` excluding items from end
-- elements will be dropped until `predicate` is falsey
--
-- @param  table(tabl)         - table to process
-- @param  function(predicate) - function ivoked per element
-- @return table
function _:dropWhileRight(tabl, predicate)
    tabl      = _:assertArgument('tabl', tabl, 'table')
    predicate = _:assertArgument('predicate', predicate, 'function', _.F['function'])

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
        if type(v1) == 'table' then
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
function _:findIndex(tabl, predicate, fromIndex)
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

    local function flatten(out, values)
        table.foreach(values, function(k, v)
            if type(v) == 'table' then
                flatten(out, v)
            else
                table.insert(out, v)
            end
        end)

        return out
    end

    return flatten({}, tabl)
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