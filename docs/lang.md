## Lang Functions

```bash
> _:isAssociative(var)
```

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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
> _:isFunction(var)
```

<small>[source]() | v0.1-1</small>

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

Determines if `var` is an indexed `table`, with every element having an index keys.

> Note:** see [_:isAssociative(var)](#isAssociative) where every element has values with index keys.

---

```bash
> _:isNaN(var)
```

<small>[source]() | v0.1-1</small>

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
> _:isNil(var)
```

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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
> _:isSequence(var)
```

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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

<small>[source]() | v0.1-1</small>

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
> _:isRegexPattern(var)
```

<small>[source]() | v0.1-1</small>

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
> _:isThread(var)
```

<small>[source]() | v0.1-1</small>

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

