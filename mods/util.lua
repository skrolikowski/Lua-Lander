--
-- Util Functions
--

-- _:clone(value)
-- shallow clone of iterable
function _:clone(value)
    return { unpack(value) }
end

-- _:cloneDeep(value)
-- recursive clone of iterable
function _:cloneDeep(value)
    --TODO: ...
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


-- _:default(value, [default])
-- sets `value` to `default`, only if `value` not set
--
-- @param  mixed(value)
-- @param  mixed([default])  - default value
-- @return mixed
-- function _:defaults(value, default)
--
-- end

-- _:size(value)
-- returns size of `value`
--
-- @param  mixed(value)  -- value to size
-- @return number
function _:size(value)
    local dt = type(value)

    if dt == 'string' then return value:len()           end
    if dt == 'number' then return tostring(value):len() end
    if dt == 'table'  then return #value                end
    if dt == 'function' then return string:dump(value):len() end
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