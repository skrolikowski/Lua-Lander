--
-- String Functions
--

-- Native lua API pre-loaded for speed..
local __find    = string.find     -- returns position of first pattern in string
local __gsub    = string.gsub
local __len     = string.len
local __lower   = string.lower    -- returns string with all chars lowercase
local __rep     = string.rep      -- returns string of repeating chars
local __reverse = string.reverse  -- returns string in reverse
local __sub     = string.sub      -- returns substring in specified range
local __upper   = string.upper    -- returns string with all chars uppercase

-- _:camelCase(str)
-- converts `str` to camel case
--
-- @param  string(str)
-- @return string
function _:camelCase(str)
    str = _:assertArgument('str', str, 'string')
    --
    local words = _:words(__lower(str))
    local out   = ''

    table.foreach(words, function(idx, word)
        out = out .. (idx == 1 and word or _:capitalize(word))
    end)

    return out
end

-- _:capitalize(str)
-- convert first letter of each word of `str`
--  to upper case and remaining to lowercase
--
-- @param  string(str)
-- @return string
function _:capitalize(str)
    str = _:assertArgument('str', str, 'string')
    --
    str = __lower(str)                      -- lower case entire string
    str = __gsub(str, '%f[%a]%a', __upper)  -- perform capitalize

    return str
end

-- _:endsWith(str, target, [position=str:len()])
-- check if `str` ends with `target` up until
--  end `position
--
-- @param  string(str)
-- @return boolean
function _:endsWith(str, target, position)
    str      = _:assertArgument('str', str, 'string')
    target   = _:assertArgument('target', target, 'string')
    position = _:assertArgument('position', position, 'number', str:len())
    --
    local substr = __sub(str, 0, position)

    return __find(substr, target) == substr:len()
end

-- _:kebabCase(str)
-- converts `str` to kebab case
--
-- @param  string(str)
-- @return string
function _:kebabCase(str)
    str = _:assertArgument('str', str, 'string')
    --
    str = __gsub(str, '%f[%u]', ' ')  -- separate uppercase transitions
    str = __lower(str)                -- lower case entire string

    return _:join(_:words(str), '-')  -- join `words` with `-`
end

-- _:lowerCase(str)
-- converts `str` to lower-case, space-separated words
--
-- @param  string(str)
-- @return string
function _:lowerCase(str)
    str = _:assertArgument('str', str, 'string')
    --
    str = __gsub(str, '%f[%u]', ' ')  -- separate uppercase transitions
    str = __lower(str)                -- lower case entire string

    return _:join(_:words(str), ' ')  -- join `words` with `-`
end

-- _:lowerFirst(str)
-- converts first character in `str` to lowercase
--
-- @param  string(str)
-- @return string
function _:lowerFirst(str)
    str = _:assertArgument('str', str, 'string')
    --
    return __gsub(str, '^%a', __lower)
end

-- _:pad(str, [length=0], [chars=" "])
-- pads `str` on both sides, if shorter than
--  `length`, with `chars`
--
-- @param  string(str)
-- @param  number(length)
-- @param  string(chars)
-- @return string
function _:pad(str, length, chars)
    str    = _:assertArgument('str', str, 'string')
    length = _:assertArgument('length', length, 'number', 0)
    chars  = _:assertArgument('chars', chars, 'string', ' ')
    --
    -- TODO:
end

-- _:padEnd(str, [length=0], [chars=" "])
-- pads end of `str`, if shorter than `length`,
--  with `chars`
--
-- @param  string(str)
-- @param  number(length)
-- @param  string(chars)
-- @return string
function _:padEnd(str, length, chars)
    str    = _:assertArgument('str', str, 'string')
    length = _:assertArgument('length', length, 'number', 0)
    chars  = _:assertArgument('chars', chars, 'string', ' ')
    --
    -- TODO:
end

-- _:padStart(str, [length=0], [chars=" "])
-- pads beginning of `str`, if shorter than `length`,
--  with `chars`
--
-- @param  string(str)
-- @param  number(length)
-- @param  string(chars)
-- @return string
function _:padStart(str, length, chars)
    str    = _:assertArgument('str', str, 'string')
    length = _:assertArgument('length', length, 'number', 0)
    chars  = _:assertArgument('chars', chars, 'string', ' ')
    --
    -- TODO:
end

-- _:rep(str, [n=1])
-- returns new string by repeating given
--  `str` `n` times
--
-- @param  string(str)
-- @return string
function _:rep(str, n)
    str = _:assertArgument('str', str, 'string')
    n   = _:assertArgument('n', n, 'number', 1)
    --
    return __rep(str, n)
end

-- _:replace(str, pattern, [repl=""], [n])
-- returns new string by repeating given
--  `str` `n` times
--
-- @param  string(str)
-- @param  string(pattern)
-- @param  string(repl)     - replacement string
-- @param  number(n)        - n-th capture in pattern
-- @return string
function _:replace(str, pattern, repl, n)
    str     = _:assertArgument('str', str, 'string')
    pattern = _:assertArgument('pattern', pattern, 'string')
    repl    = _:assertArgument('repl', repl, 'string', '')
    --
    return __gsub(str, pattern, repl, n)
end

-- _:snakeCase(str)
-- converts `str` to snake case
--
-- @param  string(str)
-- @return string
function _:snakeCase(str)
    str = _:assertArgument('str', str, 'string')
    --
    -- maybe inefficient, but easy to follow..
    str = __gsub(str, '(.%f[%u])', '%0_')  -- convert uppercase transitions to `_`
    str = __gsub(str, '[%p%s]+', '_')      -- convert punctuations to `_`
    str = _:trim(str, '_')                 -- trim leading/trailing `_` chars

    return __lower(str)                    -- lower-case string
end

-- _:split(str, separator, [limit=str:len()])
-- splits `str` by `separator`, truncated by `limit` elements
--
-- @param  string(str)
-- @return string
function _:split(str, separator, limit)
    str       = _:assertArgument('str', str, 'string')
    separator = _:assertArgument('separator', separator, 'string')
    --
    local elements = _:words(str, '[^-]')
    local length   = _:size(elements)
    --
    limit = _:assertArgument('limit', limit, 'number', length)
    --
    return _:dropRight(elements, length - limit)
end

-- _:startCase(str)
-- converts `str` to start case
--
-- @param  string(str)
-- @return string
function _:startCase(str, target, position)
    str = _:assertArgument('str', str, 'string')
    --
    str = __gsub(str, '%f[%u]', ' ')  -- separate uppercase transitions

    local words = _:words(str)
    local out   = ''

    table.foreach(words, function(idx, word)
        if idx == 1 then
            out = out .. _:upperFirst(word)
        else
            out = out .. ' ' .. _:upperFirst(word)
        end
    end)

    return out
end

-- _:startsWith(str, target, [position=1])
-- check if `str` begins with `target` starting
--  at `position`
--
-- @param  string(str)
-- @param  string(target)
-- @param  number(position)
-- @return string
function _:startsWith(str, target, position)
    str      = _:assertArgument('str', str, 'string')
    target   = _:assertArgument('target', target, 'string')
    position = _:assertArgument('position', position, 'number', 1)
    --
    return __find(__sub(str, position), target) == 1
end

-- _:toLower(str, [pattern="%s+"])
-- converts entire `str` to lower case
--
-- @param  string(str)
-- @return string
function _:toLower(str)
    str = _:assertArgument('str', str, 'string')
    --
    return __lower(str)
end

-- _:toUpper(str)
-- converts entire `str` to upper case
--
-- @param  string(str)
-- @return string
function _:toUpper(str)
    str = _:assertArgument('str', str, 'string')
    --
    return __upper(str)
end

-- _:trim(str, [pattern=""])
-- removes leading and trailing `pattern` of `str`
--
-- @param  string(str)
-- @param  string(pattern)
-- @return string
function _:trim(str, pattern)
    str = _:trimStart(str, pattern)
    str = _:trimEnd(str, pattern)

    return str
end

-- _:trimEnd(str, [pattern="%s+"])
-- removes trailing `pattern` of `str`
--
-- @param  string(str)
-- @param  string(pattern)
-- @return string
function _:trimEnd(str, pattern)
    str     = _:assertArgument('str', str, 'string')
    pattern = _:assertArgument('pattern', pattern, 'string', '%s+')
    --
    if _:isRegexPattern(pattern) then
        return _:replace(str, pattern .. '$', '')
    else
        return _:replace(str, '[' .. pattern .. ']+$', '')
    end
end

-- _:trimStart(str, [pattern="%s+"])
-- removes leading `pattern` or `str`
--
-- @param  string(str)
-- @param  string(pattern)
-- @return string
function _:trimStart(str, pattern)
    str     = _:assertArgument('str', str, 'string')
    pattern = _:assertArgument('pattern', pattern, 'string', '%s+')
    --
    if _:isRegexPattern(pattern) then
        return _:replace(str, '^' .. pattern, '')
    else
        return _:replace(str, '^[' .. pattern .. ']+', '')
    end
end

-- _:truncate(str, [options={}])
-- truncates `str` with `options`
--
-- options:
-- - number(length=30)       -- truncate length
-- - string(separator)       -- pattern to truncate to
-- - string(omission='...')  -- omitted text symbol
--
-- @param  string(str)
-- @return string
function _:truncate(str, options)
    str = _:assertArgument('str', str, 'string')
    options = {
        length    = _:assertArgument('length', length, 'number', 30),
        separator = _:assertArgument('separator', separator, 'string', ''),
        omission  = _:assertArgument('omission', omission, 'string', '...')
    }
    --
    local separator = options.separator
    local omission  = options.omission
    local length    = options.length - __len(omission)

    if separator ~= '' then
        local len
        len = __find(str, separator)  -- find first occurrence of `separator`
        len = len - 1              -- offset index
        length = math.min(length, len)
    end


    str = __sub(str, 1, length)
    str = str .. omission

    return str
end

-- _:upperFirst(str)
-- converts first character in `str` to lowercase
--
-- @param  string(str)
-- @return string
function _:upperFirst(str)
    str = _:assertArgument('str', str, 'string')
    --
    return __gsub(str, '^%a', __upper)
end

-- _:words(str, [pattern])
-- converts `str` into table of words,
--  using `pattern` as matcher
--
-- @param  string(str)
-- @param  string(pattern)
-- @return table
function _:words(str, pattern)
    str     = _:assertArgument('str', str, 'string')
    pattern = _:assertArgument('pattern', pattern, 'string', '%a+')
    _:assertIsRegexPattern('pattern', pattern)
    --
    local words = {}

    for match in string.gmatch(str, pattern) do
        table.insert(words, match)
    end

    return words
end