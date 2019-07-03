--
-- Util Functions
--
local __len    = string.len
local __type   = type
local __unpack = unpack


-- _:clone(value)
-- Create shallow copy of `value`.
--
-- @param  mixed(value)
-- @return mixed
function _:clone(value)
    if not _:isTable(value) then
        return value
    end

    local out = {}

    table.foreach(value, function(k, v)
        rawset(out, k, v)
    end)

    return out
end

-- _:cloneDeep(value)
-- Create deep copy of `value`.
--
-- @param  mixed(value)
-- @return mixed
function _:cloneDeep(value)
    if not _:isTable(value) then
        return value
    end

    local out = {}

    table.foreach(value, function(k, v)
        if v == 'table' then
            rawset(out, k, _:clone(v))
        else
            rawset(out, k, v)
        end
    end)

    return out
end

-- _:cloneDeepWith(value, [customizer])
-- recursive clone of iterable
-- with `customizer`
function _:cloneDeepWith(value, customizer)
    --TODO: ...
end

-- _:cloneWith(value, [customizer])
-- shallow clone of iterable
-- with `customizer`
function _:cloneWith(value, customizer)
    --TODO: ...
end


-- _:defaultTo(value, default)
-- Sets `value` to `default`, only if `value` not set
--
-- @param  mixed(value)
-- @param  mixed(default)
-- @return mixed
function _:defaultTo(value, default)
    if _:isNil(value) then
        return default
    end

    return value
end

-- _:size(value)
-- Calculates size of `value`.
--
-- @param  mixed(value)
-- @return number
function _:size(value)
    local dt = __type(value)

    if dt == 'string' then return __len(value) end
    if dt == 'number' then return value        end
    if dt == 'table'  then
        local size = 0
        table.foreach(value, function(k, v) size = size + 1 end)
        return size
    end
    --TODO: what about the others??
    return nil
end





--

-- Defaults table
_.D = {}
_.D['boolean']  = false
_.D['string']   = ''
_.D['number']   = 0
_.D['function'] = (function(v) return v end)
_.D['iteratee'] = (function(v) return v end)

-- Truthy table
_.T = {}
_.T['boolean']  = true
_.T['number']   = 1
_.T['function'] = (function() return true end)

-- Falsey table
_.F = {}
_.F['boolean']  = _.D['boolean']
_.F['string']   = _.D['string']
_.F['number']   = _.D['number']
_.F['function'] = (function() return false end)