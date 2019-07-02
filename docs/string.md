## String Functions

```bash
> _:camelCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to [Camel Case](https://en.wikipedia.org/wiki/Camel_case).

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new camel cased string.

#### Example

```bash
> _:camelCase('Foo Bar')       # => 'fooBar'
> _:camelCase('--foo-bar--')   # => 'fooBar'
> _:camelCase('__FOO_BAR__')   # => 'fooBar'
```



---

```bash
> _:capitalize(str)
```

<small>[source]() | v0.1-1</small>

Capitalizes first character of `str` and lower cases the rest.

#### Arguments

`string(str)` - The string to capitalize.

#### Returns

`string` - A new capitalized string.

#### Example

```bash
> _:capitalize('FOO')      # => 'Foo'
> _:capitalize('fooBar')   # => 'Foobar'
```



---

```bash
> _:endsWith(str, target, [position=_:size(str)])
```

<small>[source]() | v0.1-1</small>

Determines if `str` ends with `target` up until the end `position`.

#### Arguments

`string(str)` - The string to inspect.
`string(target)` - The string to search for.
`number(position=_:size(str))` - 

> See: [_:size(str)]()

#### Returns

`boolean` - Returns `true` if string ends in target, else `false`.

#### Example

```bash
> _:endsWith('abc', 'c')      # => true
> _:endsWith('abc', 'b')      # => false
> _:endsWith('abc', 'b', 2)   # => true
```



---

```
_:kebabCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to [Kebab Case](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles).

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new kebab-cased string.

#### Example

```bash
> _:kebabCase('Foo Bar')       # => 'foo-bar'
> _:kebabCase('fooBar')        # => 'foo-bar'
> _:kebabCase('__FOO_BAR__')   # => 'foo-bar'
```



---

```bash
> _:lowerCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to lower-case, space-separated words.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new lower-cased string.

#### Example

```bash
> _:lowerCase('---Foo-Bar--')  # => 'foo bar'
> _:lowerCase('fooBar')        # => 'foo bar'
> _:lowerCase('__FOO_BAR__')   # => 'foo bar'
```



---

```bash
> _:lowerFirst(str)
```

<small>[source]() | v0.1-1</small>

Converts first character of `str` to lowercase.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new string with first character lower-cased.

#### Example

```bash
> _:lowerFirst('Foo')   # => 'foo'
> _:lowerFirst('FOO')   # => 'fOO'
```



---

```bash
> _:pad(str, [length=0], [chars=' '])
```

<small>[source]() | v0.1-1</small>

Pads both sides of `str` with `chars`, only if `str` is smaller than `length`.

#### Arguments

`string(str)` - The string to convert.
`number(length=0)` - Desired string length.
`string([chars=' '])` - Characters to use as padding.

#### Returns

`string` - A new padded string.

#### Example

```bash
> _:pad('abc', 8)         # => '  abc   '
> _:pad('abc', 8, '_-')   # => '_-abc_-_'
> _:pad('abc', 3)         # => 'abc'
```



---

```bash
> _:padEnd(str, [length=0], [chars=' '])
```

<small>[source]() | v0.1-1</small>

Pads end of `str` with `chars`, only if `str` is smaller than `length`.

#### Arguments

`string(str)` - The string to convert.
`number(length=0)` - Desired string length.
`string([chars=' '])` - Characters to use as padding.

#### Returns

`string` - A new padded string.

#### Example

```bash
> _:padEnd('abc', 6)         # => 'abc   '
> _:padEnd('abc', 6, '_-')   # => 'abc_-_'
> _:padEnd('abc', 3)         # => 'abc'
```



---

```bash
> _:padStart(str, [length=0], [chars=' '])
```

<small>[source]() | v0.1-1</small>

Pads beginning of `str` with `chars`, only if `str` is smaller than `length`.

#### Arguments

`string(str)` - The string to convert.
`number(length=0)` - Desired string length.
`string([chars=' '])` - Characters to use as padding.

#### Returns

`string` - A new padded string.

#### Example

```bash
> _:padStart('abc', 6)         # => '   abc'
> _:padStart('abc', 6, '_-')   # => '_-_abc'
> _:padStart('abc', 3)         # => 'abc'
```



---

```bash
> _:rep(str, [n=1])
```

<small>[source]() | v0.1-1</small>

Repeats given `str` `n` number of times.

#### Arguments

`string(str)` - The string to repeat.
`number(n=1)` - Repeat count.

#### Returns

`string` - A new string with repeated  characters.

#### Example

```bash
> _:rep('*', 6)           # => '******'
> _:rep('abc', 2, '_-')   # => 'abcabc'
> _:rep('abc', 0)         # => ''
```



---

```bash
_:replace(str, pattern, repl)
```

<small>[source]() | v0.1-1</small>

Replaces matches from `pattern` in `str` with `repl` string.

> Based on native [`string.gsub`](https://www.lua.org/manual/5.1/manual.html#pdf-string.gsub) function.

#### Arguments

`string(str)` - The string to modify.
`string(pattern)` - Regular string or regex pattern.
`string(repl)` - Replacement string.
`number(n)` - n-th match.

#### Returns

`string` - A new string with modifications.

#### Example

```bash
> _:replace('Hi Fred', 'Fred', 'Barney')       # => 'Hi Barney'
> _:replace('Hello World', '(%w+)', '%1 %1')   # =>'Hello Hello World World'
> _:replace('Hello, World! Hello, Everyone!', 'Hello', 'Goodbye', 1)
  # => 'Goodbye, World! Hello, Everyone!'
```



---

```bash
> _:snakeCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to [Snake Case](https://en.wikipedia.org/wiki/Snake_case).

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new string snake-cased.

#### Example

```bash
> _:snakeCase('Foo Bar')       # => 'foo_bar'
> _:snakeCase('fooBar')        # => 'foo_bar'
> _:snakeCase('--FOO-BAR--')   # => 'foo_bar'
```



---

```bash
> :split(str, separator, [limit=_:size(str)])
```

<small>[source]() | v0.1-1</small>

Splits `str` by `separator`, truncated by `limit`.

> Uses native [`string.gmatch`](https://www.lua.org/manual/5.1/manual.html#pdf-string.gmatch) to split string into chunks.

#### Arguments

`string(str)` - The string to split.
`string(separator)` - Regex pattern to split on.
`number(limit)` - Length to truncate final string to.

#### Returns

`table` - Returns string segments.

#### Example

```bash
> _:split('a-b-c-', '-')     # => {'a', 'b', 'c'}
> _:split('a-b-c', '-', 2)   # => {'a', 'b'}
```



---

```bash
> _:startCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to [Start Case](https://en.wikipedia.org/wiki/Letter_case#Stylistic_or_specialised_usage).

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - A new string start-cased.

#### Example

```	bash
> _:startCase('--foo-bar--')   # => 'Foo Bar'
> _:startCase('fooBar')        # => 'Foo Bar'
> _:startCase('__FOO_BAR__')   # => 'FOO BAR'
```



---

```bash
> _:startsWith(str, target, [position=1])
```

<small>[source]() | v0.1-1</small>

Determine if `str` starts with `target`, starting at `position`.

#### Arguments

`string(str)` - The string to convert.
`string(target)` - The string  or regex pattern to search for.
`number(position)` - Starting position to search.

#### Returns

`boolean` - Returns `true` if string starts with target, else `false`.

#### Example

```bash
> _:startsWith('abc', 'a')      # => true
> _:startsWith('abc', 'b')      # => false
> _:startsWith('abc', 'b', 2)   # => true
```



---

```bash
> _:toLower(str)
```

<small>[source]() | v0.1-1</small>

Converts entire `str` to lower case.

> Uses native [`string.lower`](https://www.lua.org/manual/5.1/manual.html#pdf-string.lower) function.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - Returns new lower-cased string.

#### Example

```bash
> _:toLower('--Foo-Bar--')   # => '--foo-bar--'
> _:toLower('fooBar')        # => 'foobar'
> _:toLower('__FOO_BAR__')   # => '__foo_bar__'
```



---

```bash
> _:toUpper(str)
```

<small>[source]() | v0.1-1</small>

Converts entire `str` to upper case.

> Uses native [`string.upper`](https://www.lua.org/manual/5.1/manual.html#pdf-string.upper) function.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - Returns new upper-cased string.

#### Example

```bash
> _:toUpper('--foo-bar--')   # => '--FOO-BAR--'
> _:toUpper('fooBar')        # => 'FOOBAR'
> _:toUpper('__foo_bar__')   # => '__FOO_BAR__'
```



---

```bash
> _:trim(str, [pattern='%s+'])
```

<small>[source]() | v0.1-1</small>

Removes leading and trailing `pattern` of `str`.

#### Arguments

`string(str)` - The string to trim.
`string(pattern=' ')` - The string or regex pattern to trim.

#### Returns

`string` - Returns new trimmed string.

#### Example

```bash
> _:trim('  abc  ')            # => 'abc'
> _:trim('-_-abc-_-', '_-')    # => 'abc'
> _:trim('-_-abc-_-', '%p+')   # => 'abc'
```



---

```bash
> _:trimEnd(str, [pattern='%s+'])
```

<small>[source]() | v0.1-1</small>

Removes trailing `pattern` of `str`.

#### Arguments

`string(str)` - The string to trim.
`string(pattern=' ')` - The string or regex pattern to trim.

#### Returns

`string` - Returns new trimmed string.

#### Example

```bash
> _:trimEnd('  abc  ')         # => '  abc'
> _:trim('-_-abc-_-', '_-')    # => '-_-abc'
> _:trim('-_-abc-_-', '%p+')   # => '-_-abc'
```



---

```bash
_:trimStart(str, [pattern='%s+'])
```

<small>[source]() | v0.1-1</small>

Removes leading `pattern` of `str`.

#### Arguments

`string(str)` - The string to convert.
`string(pattern=' ')` - The string or regex pattern to trim.

#### Returns

`string` - Returns new trimmed string.

#### Example

```bash
> _:trimEnd('  abc  ')         # => 'abc  '
> _:trim('-_-abc-_-', '_-')    # => 'abc-_-'
> _:trim('-_-abc-_-', '%p+')   # => 'abc-_-'
```



---

```bash
> _:truncate(str, [options={}])
```

<small>[source]() | v0.1-1</small>

Truncates `str` with `options`.

#### Arguments

`string(str)` - The string to truncate.
`number([options.length=30])` - Maximum string length (including `omission`)
`string([options.separator=''])` - The string or regex pattern to truncate to.
`string([options.omission='...'])` - Omitted text indicator.

#### Returns

`string` - Returns new truncated string.

#### Example

```bash
> _:truncate('hi-diddly-ho there, neighborino')
  # => 'hi-diddly-ho there, neighbo...'
  
> _:truncate('hi-diddly-ho there, neighborino', {length = 24, separator = ' '})
  # => 'hi-diddly-ho...'
  
> _:truncate('hi-diddly-ho there, neighborino', {length = 24, separator = '[,?]%s+'})
  # => 'hi-diddly-ho there...'
  
> _:truncate('hi-diddly-ho there, neighborino', {omission= ' [...]'})
  # => 'hi-diddly-ho there, neig [...]'
```



---

```bash
> _:upperCase(str)
```

<small>[source]() | v0.1-1</small>

Converts `str` to space-separated, upper case string.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - Returns new space-separated, upper case string.

#### Example

```bash
> _:upperCase('--foo-bar')     # => 'FOO BAR'
> _:upperCase('fooBar')        # => 'FOO BAR'
> _:upperCase('__foo_bar__')   # => 'FOO BAR'
```



---

```bash
> _:upperFirst(str)
```

<small>[source]() | v0.1-1</small>

Converts first character in  `str` to  upper case, leaving the rest untouched.

#### Arguments

`string(str)` - The string to convert.

#### Returns

`string` - Returns new string with first character upper-cased.

#### Example

```bash
> _:upperFirst('foo')   # => 'Foo'
> _:upperFirst('FOO')   # => 'FOO'
```



---

```bash
> _:words(str, [pattern])
```

<small>[source]() | v0.1-1</small>

Converts `str` into table of words, using `pattern` as separator.

> Uses native [string.gmatch](https://www.lua.org/manual/5.1/manual.html#pdf-string.gmatch) function.

#### Arguments

`string(str)` - The string to convert.
`string([pattern='%a+'])` - 

#### Returns

`table` - Returns table of string segments.

#### Example

```bash
> _:words('lister, cat, & kryton')
  # => {'lister', 'cat', 'kryton'}
  
> _:words('lister, cat, & kryton', "[^,%s]+")
  # => {'lister', 'cat', '&', 'kryton'}
```

