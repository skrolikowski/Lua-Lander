## Color Functions

```bash
> _:color(...)
```

<small>[source]() | v0.1-1</small>

Returns r, g, b color component values between [0, 1].

> Default color palettes inspired by [tailwindcss](https://tailwindcss.com/docs/customizing-colors/#default-color-palette).

#### Arguments

`mixed(...)` - Input to colorify.

> 0 args    => Random color.
> 1 arg      => Color by hex or name.
> 2+ args  => Mix multiple colors (by hex or name) together taking mean of each component.

#### Returns

`number(r, g, b)` - Returns r, g, b color values.

#### Example

```bash
> _:color('black')            # => 0 0 0
> _:color('white')            # => 1 1 1
> _:color('green-500')        # => 0.28 0.73 0.47
> _:color('#F6AD55')          # => 0.96 0.67 0.33
> _:color('black', 'white')   # => 0.5 0.5 0.5
```

