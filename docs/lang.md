## Lang Functions

```bash
> _:isAssociative(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L23-L29)</small>

Determines if `var` is an associative table, with every element having a key/value pair.

> **Note:** see [_:isIndexed(var)](#isIndexed) where every element has values with index keys.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a boolean, else `false`.

#### Example

```bash
> _:isAssociative({})                # => false
> _:isAssociative({a = 1, 2, 'c'})   # => false
> _:isAssociative({a = 1, b = 2})    # => true
```



---

```bash
> _:isBoolean(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L74-L76)</small>

Determines if `var` is a boolean value.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a boolean, else `false`.

#### Example

```bash
> _:isBoolean(true)     # => true
> _:isBoolean('true')   # => false
```



---

```bash
> _:isEmpty(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L83-L95)</small>

Determines if `var` is an empty value.

> **Terminology:**
>
> Empty `string` value   = `''`
> Empty `boolean` value = `false`
> Empty `number` value   = `0`
> Empty `table` value     = `{}`
>
> Everything else is "empty" if == `nil`.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is empty, else `false`.

#### Example

```bash
# String tests
> _:isEmpty('')          # => true
> _:isEmpty('abc')       # => false

# Boolean tests
> _:isEmpty(false)       # => true
> _:isEmpty(true)        # => false

# Number tests
> _:isEmpty(0)           # => true
> _:isEmpty(1)           # => false

# Table tests
> _:isEmpty({})          # => true
> _:isEmpty({1, 2, 3})   # => false

# Everything else
> _:isEmpty(nil)         # => true
```



---

```bash
> _:isFalsey(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L102-L108)</small>

Determines if `var` is a falsey value (e.g. `nil`, `false`).

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is falsey, else `false`.

#### Example

```bash
> _:isFalsey(nil)     # => true
> _:isFalsey(false)   # => true
> _:isFalsey('abc')   # => false
```



---

```bash
> _:isFunction(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L115-L117)</small>

Determines if `var` is a `function`.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a `function`, else `false`.

#### Example

```bash
> _:isFunction(function() return 'Hello World!' end)   # => true
> _:isFunction('Hello World!')                         # => false
```



---

```bash
> _:isIndexed(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L132-L138)</small>

Determines if `var` is an indexed `table`, with every element having an index keys.

> Note:** see [_:isAssociative(var)](#isAssociative) where every element has values with index keys.

---

```bash
> _:isNaN(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L145-L147)</small>

Determines if `var` is not a `number`.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is not a `number`, else `false`.

#### Example

```bash
> _:isNaN('123')   # => true
> _:isNaN(123)     # => false
```



---
```bash
> _:isNegative(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L154-L160)</small>

Determines if `var` is a negative number.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a negative number, else `false`.

#### Example

```bash
> _:isNumber('abc')     # => false)
> _:isNumber(-2)        # => true)
> _:isNumber(3)         # => false)
```



---

```bash
> _:isNil(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L167-L169)</small>

Determines if `var` is nil.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is nil, else `false`.

#### Example

```bash
> _:isNil('abc')   # => false
> _:isNil(nil)     # => true
```



---

```bash
> _:isNumber(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L176-L178)</small>

Determines if `var` is a `number` value.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a `number`, else `false`.

#### Example

```bash
> _:isNumber('abc')   # => false
> _:isNumber(42)      # => true
```



---
```bash
> _:isPositive(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L185-L191)</small>

Determines if `var` is a positive number.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a positive number, else `false`.

#### Example

```bash
> _:isNumber('abc')   # => false
> _:isNumber(-2)      # => false
> _:isNumber(3)       # => true
```



---

```bash
> _:isRegexPattern(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L198-L200)</small>

Determines if `var` is a regex pattern.

> Read more about regex patterns [here](https://www.lua.org/manual/5.3/manual.html#6.4.1).

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a regex pattern, else `false`.

#### Example

```bash
> _:isRegexPattern('abc')     # => false
> _:isRegexPattern('^abc')    # => false
> _:isRegexPattern('[abc]')   # => true
> _:isRegexPattern('%a+')     # => true
```


---

```bash
> _:isSequence(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L208-L224)</small>

Determines if `var` is a sequence (e.g. an ordered, indexed table).

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a sequence, else `false`.

#### Example

```bash
> _:isSequence({1, 3, 5, 6, 7})        # => true
> _:isSequence({a = 1, b = 3, 4, 8})   # => false
> _:isSequence({1, 4, 2, 10, 6})       # => false
```



---

```bash
> _:isSet(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L233-L238)</small>

Determines if `var` is a set (e.g. an indexed table, with a unique set of elements in any order).

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a set, else `false`.

#### Example

```bash
> _:isSet({3, 3, 5, 6, 6})        # => false
> _:isSet({a = 1, b = 3, 4, 8})   # => false
> _:isSet({1, 4, 2, 10, 6})       # => true
```



---

```bash
> _:isString(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L245-L247)</small>

Determines if `var` is a `string` value.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a `string`, else `false`.

#### Example

```bash
> _:isString('abc')    # => true
> _:isString(42)       # => false
```



---

```bash
> _:isTable(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L254-L256)</small>

Determines if `var` is a `table` value.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a `table`, else `false`.

#### Example

```bash
> _:isString('abc')              # => false
> _:isString({'a', 'b', 'c'})    # => true
```



---

```bash
> _:isThread(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L263-L265)</small>

Determines if `var` is a `thread` value.

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is a `thread`, else `false`.

#### Example

```bash
> _:isThread('I am a thread!')                   # => false
> _:isThread(coroutine.create(function() end))   # => true
```




---

```bash
> _:isTruthy(var)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/lang.lua#L272-L278)</small>

Determines if `var` is a truthy value (e.g. NOT `nil`, `false`).

#### Arguments

`mixed(var)` - Variable to check.

#### Returns

`boolean` - Returns `true` if value is truthy, else `false`.

#### Example

```bash
> _:isTruthy(nil)     # => false
> _:isTruthy(false)   # => false
> _:isTruthy('abc')   # => true
```
