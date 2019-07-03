## Assert Functions

```bash
> _:assertArgument(name, var, expect, [default])
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L13-L29)</small>

Assert if `var` is not the `expect`ed data type, and assign `default` value if `var` is nil.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Variable to check.
`string(expect)` - Expected data type.
`mixed([default])` - Default value if `var` is nil.

#### Returns

`void` - Throws error if `var` is nil.

#### Example

```bash
# Testing for data type..
> _:assertArgument('name', 10, 'string')              # => throws error!
> _:assertArgument('age', '23', 'number')             # => throws error!
> _:assertArgument('name', 'John Doe', 'string')      # => no error
> _:assertArgument('age', 23, 'number')               # => no error

# Using `default` parameter..
> _:assertArgument('pattern', nil, 'string', '%s+')   # => '%s+'
> _:assertArgument('age', nil, 'number', 21)          # => 21

```



---

```bash
> _:assertEqual(name, ...)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L37-L45)</small>

Assert all `...` values are equal.

> **Note:** Function will check values with the `==` operator. Table elements will be tested recursively.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(...)` - Values to check.

#### Returns

`void` - Throws error if values aren't all equal.

#### Example

```bash
>
```



---

```bash
> _:assertEqualSize(name, [...])
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L53-L65)</small>

Assert if not all `...` values are the same length.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(...)` - Values to check.

#### Returns

`void` - Throws error if values are of varying size.

#### Example

```bash
> _:assertEqualSize('name', {1, 2, 3, 4}, {1, 2, 3})   # => throws error!
> _:assertEqualSize('name', 'long', 'short')           # => throws error!
> _:assertEqualSize('name', {1, 2}, {1, 2}, {1, 2})    # => no error
> _:assertEqualSize('name', 'test', 'long')            # => no error
```



---

```bash
> _:assertIsBoolean(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L73-L78)</small>

Assert if `var` is not a `boolean` data type.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value isn't a `boolean`.

#### Example

```bash
> _:assertIsBoolean('test', 'true')   # => throws error!
> _:assertIsBoolean('test', true)     # => no error
```



---

```bash
> _:assertIsNumber(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L86-L91)</small>

Assert if `var` is not a `number` data type.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value isn't a `number`.

#### Example

```bash
> _:assertIsNumber('age', 'thirty-five')   # => throws error!
> _:assertIsNumber('age', 35)              # => no error
```



---

```bash
> _:assertIsRegexPattern(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L99-L103)</small>

Assert if `var` is not a regular expression pattern.

> **Note:** Read more about Lua regular expressions [here](https://www.lua.org/manual/5.3/manual.html#6.4.1).

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value isn't a regular expression pattern.

#### Example

```bash
> _:assertIsRegexPattern('pattern', 'abc')       # => throws error!
> _:assertIsRegexPattern('pattern', '[abc]')     # => no error
> _:assertIsRegexPattern('pattern', '[^,%s+]')   # => no error
```



---

```bash
> _:assertIsString(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L111-L116)</small>

Assert if `var` is not a `string` data type.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value isn't a `string`.

#### Example

```bash
> _:assertIsString('name', 79)                # => throws error!
> _:assertIsString('name', 'Seven of Nine')   # => no error
```



---

```
> _:assertIsTable(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L124-L129)</small>

Assert if `var` is not a `table` data type.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value isn't a `table`.

#### Example

```bash
> _:assertIsTable('name', 'abc')             # => throws error!
> _:assertIsTable('name', {'a', 'b', 'c'})   # => no error
```



---

```bash
_:assertMinSize(name, var, expect)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L137-L143)</small>

Assert if `var` is **<** `expect` size.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.
`number(expect)` - Expected minimum size.

#### Returns

`void` - Throws error if value is **<** `expect` size.

#### Example

```bash
> _:assertMinSize('age', 20, 21)   # => throws error!
> _:assertMinSize('age', 21, 21)   # => no error
> _:assertMinSize('age', 22, 21)   # => no error
```



---

```bash
> _:assertMaxSize(name, var, expect)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L151-L157)</small>

Assert if `var` is **>** `expect` size.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.
`number(expect)` - Expected maximum size.

#### Returns

`void` - Throws error if value is **>** `expect` size.

#### Example

```bash
> _:assertMaxSize('age', 22, 21)   # => throws error!
> _:assertMaxSize('age', 21, 21)   # => no error
> _:assertMaxSize('age', 20, 21)   # => no error
```



---

```bash
> _:assertIsNotNil(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L165-L169)</small>

Assert if `var` is nil.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value is nil.

#### Example

```bash
> _:assertNotNil('name', nil)   # => throws error!
> _:assertNotNil('name', 10)    # => no error
```



---

```bash
> _:assertIsNotZero(name, var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/assert.lua#L177-L181)</small>

Assert if `var` is 0.

#### Arguments

`string(name)` - Field identifier for error response.
`mixed(var)` - Value to check.

#### Returns

`void` - Throws error if value is 0.

#### Example

```bash
> _:assertNotZero('name', 0)    # => throws error!
> _:assertNotZero('name', 10)   # => no error
```

