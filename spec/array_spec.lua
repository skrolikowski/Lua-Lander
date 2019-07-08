--
package.path = "../?.lua;" .. package.path
require 'busted.runner'()
require 'init'
--

describe('Table Functions', function()
    describe('_:chunki(tabl, [size=1])', function()
        it('should split table into groups of provided size', function()
            assert.are.same(_:chunki({'a','b','c','d'}, 2), {{'a','b'},{'c','d'}})
            assert.are.same(_:chunki({'a','b','c','d'}, 3), {{'a','b','c'},{'d'}})
            -- will ignore named-indexes
            assert.are.same(_:chunki({'a','b',c=1,d=2}), {{'a'},{'b'}})
            assert.are.same(_:chunki({'a','b',c=1,d=2}, 4), {{'a','b'}})
        end)
    end)

    describe('_:differencei(tabl, other)', function()
        it('should create new table with filtered values not included', function()
            assert.are.same(_:differencei({2, 1}, {2, 3}), {1})
            assert.are.same(_:differencei({2, 1}, {2, 1}), {})
            assert.are.same(_:differencei({2, 1}, {4, 6}), {2, 1})
            -- will ignore named-indexes
            assert.are.same(_:differencei({1, 2, 8, a=3, b=4}, {2, 4}), {1, 8, a=3, b=4})
        end)
    end)

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

    describe('_:fill(tabl, value, [n=_:size(tabl)], [fromIndex=1])', function()
        it('should create new table, filled with `value` `n` times, starting at `fromIndex`', function()
            assert.are.same(_:fill({1, 2, 3, 4}, 8, 2, 4), {1, 2, 3, 8, 8})
            assert.are.same(_:fill({}, 'hello', 3, 2), {'hello', 'hello', 'hello'})
            -- will ignore named-indexes
            assert.are.same(_:fill({2, 1, 3, a=4, b=6}, 9, 4), {9, 9, 9, 9, a=4, b=6})
        end)
    end)

    describe('_:findIndex(tabl, predicate, [fromIndex=1])', function()
        it('should return first numeric index of `tabl` (starting at `fromIndex`), where `predicate` is truthy', function()
            assert.are.equals(_:findIndex({1, -2, 4, 7}, function(v, k) return v > 1 end), 3)
            assert.are.equals(_:findIndex({true, false, 'abc'}, 'isBoolean'), 1)
            assert.is_nil(_:findIndex({true, false, 'abc'}, 'isBoolean', 3))
            assert.is_nil(_:findIndex({'a', 'b', 'c'}, 'isBoolean'))
        end)
    end)

    describe('_:findLastIndex(tabl, predicate, [fromIndex=#tabl])', function()
        it('should return last numeric index of `tabl` (starting at `fromIndex`), where `predicate` is truthy', function()
            assert.are.equals(_:findLastIndex({1, -2, 4, 7}, function(v, k) return v > 1 end), 4)
            assert.are.equals(_:findLastIndex({true, false, 'abc'}, 'isBoolean'), 2)
        end)
    end)

    describe('_:head(tabl)', function()
        it('should return first numeric index of `tabl`, otherwise nil', function()
            assert.are.equals(_:head({c=10, 'a', 'b', 1}), 'a')
            assert.is_nil(_:head({}))
        end)
    end)

    describe('_:indexOf(tabl, value)', function()
        it('should return first occurrence of `tabl` with `value`, otherwise nil', function()
            assert.are.equals(_:indexOf({1, 5, 'r', 3}, 'r'), 3)
            assert.is_nil(_:indexOf({4, 2, 8, 1}, 3))
            -- will ignore named-indexes
            assert.are.equals(_:indexOf({c=10, 'a', 'b', 1}, 'a'), 1)
        end)
    end)

    describe('_:initial(tabl)', function()
        it('should create copy of `tabl` including all but last element, otherwise nil', function()
            assert.are.same(_:initial({1, 5, 'r', 3}), {1, 5, 'r'})
            assert.are.same(_:initial({4}), {})
            -- will ignore named-indexes
            assert.are.same(_:initial({c=10, 'a', 'b', 1}), {'a', 'b', c=10})
        end)
    end)

    describe('_:lastIndexOf(tabl, value)', function()
        it('should return first occurrence of `tabl` with `value`, otherwise nil', function()
            assert.are.equals(_:lastIndexOf({1, 1, 2, 2, 3, 3}, 2), 4)
            assert.is_nil(_:lastIndexOf({4, 2, 8, 1}, 3))
            -- will ignore named-indexes
            assert.are.equals(_:lastIndexOf({'a', 'b', 'a', c=10}, 'a'), 3)
        end)
    end)

    describe('_:join(tabl, [separator=","])', function()
        it('should create string joined by `separator`', function()
            assert.are.equal(_:join({'a', 'b', 'c'}, '~'), 'a~b~c')
            -- will ignore named-indexes
            assert.are.equal(_:join({3, 2, 5, a='x', b='y'}), '3,2,5')
        end)
    end)

    describe('_:mapi(tabl, iteratee)', function()
        it('should create copy of `table`, running `iteratee` on every element value', function()
            assert.are.same(_:mapi({'a', 'b', 'c'}, string.upper), {'A', 'B', 'C'})
            assert.are.same(_:mapi({a='x', b='y', 'c', 2, 1}, 'isNumber'), {a='x', b='y', false, true, true})
        end)
    end)

    describe('_:nth(tabl, n)', function()
        it('should return n-th index of `tabl`, otherwise nil', function()
            assert.are.equals(_:nth({'a', 'b', 1, c=10}, 2), 'b')
            assert.is_nil(_:nth({1, 2, 3, b=1, c=2}, 4))
            assert.are.equals(_:nth({1, 2, 3, b=1, c=2}, -2), 2)
        end)
    end)

    describe('_:tail(tabl)', function()
        it('should return last numeric index of table, otherwise nil', function()
            assert.are.equals(_:tail({'a', 'b', 1, c=10}), 1)
            assert.is_nil(_:tail({}))
        end)
    end)

    describe('_:without(tabl, ...)', function()
        it('should create new table of values in `tabl` excluding any elements with value in `...`', function()
            assert.are.same(_:without({1,2,3,3,5,6,6}, 3, 6), {1,2,5})
            assert.are.same(_:without({1,2,3,3,5,6,6}), {1,2,3,3,5,6,6})
            assert.are.same(_:without({1,2,3,3,5,6,6}, 1, 2, 3, 5, 6), {})
            -- will ignore named-indexes
            assert.are.same(_:without({'a','b','c',d=10}, 'b', 10), {'a','c',d=10})
            assert.are.same(_:without({'a','b','c',d=10}, 'a', 'b', 'c'), {d=10})
        end)
    end)
end)