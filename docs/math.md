## Math Functions

```bash
> _:abs(num)
```

<small>[source]() | v0.1-1</small>

Returns absolute value of `num`.

> Uses native [`math.abs`](https://www.lua.org/manual/5.1/manual.html#pdf-math.abs) function.

#### Arguments

`number(num)` - The number to modify.

#### Returns

`number` - Returns absolute value.

#### Example

```bash
> _:abs(4)    # => 4
> _:abs(-4)   # => 4
```



---

```bash
> _:add(...)
```

<small>[source]() | v0.1-1</small>

Adds all numbers and returns sum.

#### Arguments

`number(...)` - Numbers to add.

#### Returns

`number` - Sum of all numbers.

#### Example

```bash
> _:add(4, 6)      # => 10
> _:add(4, 5, 3)   # => 12
```



---

```bash
_:ceil(num, [precision=0])
```

<small>[source]() | v0.1-1</small>

Rounds up `num` to desired `precision`.

#### Arguments

`number(num)` - Number to modify.
`number([precision=0])` - Rounding precision.

#### Returns

`number` - Returns rounded number.

#### Example

```bash
> _:ceil(4.006)      # => 5
> _:ceil(6.004, 2)   # => 6.01
> _:ceil(6040, -2)   # => 6100
```



---

```bash
> _:divide(...)
```

<small>[source]() | v0.1-1</small>

Divides series of numbers and returns result.

#### Arguments

`number(...)` - Numbers to divide.

#### Returns

`number` - Returns divided result.

#### Example

```bash
> _:divide(6, 4)      # => 1.5
> _:divide(6, 3, 2)   # => 1
```



---

```bash
> _:floor(num, [precision=0])
```

<small>[source]() | v0.1-1</small>

Rounds down `num` to desired `precision`.

#### Arguments

`number(num)` - Number to modify.
`number([precision=0])` - Rounding precision.

#### Returns

`number` - Returns rounded number.

#### Example

```bash
> _:floor(4.006)      # => 4
> _:floor(0.046, 2)   # => 0.04
> _:floor(4060, -2)   # => 4000
```



---

```bash
> _:max(...)
```

<small>[source]() | v0.1-1</small>

Finds max in sequence of numbers.

#### Arguments

`number(...)` - Numbers to compare.

#### Returns

`number` - Returns maximum value.

#### Example

```bash
> _:max(4, 2, 8, 6)   # => 8
```



---

```bash
> _:maxBy(tabl, [iteratee])
```

<small>[source]() | v0.1-1</small>

Finds max in `tabl` of numbers, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`table(tabl)` - Table of numbers to compare.
`function([iteratee])` - Function to invoke per element.

#### Returns

`number` - Returns maximum value.

#### Example

```bash
> _:maxBy({4, 2, 8, 6}, function(v) return v * 2 end)   # => 16
```



---

```bash
> _:mean(...)
```

<small>[source]() | v0.1-1</small>

Computes mean of sequence of numbers.

#### Arguments

`number(...)` - Numbers to compare.

#### Returns

`number` - Returns mean value.

#### Example

```bash
> _:mean(4, 2, 8, 6)   # => 5
```



---

```bash
> _:meanBy(tabl, [iteratee])
```

<small>[source]() | v0.1-1</small>

Computes mean of `tabl` of numbers, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`table(tabl)` - Table of numbers to compare.
`function([iteratee])` - Function to invoke per element.

#### Returns

`number` - Returns mean value.

#### Example

```bash
> _:meanBy({4, 2, 8, 6}, function(v) return v * 2 end)   # => 10
```



---

```bash
> _:min(...)
```

<small>[source]() | v0.1-1</small>

Computes minimum of sequence of numbers.

#### Arguments

`table(tabl)` - Numbers to compare.

#### Returns

`number` - Returns minimum value.

#### Example

```bash
> _:min(4, 2, 8, 6)   # => 2
> _:min()             # => nil
```



---

```bash
> _:minBy(tabl, iteratee)
```

<small>[source]() | v0.1-1</small>

Computes minimum of sequence of numbers, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`table(tabl)` - Table of numbers to compare.
`function([iteratee])` - Function to invoke per element.

#### Returns

`number` - Returns minimum value.

#### Example

```bash
> _:minBy({4, 2, 8, 6}, function(v) return v * 2 end)   # => 4
```



---

```bash
> _:multiply(...)
```

<small>[source]() | v0.1-1</small>

Multiplies sequence of numbers.

#### Arguments

`number(...)` - Numbers to multiply

#### Returns

`number` - Returns multiplied result.

#### Example

```bash
> _:multiply(2, 3)        # => 6
> _:multiply(10, -2, 3)   # => -60
```



---

```bash
> _:multiplyBy(tabl, [iteratee])
```

<small>[source]() | v0.1-1</small>

Multiplies series of numbers and returns result, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`table(tabl)` - Table of numbers to compare.
`function([iteratee])` - Function to invoke per element.

#### Returns

`number` - Returns multiplied result.

#### Example

```bash
> _:multiplyBy({3, -2, 4}, function(v) return v * 2 end)   # => -192
```



---

```bash
> _:round(num, [precision=0])
```

<small>[source]() | v0.1-1</small>

Computes `num` rounded to `precision`.

#### Arguments

`number(num)` - Numbers to round.
`number(precision=0)` - Units of precision.

#### Returns

`number` - Returns rounded number.

#### Example

```bash
> _:round(4.006)      # => 4
> _:round(4.006, 2)   # => 4.01
> _:round(4060, -2)   # => 4100
```



---

```bash
> _:subtract(...)
```

<small>[source]() | v0.1-1</small>

Subtracts series of numbers and returns result.

#### Arguments

`number(...)` - Numbers to subtract

#### Returns

`number` - Returns subtracted result.

#### Example

```bash
> _:subtract(2, 3)           # => -1
> _:subtract(10, -2, 3, 0)   # => 9
```



---

```bash
> _:subtractBy(tabl, [iteratee])
```

<small>[source]() | v0.1-1</small>

Subtracts `tabl` of  numbers, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`table(tabl)` - Table of numbers to compare.
`function([iteratee])` - Function to invoke per element.

#### Returns

`number` - Returns subtracted result.

#### Example

```bash
> _:subtractBy({3, -2, 4}, function(v) return v * 2 end)   # => 2
```



---

```bash
> _:sum(...)
```

<small>[source]() | v0.1-1</small>

Sums sequence of numbers.

#### Arguments

`number(...)` - Numbers to sum

#### Returns

`number` - Returns summed result.

#### Example

```bash

```



---

```bash
> _:sum(tabl, [iteratee])
```

<small>[source]() | v0.1-1</small>

Sums sequence of numbers, with every element invoked by `iteratree`.

> Note: Every element of `tabl` will invoke `iteratree`, if provided.

#### Arguments

`number(...)` - Numbers to sum

#### Returns

`number` - Returns summed result.

#### Example

```bash
> _:sum(2, 3)         # => 5
> _:sum(2, 3, 4, 5)   # => 14
```



---

```bash
> _:toDeg(rad)
```

<small>[source]() | v0.1-1</small>

Converts `rad` to degrees.

> Uses native `math.rad` function.

#### Arguments

`number(rad)` - Radian value.

#### Returns

`number` - Returns degree value.

#### Example

```bash
> _:toDeg(math.pi / 2)   # => 90
> _:toDeg(math.pi / 3)   # => 60
```



---

```bash
> _:toRad(deg)
```

<small>[source]() | v0.1-1</small>

Converts `deg` to radians.

> Uses native `math.deg` function.

#### Arguments

`number(deg)` - degree value.

#### Returns

`number` - Returns radian value.

#### Example

```bash
> _:toRad(30)    # => 0.523599
> _:toRad(180)   # => 3.141593
```

