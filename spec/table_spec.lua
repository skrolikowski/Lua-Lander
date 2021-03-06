--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Table Functions', function()
    describe('_:chunk(tabl, [size=1])', function()
        it('should split table into groups of provided size', function()
            assert.are.same(_:chunk({'a','b','c','d'}, 2), {{'a','b'},{'c','d'}})
            assert.are.same(_:chunk({'a','b','c','d'}, 3), {{'a','b','c'},{'d'}})
        end)
    end)

    describe('_:combine(keys, values)', function()
        it('should create new table with `keys` as keys and `values` as values', function()
            assert.are.same(_:combine({'a', 'b'}, {'c','d'}), {a = 'c', b = 'd'})
            assert.are.same(_:combine({1,2,3}, {5,4,3}), {5,4,3})
            assert.are.same(_:combine({1,2,3,a='x',b='y'}, {5,4,3,c='w',d='z'}), {5,4,3,x='w',y='z'})
            assert.has.errors(function() _:combine({'a', 'b'}, {'c','d', 'e'}) end)
        end)
    end)

    describe('_:compact(tabl)', function()
        it('should create new table with false-like values removed', function()
            assert.are.same(_:compact({0, 1, false, '', 2, nil, 3}),  {0, 1, '', 2, 3 })
            assert.are.same(_:compact({a = 1, 5, b = false, 'foo', c = true}),  {a = 1, 5, 'foo', c = true})
        end)
    end)

    describe('_:conformsTo(tabl, source)', function()
        it('should create new table with `keys` as keys and `values` as values', function()
            assert.are.same(_:conformsTo({a=2,b=4,c=6}, {b = function(v,k) return v > 2 end}), true)
            assert.are.same(_:conformsTo({a=2,b=4,c=6}, {b = function(v,k) return v < 2 end}), false)
            assert.are.same(_:conformsTo({1,2,3,a='x',b='y'}, {'isString'}), false)
            assert.are.same(_:conformsTo({1,2,3,a='x',b='y'}, {'isNumeric'}), true)
        end)
    end)

    describe('_:difference(tabl, other)', function()
        it('should create new table with filtered values not included', function()
            assert.are.same(_:difference({x=2, y=1}, {x=3, y=4}), {x=2, y=1})
            assert.are.same(_:difference({x=3, y=1}, {x=3, y=4}), {y=1})
            assert.are.same(_:difference({x=2, y=1}, {w=2, z=1}), {x=2, y=1})
            -- will ignore named-indexes
            --assert.are.same(_:differencei({1, 2, 8, a=3, b=4}, {2, 4}), {1, 8, a=3, b=4})
        end)
    end)

    describe('_:flatten(tabl)', function()
        it('should create new table flattened one level deep', function()
            assert.are.same(_:flatten({1, 2, {3, {4}}, 5}), {1, 2, 3, {4}, 5})
            assert.are.same(_:flatten({1, {2, {3, {4}}, 5}}), {1, 2, {3, {4}}, 5})
        end)
    end)

    describe('_:flattenDeep(tabl)', function()
        it('should create new table, recursively flattened', function()
            assert.are.same(_:flattenDeep({1, 2, {3, {4}}, 5}), {1, 2, 3, 4, 5})
            assert.are.same(_:flattenDeep({1, {2, {3, {4}}, 5}}), {1, 2, 3, 4, 5})
        end)
    end)

    describe('_:filter(tabl, iteratee)', function()
        it('should create new table, with values from `tabl` filtering out values that do not pass `iteratee`', function()
            assert.are.same(_:filter({1, false, nil, 'abc'}, 'isTruthy'), {1, 'abc'})
            assert.are.same(_:filter({2, 1, 3, a=4, b=6}, function(v, k) return _:isNumber(k) end), {2, 1, 3})
            assert.are.same(_:filter({1, 2, 3, 4, 5}, function(v, k) return v > 3 end), {4, 5})
        end)
    end)

    describe('_:find(tabl, predicate)', function()
        it('should return first element in `tabl` that `predicate` returns truthy for, otherwise nil', function()
            assert.are.same({_:find({a=1,b=2,c=2,d=4,e=5}, function(v, k) return v == 2 end)}, {2, 'b'})
            assert.is_nil(_:find({1, 2, 3, 4, 5}, 'isString'))
        end)
    end)

    describe('_:keys(tabl)', function()
        it('should create a new table with keys from `tabl`', function()
            assert.are.same(_:keys({'a', 'b', 'c'}), {1, 2, 3})
            assert.are.same(_:keys({a=1, b=2, c=3}), {'a', 'b', 'c'})
        end)
    end)

    describe('_:map(tabl, iteratee)', function()
        it('should create copy of `table`, running `iteratee` on every element value', function()
            assert.are.same(_:map({'a', 'b', 'c'}, string.upper), {'A', 'B', 'C'})
            assert.are.same(_:map({a='x', b='y', c=2, d='z'}, 'isString'), {a=true, b=true, c=false, d=true})
        end)
    end)

    describe('_:merge(...)', function()
        it('should create new table merging all elements of `...` tables', function()
            assert.are.same(_:merge({1, 2, 3, 4}, {2, 3, 4, 5}), {1, 2, 3, 4, 2, 3, 4, 5})
            assert.are.same(_:merge({a=1, b=2, 3, 4}, {c=2, b=3, 4, 5}), {3, 4, 4, 5, a=1, b=3, c=2})
        end)
    end)

    describe('_:resize(tabl, size)', function()
        it('should create new resized table', function()
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, 3), {'a', 'b', 'c'})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, 0), {})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, 5), {'a', 'b', 'c', 'd'})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, -1), {'d'})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, -3), {'b', 'c', 'd'})
        end)
    end)

    describe('_:unique(tabl)', function()
        it('should create copy of `table`, without any duplicate values', function()
            assert.are.same(_:unique({'a', 'd', 'b', 'c', 'c', 'd'}), {'a', 'd', 'b', 'c'})
            assert.are.same(_:unique({a = 1, b = 2, c = 2, d = 3}), {a = 1, b = 2, d = 3})
        end)
    end)

    describe('_:values(tabl)', function()
        it('should create a new table with values from `tabl`', function()
            assert.are.same(_:values({'a', 'b', 'c'}), {'a', 'b', 'c'})
            assert.are.same(_:values({a=1, b=2, c=3}), {1, 2, 3})
        end)
    end)
end)