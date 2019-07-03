--
-- Assert Functions
--

-- _:assertArgument(name, var, expect, [default])
-- Assert `var` is am `expect`ed data type, and
--  assigns `default` if `var` = nil.
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

-- _:assertEqualSize(name, [...])
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
        local expectedSize = _:size(values[1])

        table.foreach(values, function(k, v)
            assert(expectedSize == _:size(v), 'Argument(s) `' .. name .. '` must all be of equal size.')
        end)
    end
end

-- _:assertIsBoolean(name, var)
-- Asserts `var` is of boolean data type.
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertIsBoolean(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    ---
    assert(_:isBoolean(var), 'Argument `' .. name .. '` is a `' .. type(var) .. '` but should be a `boolean`.')
end

-- _:assertIsNumber(name, var)
-- Assert if `var` is not a `number` data type.
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertIsNumber(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    ---
    assert(_:isNumber(var), 'Argument `' .. name .. '` is a `' .. type(var) .. '` but should be a `number`.')
end

-- _:assertIsRegexPattern(name, var)
-- Assert if `var` is not a regular expression pattern.
--
-- @param string(name) - identifier
-- @param mixed(var)   - variable to assert
-- @return void
function _:assertIsRegexPattern(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    assert(_:isRegexPattern(var), 'Argument `' .. name .. '` must be a valid regex pattern.')
end

-- _:assertIsString(name, var)
-- Assert if `var` is not a `string` data type.
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertIsString(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    ---
    assert(_:isString(var), 'Argument `' .. name .. '` is a `' .. type(var) .. '` but should be a `string`.')
end

-- _:assertIsTable(name, var)
-- Assert if `var` is not a `table` data type.
--
-- @param string(name) - identifier
-- @param mixed(...)   - values to assert
-- @return void
function _:assertIsTable(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    assert(var ~= nil, 'assertArgument :: `var` must have a non-nil value!')
    ---
    assert(_:isTable(var), 'Argument `' .. name .. '` is a `' .. type(var) .. '` but should be a `table`.')
end

-- _:assertMinSize(name, var, expect)
-- Assert if `var` is **<** `expect` size.
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
-- Assert if `var` is **>** `expect` size.
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

-- _:assertIsNotNil(name, var)
-- Assert if `var` is nil.
--
-- @param string(name) - identifier
-- @param mixed(var)   - variable to assert
-- @return void
function _:assertNotNil(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    assert(var ~= nil, 'Argument `' .. name .. '` must have a non-nil value.')
end

-- _:assertIsNotZero(name, var)
-- assert `var` is not 0
--
-- @param string(name) - identifier
-- @param mixed(var)   - variable to assert
-- @return void
function _:assertNotZero(name, var)
    assert(type(name) == 'string', 'assertArgument :: `name` should be a `string`!')
    ---
    assert(var ~= 0, 'Argument `' .. name .. '` should not be 0.')
end
