--
-- Lang Functions
--
local __re   = require("re")
local __type = type
local __next = next


-- _:isAssociative(var)
-- Determines if `var` is an associative
--  table, with every element having a
--  key/value pair.
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
    if not _:isTable(var) then return false end
    if     _:isEmpty(var) then return false end
    -- cannot be determined if "empty"

    return #var == 0 and _:size(var) > 0
end

-- _:eq(value, other)
-- SameValueZero comparison
--
-- @param  mixed(value)
-- @param  mixed(other)
-- @return boolean
-- function _:eq(value, other)
--     return value == other
-- end

-- _:isEqual(value, other)
-- performs deep equality comparison between
--  `value` and `other`
--
-- @param  mixed(value)
-- @param  mixed(other)
-- @return boolean
-- function _:isEqual(value, other)
--     local valueType = __type(value), _:size(valueType)
--     local otherType = __type(other), _:size(valueType)
--     local equal     = true

--     if valueType ~= otherType then
--         return false
--     end

--     if valueType == 'table' then

--         return _:isEqual()
--     end

--     local function equality()
--     end

--     return true
-- end

-- _:isBoolean(var)
-- performs check on if `var` is a native
--  Lua `boolean` data type
--
-- @param  mixed(var)
-- @return boolean
function _:isBoolean(var)
    return __type(var) == 'boolean'
end

-- _:isEmpty(var)
-- Determines if `var` is an "empty value".
--
-- @param  mixed(var)
-- @return boolean
function _:isEmpty(var)
    if _:isTable(var) then
        return __next(var) == nil
    elseif _:isBoolean(var) then
        return var == false
    elseif _:isString(var) then
        return var == ''
    elseif _:isNumber(var) then
        return var == 0
    end
    -- TODO: what about other types?
    return var == nil
end

-- _:isFalsey(var)
-- Determines if `var` is a falsey value (e.g. `nil`, `false`).
--
-- @param  mixed(var)
-- @return boolean
function _:isFalsey(var)
    if var then
        return false
    end

    return true
end

-- _:isFunction(var)
-- Determines if `var` is a `function`.
--
-- @param  mixed(var)
-- @return boolean
function _:isFunction(var)
    return __type(var) == 'function'
end

-- _:isIndexed(var)
-- Determines if `var` is an indexed table,
--  with every element having an index keys.
--
-- note:
--  => indexed    - numeric indexes
--     assocative - named indexes
--
-- important:
--  for assocative tables we use `ipairs`
--
-- @param  mixed(var)
-- @return boolean
function _:isIndexed(var)
    if not _:isTable(var) then return false end
    if     _:isEmpty(var) then return false end
    -- cannot be determined if "empty"

    return #var == _:size(var)
end

-- _:isNaN(var)
-- Determines if `var` is not a `number`.
--
-- @param  mixed(var)
-- @return boolean
function _:isNaN(var)
    return not _:isNumber(var)
end

-- _:isNil(var)
-- Determines if `var` is nil.
--
-- @param  mixed(var)
-- @return boolean
function _:isNil(var)
    return var == nil
end

-- _:isNumber(var)
-- Determines if `var` is a number.
--
-- @param  mixed(var)
-- @return boolean
function _:isNumber(var)
    return __type(var) == 'number'
end

-- _:isRegexPattern(var)
-- performs check on if `var` is a regex pattern
--
-- @param  mixed(var)
-- @return boolean
function _:isRegexPattern(var)
    return pcall(function() __re.compile(var) end)
end

-- _:isSequence(var)
-- Determines if `var` is a sequence
--  (e.g. an ordered, indexed table).
--
-- @param  mixed(var)
-- @return boolean
function _:isSequence(var)
    if not _:isIndexed(var) then return false end
    if     _:isEmpty(var)   then return false end
    -- cannot be determined if "empty"
    local prev

    for _, v in ipairs(var) do
        if prev and prev > v then
            return false
        end

        -- update `prev` for next comparison
        prev = v
    end

    return true
end

-- _:isSet(var)
-- Determines if `var` is a set (e.g. an
--  indexed table, with a unique set of elements
--  in any order).
--
-- @param  mixed(var)
-- @return boolean
function _:isSet(var)
    if not _:isIndexed(var) then return false end
    if     _:isEmpty(var)   then return false end
    -- cannot be determined if "empty"
    return #var == #_:uniq(var)
end

-- _:isString(var)
-- Determines if `var` is a `string` value.
--
-- @param  mixed(var)
-- @return boolean
function _:isString(var)
    return __type(var) == 'string'
end

-- _:isTable(var)
-- Determines if `var` is a `table` value.
--
-- @param  mixed(var)
-- @return boolean
function _:isTable(var)
    return __type(var) == 'table'
end

-- _:isThread(var)
-- Determines if `var` is a `thread` value.
--
-- @param  mixed(var)
-- @return boolean
function _:isThread(var)
    return __type(var) == 'thread'
end

-- _:isTruthy(var)
-- Determines if `var` is a truthy value (e.g. NOT `nil`, `false`).
--
-- @param  mixed(var)
-- @return boolean
function _:isTruthy(var)
    if var then
        return true
    end

    return false
end
