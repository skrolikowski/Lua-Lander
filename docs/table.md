## Table Functions

```bash
> _:chunk(tabl, [size=1])
```

<small>[source]() | v0.1-1</small>

Splits elements of `tabl` into groups of `size`.

#### Arguments

`table(tabl)` - The table to chunk.
`number([size=1])` - Size of each group.

#### Returns

`table` - Returns new table of table chunks.

#### Example

```bash
> _:chunk({'a','b','c','d'}, 2)   # => {{'a','b'},{'c','d'}}
> _:chunk({'a','b','c','d'}, 3)   # => {{'a','b','c'},{'d'}}
```



---

```bash
> _:compact(tabl)
```

<small>[source]() | v0.1-1</small>

Splits elements of `tabl` into groups of `size`.

#### Arguments

`table(tabl)` - The table to chunk.
`number([size=1])` - Size of each group.

#### Returns

`table` - Returns new table of table chunks.

#### Example