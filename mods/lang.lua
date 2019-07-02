--
-- Lang Functions
--
local re = require("re")


-- SameValueZero comparison
function _:eq(value, other)
    return value == other
end

-- > comparison
function _:gt(value, other)
    --TODO: ...
end

-- >= comparison
function _:gte(value, other)
    --TODO: ...
end

-- _:isEqual(value, other)
-- performs deep equality comparison between
--  `value` and `other`
--
-- @param  mixed(value)
-- @param  mixed(other)
-- @return boolean
function _:isEqual(value, other)
    local valueType = type(value), _:size(valueType)
    local otherType = type(other), _:size(valueType)
    local equal     = true

    if valueType ~= otherType then
        return false
    end

    if valueType == 'table' then

        return _:isEqual()
    end

    local function equality()
    end

    return true
end

-- _:isNil(var)
-- performs check on if `var` is nil
--
-- @param  mixed(var)
-- @return boolean
function _:isNil(var)
    return var == nil
end

-- _:isTable(var)
-- performs check on if `var' is a native
--  Lua `table` data type
--
-- note:
--  a `table` is a collection of [key/]value pairs,
--   which are iterable
--
-- @param  mixed(var)
-- @return boolean
function _:isTable(var)
    return type(var) == 'table'
end

-- _:isBoolean(var)
-- performs check on if `var` is a native
--  Lua `boolean` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isBoolean(var)
    return type(var) == 'boolean'
end

-- _:isBoolean(var)
-- performs check on whether `var` is
--  an empty value
--
-- @param  mixed(var)
-- @return boolean
function _:isEmpty(var)
    if _:isIterable(var) then
        return next(var) == nil
    elseif _:isString(var) then
        return var == ''
    end
    -- TODO: what about other types?
    return false
end

-- _:isNumber(var)
-- performs check on if `var` is a native
--  Lua `number` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isNumber(var)
    return type(var) == 'number'
end

-- _:isNumber(var)
-- performs check on if `var` is not a
-- native Lua `number` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isNaN(var)
    return not _:isNumber(var)
end


-- _:isFunction(var)
-- performs check on if `var` is a native
--  Lua `function` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isFunction(var)
    return type(var) == 'function'
end

-- _:isString(var)
-- performs check on if `var` is a native
--  Lua `string` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isString(var)
    return type(var) == 'string'
end

-- _:isIterable(var)
-- performs check on if `var` is iterable
--
-- note:
--  Lua's native `table` data type is the only
--  iterable data type
--
-- @param  mixed(var)
-- @return boolean
function _:isIterable(var)
    return _:isTable(var)
end

-- _:isIndexed(var)
-- performs check on if `var` is an "indexed" iterable
--
-- note:
--  => indexed    - numeric indexes
--     assocative - named indexes
--
-- important:
--  for indexed tables we use `ipairs`
--
-- @param  mixed(var)
-- @return boolean
function _:isIndexed(var)
    if not _:isIterable(var) then
        return false
    end

    --TODO: ...
end

-- _:isAssociative(var)
-- performs check on if `var` is an "associative" iterable
--
-- note:
--     indexed    - numeric indexes
--  => assocative - named indexes
--
-- important:
--  for assocative tables we use `pairs`
--
-- @param  mixed(var)
-- @return boolean
function _:isAssociative(var)
    if not _:isIterable(var) then
        return false
    end

    --TODO: ...
end

-- _:isSequence(var)
-- performs check on if `var` is a sequence
--
-- definition:
--  `sequence` - an ordered list of values
--
-- @param  mixed(var)
-- @return boolean
function _:isSequence(var)
    if not _:isIndexed() then
        return false
    end

    --TODO: ...
end

-- _:isMap(var)
-- performs check on if `var` is a map
--
-- definition:
--  `map` - an associative array with key and value pairs
--
-- @param  mixed(var)
-- @return boolean
function _:isMap(var)
    return _:isAssociative()
end

-- _:isSet(var)
-- performs check on if `var` is a set
--
-- definition:
--  `set` - an indexed array of values; unordered
--
-- @param  mixed(var)
-- @return boolean
function _:isSet(var)
    if not _:isIndexed() then
        return false
    end

    --TODO: ...
end

-- _:isUserdata(var)
-- performs check on if `var` is a native
--  Lua `userdata` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isUserdata(var)
    return type(var) == 'userdata'
end

-- _:isRegexPattern(var)
-- performs check on if `var` is a regex pattern
--
-- @param  mixed(var)
-- @return boolean
function _:isRegexPattern(var)
    return pcall(function() re.compile(var) end)
end

-- < comparison
function _:lt(value, other)
    --TODO: ...
end

-- <= comparison
function _:lte(value, other)
    --TODO: ...
end

-- _:toNumber(value, [base])
-- casts `value` as native Lua `number` data type
--  if not already one
--
-- @param  mixed(value)
-- @param  number(base)
-- @return table
function _:toNumber(value)
    value = _:assertNotNil('value', value)
    base  = _:assertArgument('base', base, 'number', 0)
    --
    return tonumber(value, base)
end

-- _:toString(value)
-- casts `value` as native Lua `string` data type
--  if not already one
--
-- @param  mixed(value)
-- @return table
function _:toString(value)
    value = _:assertNotNil('value')
    --
    return tostring(value)
end

-- _:toTable(value)
-- casts `value` as native Lua `table` data type
--  if not already one
--
-- @param  mixed(value)
-- @return table
function _:toTable(value)
    value = _:assertNotNil('value', value)
    --
    --TODO: ...
end