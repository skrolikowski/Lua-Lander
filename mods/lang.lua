--
-- Lang Functions
--
local __re   = require("re")
local __type = type
local __next = next

-- local functions
-- ref: https://web.archive.org/web/20131225070434/http://snippets.luacode.org/snippets/Deep_Comparison_of_Two_Values_3
local function __deepcompare(t1, t2, ignore_mt)
    -- native check
    if not _:isTable(t1) or not _:isTable(t2) then
        return t1 == t2
    end

    -- respect metatable `__eq` check, if found..
    local mt = getmetatable(v1)
    if not ignore_mt and mt and mt.__eq then
        return t1 == t2
    end

    -- test t1 == t2
    for k1, v1 in pairs(t1) do
        if t2[k1] == nil or not __deepcompare(v1, t2[k1]) then
            return false
        end
    end

    -- test t2 == t1
    for k2, v2 in pairs(t2) do
        if t1[k2] == nil or not __deepcompare(t1[k2], v2) then
            return false
        end
    end

    return true
end


-- _:isArray(var)
-- Determines if `var` is an `array`
--  (e.g. contains no named-indexes).
--
-- Note:
-- [Array](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/array.md) functions will always use `ipairs`
--
-- @param  mixed(var)
-- @return boolean
function _:isArray(var)
    if not _:isTable(var) then return false end
    if     _:isEmpty(var) then return false end
    -- note: cannot be determined if "empty"
    return #var == _:size(var)
end

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
    if     _:isTable(var)   then return __next(var) == nil
    elseif _:isBoolean(var) then return var == false
    elseif _:isString(var)  then return var == ''
    elseif _:isNumber(var)  then return var == 0
    end
    -- TODO: what about other types?
    return var == nil
end

-- _:isEqual(var1, var2)
-- Determines if `var1 == var2`, with tables
--  undergoing recursive equality.
--
-- Notes:
-- * Lua's native equality operator tests data types.
-- * `metatable __eq` functions are respected.
--
-- @param  mixed(value)
-- @param  mixed(other)
-- @return boolean
function _:isEqual(var1, var2)
    return __deepcompare(var1, var2)
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

-- _:isNaN(var)
-- Determines if `var` is not a `number`.
--
-- @param  mixed(var)
-- @return boolean
function _:isNaN(var)
    return not _:isNumber(var)
end

-- _:isNegative(var)
-- Determines if `var` is a negative number.
--
-- @param  mixed(var)
-- @return boolean
function _:isNegative(var)
    if not _:isNumber(var) then
        return false
    end

    return var < 0
end

-- _:isNil(var)
-- Determines if `var` is nil.
--
-- @param  mixed(var)
-- @return boolean
function _:isNil(var)
    return var == nil
end

-- _:isNotNil(var)
-- Determines if `var` is not nil.
--
-- @param  mixed(var)
-- @return boolean
function _:isNotNil(var)
    return var ~= nil
end

-- _:isNumber(var)
-- Determines if `var` is a number.
--
-- @param  mixed(var)
-- @return boolean
function _:isNumber(var)
    return __type(var) == 'number'
end

-- _:isPositive(var)
-- Determines if `var` is a positive number (including 0).
--
-- @param  mixed(var)
-- @return boolean
function _:isPositive(var)
    if not _:isNumber(var) then
        return false
    end

    return var >= 0
end

-- _:isRegex(var)
-- Alias for [_:isRegexPattern](#isRegexPattern).
--
-- @param  mixed(var)
-- @return boolean
function _:isRegex(var)
    return _:isRegexPattern(var)
end

-- _:isRegexPattern(var)
-- Determines if `var` is a regex pattern.
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
    if not _:isArray(var) then return false end
    if     _:isEmpty(var) then return false end
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
-- Determines if `var` is a set (e.g. a table with
--  named indexes for uniqueness; order is not important).
--
-- Note:
-- For the definition of a "set" we are using
--  [this reference](https://www.lua.org/pil/11.5.html).
--
-- @param  mixed(var)
-- @return boolean
function _:isSet(var)
    if not _:isArray(var) then return false end
    if     _:isEmpty(var) then return false end
    -- cannot be determined if "empty"
    return _:isEqual(var, _:unique(var))
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

-- _:isZero(var)
-- Determines if `var` equals zero.
--
-- @param  mixed(var)
-- @return boolean
function _:isZero(var)
    return var == 0
end
