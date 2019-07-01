--[[
    --
    -- Helper functions to get caller information.
    --

    local __getCaller = function()
        local info     = debug.getinfo(4, "Sl")
        local source   = string.gsub(info.source, "@", "")
        local lineNum  = 0
        local lineData = false

        for line in io.lines(source) do
            lineNum  = lineNum + 1
            lineData = line

            if lineNum == info.currentline then
                break
            end
        end

        return lineData
    end

    local __getCallerInfo = function()
        local pattern = "(%w+)%s*=%s*([%w_]+)[:|.]?([%w]*)%((.*)%)"
        local var, f1, f2, args = string.match(__getCaller(), pattern)
        local out = {
            var  = var,
            cls  = f2 ~= '' and f1 or nil,
            func = f2 ~= '' and f2 or f1,
            arg  = {}
        }

        -- arguments
        for arg in string.gmatch(args , "[^%s,()]+" ) do
           table.insert(out['arg'], arg)
        end

        return out
    end
]]--


--

-- _:assertIsNotNil(name, var)
-- assert `var` is not nil
--
-- @param string(name) - identifier
-- @param mixed(var)   - variable to assert
-- @return void
function _:assertNotNil(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    assert(var ~= nil, 'Argument `' .. name .. '` must have a non-nil value.')
end

-- _:assertIsRegexPattern(name, var)
-- assert `var` is a regex pattern
--
-- @param string(name) - identifier
-- @param mixed(var)   - variable to assert
-- @return void
function _:assertIsRegexPattern(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    assert(_:isRegexPattern(var), 'Argument `' .. name .. '` must be a valid regex pattern.')
end

-- _:assertEqual(name, [...])
-- assert list of `...` are all equal
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertEqual(name, ...)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    local values = {...}

    if #values > 0 then
        -- TODO: ...
    end
end

-- _:assertIsEqualSize(name, [...])
-- assert list of `...` are all of equal size
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertEqualSize(name, ...)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    local values = {...}

    if #values > 0 then
        -- local expectedType = type(values[1])
        local expectedSize = _:size(values[1])

        table.foreach(values, function(k, v)
            -- assert(expectedType == type(v),   'Argument(s) `' .. name .. '` must all have same type.')
            assert(expectedSize == _:size(v), 'Argument(s) `' .. name .. '` must all be of equal size.')
        end)
    end
end

-- _:assertMinSize(name, var, expect)
-- assert `var` is >= `expect`ed size
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertMinSize(name, var, expect)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    assert(type(expect) == 'number', 'assertArgument :: `expect` should be a `number`!')
    ---
    assert(_:size(var) >= expect, 'Argument `' .. name .. '` must be greater than or equal to ' .. expect .. ' in size.')
end

-- _:assertMaxSize(name, var, expect)
-- assert `var` is <= `expect`ed size
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertMaxSize(name, var, expect)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    assert(type(expect) == 'number', 'assertArgument :: `expect` should be a `number`!')
    ---
    assert(_:size(var) <= expect, 'Argument `' .. name .. '` must be less than or equal to ' .. expect .. ' in size.')
end

-- _:assertArgument(name, var, expect, [default])
-- assert argument variable is a expected data type
--
-- @param string(name)    - identifier
-- @param mixed(var)      - argument variable
-- @param string(expect)  - expected data type
-- @param mixed(default)  - default value (only if `var` == nil)
function _:assertArgument(name, var, expect, default)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(type(expect) == 'string', 'assertArgument :: `expect` should be a `string`!')
    ---

    if default then
        -- set default value, if requested..
        var = var ~= nil and var or default
    end

    local actual = type(var)

    -- assert data type is as expected..
    assert(actual == expect, 'Argument `' .. name .. '` is a `' .. actual .. '` but should be a `' .. expect .. '`.')

    return var
end