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
        end)
    end)

    describe('_:concat(tabl, [values])', function()
        it('should create new table with new values included', function()
            assert.are.same(_:concat({1}, 2, {{3}, {4}, 5}), {1, 2, {3}, {4}, 5})
        end)
    end)

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

    -- describe('_:differenceBy(tabl, [values], [iteratee])', function()
    --     it('should create new `tabl` with only `values` not filtered out by `iteratee`', function()
    --         assert.are.same(_:differenceBy({2.1, 1.2}, {2.3, 3.4}, math.floor), {1.2})
    --     end)
    -- end)

    -- describe('_:differenceWith(tabl, [values], [comparator])', function()
    --     it('should create new `tabl` with only `values` passing `comparator`', function()

    --     end)
    -- end)

    describe('_:join(tabl, [separator=","])', function()
        it('should create string joined by `separator`', function()
            assert.are.equal(_:join({'a', 'b', 'c'}, '~'), 'a~b~c')
        end)
    end)
end)