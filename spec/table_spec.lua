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

    describe('_:compact(tabl)', function()
        it('should create new table with false-like values removed', function()
            assert.are.same(_:compact({0, 1, false, '', 2, nil, 3}),  {0, 1, '', 2, 3 })
            assert.are.same(_:compact({a = 1, 5, b = false, 'foo', c = true}),  {a = 1, 5, 'foo', c = true})
        end)
    end)

    -- describe('_:combine(keys, values)', function()
    --     it('should create new table with `keys` as keys and `values` as values', function()
    --         assert.are.same(_:compact({'a', 'b'},{'c','d'}),  {a = 'c', b = 'd'})
    --         assert.has.errors(function() _:compact({'a', 'b'},{'c','d', 'e'}) end)
    --     end)
    -- end)

    describe('_:flatten(tabl)', function()
        it('should create new table flattened one level deep', function()
            assert.are.same(_:flatten({1, 2, {3, {4}}, 5}), {1, 2, 3, {4}, 5})
        end)
    end)

    describe('_:flattenDeep(tabl)', function()
        it('should create new table, recursively flattened', function()
            assert.are.same(_:flattenDeep({1, 2, {3, {4}}, 5}), {1, 2, 3, 4, 5})
        end)
    end)

    -- describe('_:difference(tabl, [values])', function()
    --     it('should create new table with filtered values not included', function()
    --         assert.are.same(_:difference({2, 1}, {2, 3}), {1})
    --     end)
    -- end)

    describe('_:drop(tabl, [num])', function()
        it('should create new table of `tabl` with `num` dropped off the end', function()
            assert.are.same(_:drop({2, 1, 2, 3}, 1), {2, 1, 2})
            assert.are.same(_:drop({2, 1, 2, 3}, 3), {2})
        end)

        it('should create new table of `tabl` with `num` dropped off the beginning', function()
            assert.are.same(_:drop({2, 1, 2, 3}, -1), {1, 2, 3})
            assert.are.same(_:drop({2, 1, 2, 3}, -3), {3})
        end)
    end)



    describe('_:join(tabl, [separator=","])', function()
        it('should create string joined by `separator`', function()
            assert.are.equal(_:join({'a', 'b', 'c'}, '~'), 'a~b~c')
        end)
    end)

    describe('_:unique(tabl)', function()
        it('should create copy of `table`, without any duplicate values', function()
            assert.are.same(_:unique({'a', 'd', 'b', 'c', 'c', 'd'}), {'a', 'd', 'b', 'c'})
            assert.are.same(_:unique({a = 1, b = 2, c = 2, d = 3}), {a = 1, c = 2, d = 3})
        end)
    end)

    describe('_:resize(tabl, size)', function()
        it('should create new resized table', function()
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, 3), {'a', 'b', 'c'})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, 0), {})
            assert.has.errors(function() _:resize({'a', 'b', 'c', 'd'}, 5) end)
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, -1), {'d'})
            assert.are.same(_:resize({'a', 'b', 'c', 'd'}, -3), {'b', 'c', 'd'})
        end)
    end)
end)