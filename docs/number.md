## Number Functions

```bash
> _:clamp(num, min, max)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/number.lua#L11-L20)</small>

Performs clamp on `num` so it fits between `min` and `max` values.

#### Arguments

`number(num)` - The number to modify.
`number(min)` - Minimum expected  value.
`number(max)` - Maximum expected value.

#### Returns

`number` - Returns clamped value.

#### Example

```bash
> _:clamp(-5, -1, 2)   # => -1
> _:clamp(0, -1, 2)    # => 0
> _:clamp(3, -1, 2)    # => 2
```



---

```bash
> _:lerp(value, min, max)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/number.lua#L30-L39)</small>

Performs linear interpolation on a `number` between `min` and `max` values.

#### Arguments

`number(num)` - The number to modify.
`number(min)` - Minimum value.
`number(max)` - Maximum value.

#### Returns

`number` - Returns linear interpolated value.

#### Example

```bash
> _:lerp(0.3, 10, 20)    # => 13
> _:lerp(0.75, 0, 100)   # => 75
```



---

```bash
> _:mapTo(num, minSource, maxSource, minDest, maxDest)
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/number.lua#L51-L65)</small>

Maps `num` from source range (`minSource/maxSource`) to destination range (`minDest/maxDest`).

#### Arguments

`number(num)` - The number to map.
`number(minSource)` - Minimum value in source range.
`number(maxSource)` - Maximum value in source range.
`number(minDest)` - Minimum value in destination range.
`number(maxDest)` - Maximum value in destination range.

#### Returns

`number` - Returns mapped value.

#### Example

```bash
> _:mapTo(0.5, 1, 2, 10, 20)   # => 5
> _:mapTo(9, 0, 1, 0, 25)      # => 225
```



---

```
> _:norm(num, [min=0], [max=1])
```

<small>[source](https://github.com/skrolikowski/Lua-Lander/blob/master/mods/number.lua#L74-L80)</small>

Computes normalized `num` between `min/max` range.

#### Arguments

`number(num)` - The number to map.
`number(min)` - Minimum value to normalize with.
`number(max)` - Maximum value to normalize with.

#### Returns

`number` - Returns normalized value.

#### Example

```bash
> _:norm(5, 0, 10)    # => 0.5
> _:norm(5, 4, 8)     # => 1.25
> _:norm(9, 4, 8)     # => 0.25
```

